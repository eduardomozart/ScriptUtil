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
	my $ramFree = 0;
	my $ramsFree = $self->walk(ciscoMemoryPoolFree) || {};
	if ($ramsFree) {
        	foreach my $index (keys(%{$ramsFree})) {
			$ramFree += $ramsFree->{$index};
        	}
	}
	$device->{logger}->debug("Cisco Free RAM: " . $ramFree);
	
	# $device->{INFO}->{MEMORY} = int(($ramFree / ($ramFree + $ramUsed)) * 100);
	$device->{INFO}->{MEMORY} = int($ramFree / (1000 * 1000)) 
		if defined($ramFree) && isInteger($ramFree);
	$device->{logger}->debug("Cisco MEMORY: " . $device->{INFO}->{MEMORY});
	
	if(!(defined($device->{INFO}->{RAM}))) {
		# my $ramUsed = $self->get(ciscoMemoryPoolUsed.'.1');
		my $ramUsed = 0;
		my $ramsUsed = $self->walk(ciscoMemoryPoolUsed) || {};
		if ($ramsUsed) {
			foreach my $index (keys(%{$ramsUsed})) {
				$ramUsed += $ramsUsed->{$index};
			}
		}
		$device->{logger}->debug("Cisco Used RAM: " . $ramUsed);
	
		$device->{INFO}->{RAM} = sprintf "%.0f", ($ramFree + $ramUsed) / (1000 * 1000)
			if defined($ramFree) && isInteger($ramFree) && defined($ramUsed) && isInteger($ramUsed);
		$device->{logger}->debug("Cisco RAM: " . $device->{INFO}->{RAM});
	}
}

1;

__END__

=head1 NAME

GLPI::Agent::SNMP::MibSupport::Cisco - Inventory module to enhance Cisco devices support.

=head1 DESCRIPTION

The module enhances Cisco support.
