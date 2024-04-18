package GLPI::Agent::SNMP::MibSupport::ArubaCPURAM;

use strict;
use warnings;

use parent 'GLPI::Agent::SNMP::MibSupportTemplate';

use GLPI::Agent::Tools;
use GLPI::Agent::Tools::SNMP;

# See Q-BRIDGE-MIB
use constant    dot1qTpFdbStatus => '.1.3.6.1.2.1.17.7.1.2.2.1.3';

# See ARUBA-MIB
use constant    aruba   => '.1.3.6.1.4.1.14823' ;

# See AI-AP-MIB
use constant    aiMIB   => aruba . '.2.3.3.1' ;

use constant    aiAPCPUUtilization               => aiMIB . '.2.1.1.7';
use constant    aiAPMemoryFree	                 => aiMIB . '.2.1.1.8';
use constant    aiAPTotalMemory	                 => aiMIB . '.2.1.1.10';

our $mibSupport = [
    {
        name        => "aruba cpuram",
        sysobjectid => getRegexpOidMatch(aruba)
    }
];

sub _this {
    my ($self) = @_;

    unless ($self->{_this}) {
        # Find reference to our device
        my $dot1qTpFdbStatus = $self->walk(dot1qTpFdbStatus);
        if ($dot1qTpFdbStatus) {
            my ($subkey) = first {
                $dot1qTpFdbStatus->{$_} eq '4' } keys(%{$dot1qTpFdbStatus});
            my ($extracted) = $subkey =~ /^\d+\.(.*)$/;
            $self->{_this} = $extracted if $extracted;
        }
    }

    return $self->{_this};
}

sub run() {
	my ($self) = @_;
	
	my $this = $self->_this
        or return;
	
	my $device = $self->device
        or return;
		
	if(!(defined($device->{INFO}->{CPU}))) {
		$device->{INFO}->{CPU} = $self->get(aiAPCPUUtilization.'.'.$this);
		$device->{logger}->debug("Aruba AP [CPU] (%): " . $device->{INFO}->{CPU});
	}
	
	my $ramTotal = int($self->get(aiAPTotalMemory.'.'.$this) / (1000 * 1000));
	$device->{logger}->debug("Aruba AP RamTotal (Mio): " . $ramTotal);
		
	if(!(defined($device->{INFO}->{RAM}))) {
		my $power = 1;
		while($power < $ramTotal) {
			$power*=2;
		}
		
		$device->{INFO}->{RAM} = $power;
		$device->{logger}->debug("Aruba AP [RAM] (Mio): " . $device->{INFO}->{RAM});
	}
	
	if(!(defined($device->{INFO}->{MEMORY}))) {
		my $ramFree = int($self->get(aiAPMemoryFree.'.'.$this) / (1000 * 1000));
		$device->{logger}->debug("Aruba AP RamFree (Mio): " . $ramFree);
		
		$device->{INFO}->{MEMORY} = int(($ramFree / $ramTotal) * 100);
		$device->{logger}->debug("Aruba AP [MEMORY] (%): " . $device->{INFO}->{MEMORY});
	}
}

1;

__END__

=head1 NAME

GLPI::Agent::SNMP::MibSupport::Aruba - Inventory module for Aruba AP

=head1 DESCRIPTION

The module enhances Aruba wifi access point devices support.
