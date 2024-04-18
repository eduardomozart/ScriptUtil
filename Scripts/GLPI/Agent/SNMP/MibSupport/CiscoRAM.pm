package GLPI::Agent::SNMP::MibSupport::CiscoRAM;

use strict;
use warnings;

use parent 'GLPI::Agent::SNMP::MibSupportTemplate';

use GLPI::Agent::Tools;
use GLPI::Agent::Tools::SNMP;

use constant    priority => 5;

# See CISCO-SMI
use constant    cisco       => '.1.3.6.1.4.1.9';

# See CISCO-MEMORY-POOL
use constant    ciscoMemoryPoolUsed     => cisco . '.9.48.1.1.1.5';
use constant    ciscoMemoryPoolFree     => cisco . '.9.48.1.1.1.6';

our $mibSupport = [
    {
        name        => "cisco",
        sysobjectid => getRegexpOidMatch(cisco)
    }
];

sub run {
	my ($self) = @_;

	my $device = $self->device
        or return;
	
	# my $ramFree = $self->get(ciscoMemoryPoolFree.'.1');
	# Considers Processor (System RAM) and 
	# I/O (Network Ports buffer, about 3%-5% of DRAM allocated) 
	# in RAM calculation.
	my $ramFree = 0;
	my $ramsFree = $self->walk(ciscoMemoryPoolFree) || {};
	if ($ramsFree) {
        	foreach my $index (keys(%{$ramsFree})) {
			$ramFree += $ramsFree->{$index};
        	}
	}
	$device->{logger}->debug("Cisco Free RAM alloc. (Bytes): " . $ramFree);
	
	# Cisco doesn't provides RAM usage (%), so let's calculate it
	# based on Free RAM (allocated).
	# my $ramUsed = $self->get(ciscoMemoryPoolUsed.'.1');
	# Considers Processor (System RAM) and 
	# I/O (Network Ports buffer, about 3%-5% of DRAM allocated) 
	# in RAM calculation.
	my $ramUsed = 0;
	my $ramsUsed = $self->walk(ciscoMemoryPoolUsed) || {};
	if ($ramsUsed) {
		foreach my $index (keys(%{$ramsUsed})) {
			$ramUsed += $ramsUsed->{$index};
		}
	}
	$device->{logger}->debug("Cisco Used RAM (Bytes): " . $ramUsed);
		
	my $ramTotal = sprintf "%.0f", ($ramFree + $ramUsed) / (1000 * 1000);
	$device->{logger}->debug("Cisco Free + Used RAM alloc. (Mio): " . $ramTotal);
	
	# $device->{INFO}->{MEMORY} = int($ramFree / (1000 * 1000))
	$device->{INFO}->{MEMORY} = int(($ramFree / ($ramFree + $ramUsed)) * 100)
		if defined($ramFree) && isInteger($ramFree) && defined($ramUsed) && isInteger($ramUsed);
	$device->{logger}->debug("Cisco Used RAM alloc. (%) [MEMORY]: " . $device->{INFO}->{MEMORY});
	
	if(!(defined($device->{INFO}->{RAM}))) {
		# Cisco already provides Total system RAM through
		# OID .1.3.6.1.4.1.9.3.6.6.0.
		# But the code below can be used as an workaround if
		# it's not. It estimates the RAM size based on allocated
		# memory to process and I/O.
		
		# e.g. Cisco 2960-C has 128M and allocates about 80Mio
		# for the system itself, so we attempt to guess switch RAM
		# size based on that. E.g. If more than 64Mio is allocated
		# to the system, it will set RAM to 128Mio.
		my $power = 1;
		while($power < $ramTotal) {
			$power*=2;
		}
	
		$device->{INFO}->{RAM} = $power
			if defined($ramFree) && isInteger($ramFree) && defined($ramUsed) && isInteger($ramUsed);
		$device->{logger}->debug("Cisco [RAM] (Mio): " . $device->{INFO}->{RAM});
	}
}

1;

__END__

=head1 NAME

GLPI::Agent::SNMP::MibSupport::Cisco - Inventory module to enhance Cisco devices support.

=head1 DESCRIPTION

The module enhances Cisco support.
