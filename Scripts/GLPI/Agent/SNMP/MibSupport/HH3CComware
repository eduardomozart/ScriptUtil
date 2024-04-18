package GLPI::Agent::SNMP::MibSupport::HH3CComware;

use strict;
use warnings;

use parent 'GLPI::Agent::SNMP::MibSupportTemplate';

use GLPI::Agent::Tools;
use GLPI::Agent::Tools::SNMP;

use constant    priority => 5;

# See H3C-SMI
use constant    hh3c     => '.1.3.6.1.4.1.25506';

# See HH3C-ENTITY-EXT-MIB
use constant    hh3cEntityExtCpuUsage   => hh3c . '.2.6.1.1.1.1.6';
use constant    hh3cEntityExtMemUsage   => hh3c . '.2.6.1.1.1.1.8';
use constant    hh3cEntityExtMemSize    => hh3c . '.2.6.1.1.1.1.10';


our $mibSupport = [
    {
        name        => "HH3CComware",
        sysobjectid => getRegexpOidMatch(hh3c)
    }
];

sub run {
	my ($self) = @_;

	my $device = $self->device
        or return;
	
	# https://certifiedgeek.weebly.com/blog/hp-comware-snmp-mib-for-cpu-memory-and-temperature
	if(!(defined($device->{INFO}->{CPU}))) {
		# my $ramUsagePercent = $self->get(hh3cEntityExtCpuUsage.'.65');
		my $nCpuUsagePercentIndexes = 0;
		my $cpuUsagePercent = 0;
		my $cpusUsagePercent = $self->walk(hh3cEntityExtCpuUsage) || {};
		if ($cpusUsagePercent) {
				foreach my $index (keys(%{$cpusUsagePercent})) {
					$cpuUsagePercent += $cpusUsagePercent->{$index};
					
					$nCpuUsagePercentIndexes += 1
						if ($cpusUsagePercent->{$index} > 0);
				}
		}
		
		# RAM Usage (%) can return multiple values on switch stacks (IRF),
		# so we sum all of them and divide by the number of valid
		# indexes we found to calculate RAM usage average on stack.
		$device->{logger}->debug("Comware number of valid CPU Usage (%) indexes: " . $nCpuUsagePercentIndexes);
		my $cpuUsagePercentAverage = int($cpuUsagePercent / $nCpuUsagePercentIndexes);
		
		$device->{INFO}->{CPU} = $cpuUsagePercentAverage
			if defined($cpuUsagePercent) && isInteger($cpuUsagePercent);
		$device->{logger}->debug("Comware CPU Usage Average (%) [CPU]: " . $device->{INFO}->{CPU});
	}
	
	if(!(defined($device->{INFO}->{RAM}))) {
		# my $ramTotal = $self->get(hh3cEntityExtMemSize.'.65');
		my $nRamTotalIndexes = 0;
		my $ramTotal = 0;
		# my $ramTotalStack = 0;
		my $ramsTotal = $self->walk(hh3cEntityExtMemSize) || {};
		if ($ramsTotal) {
			foreach my $index (keys(%{$ramsTotal})) {
				if ($nRamTotalIndexes == 0) {
					# On switch Stacks (IRF), read only member slot #1 memory.
					# It assumes the first valid index refers to switch member slot #1,
					# but I'm not sure if it's true.
					$ramTotal = $ramsTotal->{$index};
				}
				# $ramTotalStack += $ramsTotal->{$index};
				$nRamTotalIndexes += 1
					if ($ramsTotal->{$index} > 0);
			}
		}
		# $device->{logger}->debug("Comware total number of RAM indexes: " . keys(%{$ramsTotal}));
		$device->{logger}->debug("Comware number of valid RAM indexes: " . $nRamTotalIndexes);
		$ramTotal = int($ramTotal / (1000 * 1000));
		
		# HH3C-ENTITY-EXT-MIB doesn't seems to provide a
		# OID for total system memory, only system alocated to
		# the system, e.g. A5120 has 128M and allocates about 67Mio
		# for the system itself, so we attempt to guess switch RAM
		# size based on that. E.g. If more than 64Mio is allocated
		# to the system, it will set RAM to 128Mio.
		my $power = 1;
		while($power < $ramTotal) {
			$power*=2;
		}
		
		$device->{INFO}->{RAM} = $power
			if defined($ramTotal) && isInteger($ramTotal);
		$device->{logger}->debug("Comware [RAM]: " . $device->{INFO}->{RAM});
	}
	
	if(defined($device->{INFO}->{RAM})) {
		# HH3C doesn't seems to provide free RAM memory (Mio)
		# so we parse RAM usage (%).
		
		# my $ramUsagePercent = $self->get(hh3cEntityExtMemUsage.'.65');
		my $nRamUsagePercentIndexes = 0;
		my $ramUsagePercent = 0;
		my $ramsUsagePercent = $self->walk(hh3cEntityExtMemUsage) || {};
		if ($ramsUsagePercent) {
				foreach my $index (keys(%{$ramsUsagePercent})) {
					$ramUsagePercent += $ramsUsagePercent->{$index};
					
					$nRamUsagePercentIndexes += 1
						if ($ramsUsagePercent->{$index} > 0);
				}
		}
		
		# RAM Usage (%) can return multiple values on switch stacks (IRF),
		# so we sum all of them and divide by the number of valid
		# indexes we found to calculate RAM usage average on stack.
		$device->{logger}->debug("Comware number of valid RAM Usage (%) indexes: " . $nRamUsagePercentIndexes);
		my $ramUsagePercentAverage = int($ramUsagePercent / $nRamUsagePercentIndexes);
		
		$device->{INFO}->{MEMORY} = $ramUsagePercentAverage
			if defined($ramUsagePercent) && isInteger($ramUsagePercent);
		$device->{logger}->debug("Comware RAM Usage Average (%) [MEMORY]: " . $device->{INFO}->{MEMORY});
	}
}

1;

__END__

=head1 NAME

GLPI::Agent::SNMP::MibSupport::HH3CComware - Inventory module to enhance HP Comware HH3C devices support.

=head1 DESCRIPTION

The module enhances HP Comware HH3C support.
