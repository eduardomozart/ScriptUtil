package GLPI::Agent::SNMP::MibSupport::UbntCPURAM;

use strict;
use warnings;

use parent 'GLPI::Agent::SNMP::MibSupportTemplate';

use GLPI::Agent::Tools;
use GLPI::Agent::Tools::SNMP;

# See UBNT-MIB

use constant ubnt              => '.1.3.6.1.4.1.41112';

# See HOST-RESOURCES-V2-MIB

use constant hr              => '.1.3.6.1.2.1.25';

use constant hrProcessorLoad => hr . '.3.3.1.2';

# See UCD-SNMP-MIB

use constant ucd             => '.1.3.6.1.4.1.2021';

use constant memTotalReal    => ucd . '.4.5.0';
use constant memAvailReal    => ucd . '.4.21.0';

our $mibSupport = [
    {
        name    => "ubnt cpuram",
		sysobjectid => getRegexpOidMatch(ubnt)
    }
];

sub run {
    my ($self) = @_;
	
	my $device = $self->device
        or return;
	
	if(!(defined($device->{INFO}->{CPU}))) {
		my $hrProcessorLoadTotal = 0;
		my $hrProcessorLoadIndexes = 0;
		my $hrProcessorLoads = $self->walk(hrProcessorLoad) || {};
		if ($hrProcessorLoads) {
			foreach my $index (keys(%{$hrProcessorLoads})) {
				$hrProcessorLoadTotal += $hrProcessorLoads->{$index};
				$hrProcessorLoadIndexes += 1;
			}
		}
		$device->{INFO}->{CPU} = int($hrProcessorLoadTotal / $hrProcessorLoadIndexes);
		$device->{logger}->debug("Ubnt [CPU] (%): " . $device->{INFO}->{CPU});
	}
	
	my $memTotalRealMio = 0;
	if(!(defined($device->{INFO}->{RAM}))) {
		$memTotalRealMio = getCanonicalMemory($self->get(memTotalReal) . " kB");
		$device->{logger}->debug("Ubnt RAM Real (Mio): " . $memTotalRealMio);
		
		my $power = 1;
		while($power < $memTotalRealMio) {
			$power*=2;
		}
		
		$device->{INFO}->{RAM} = $power;
		$device->{logger}->debug("Ubnt [RAM] (Mio): " . $device->{INFO}->{RAM});
	}
	
	# if not defined or if it's higher than 100%
	if(!(defined($device->{INFO}->{MEMORY})) || (defined($device->{INFO}->{MEMORY}) && $device->{INFO}->{MEMORY} > 100)) {
		if(defined($device->{INFO}->{RAM}) && $device->{INFO}->{RAM} > 0) {
			if ($memTotalRealMio == 0) {
				$memTotalRealMio = $device->{INFO}->{RAM};
			}
		
			my $memAvailRealMio = getCanonicalMemory($self->get(memAvailReal) . " kB");
			$device->{INFO}->{MEMORY} = int(($memAvailRealMio / $memTotalRealMio) * 100);
			$device->{logger}->debug("Ubnt [MEMORY] (%): " . $device->{INFO}->{MEMORY});
		}
	}
}

1;

__END__

=head1 NAME

GLPI::Agent::SNMP::MibSupport::HOST-RESOURCES-V2-MIB - Inventory module for Ubnt

=head1 DESCRIPTION

This module enhances Ubnt devices support.
