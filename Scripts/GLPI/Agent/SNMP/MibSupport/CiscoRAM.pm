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
use constant    ciscoMemoryPoolUsed     => cisco . '.9.48.1.1.1.5' . '.1';
use constant    ciscoMemoryPoolFree     => cisco . '.9.48.1.1.1.6' . '.1';

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
		
	my $ramFree = $self->get(ciscoMemoryPoolFree);
	# $device->{logger}->debug("Cisco Free RAM: " . $ramFree);
	my $ramUsed = $self->get(ciscoMemoryPoolUsed);
	# $device->{logger}->debug("Cisco Used RAM: " . $ramUsed);
	
	# $device->{INFO}->{MEMORY} = int(($ramFree / ($ramFree + $ramUsed)) * 100);
	$device->{INFO}->{MEMORY} = int($ramFree / (1000 * 1000));
	# $device->{logger}->debug("Cisco MEMORY: " . $device->{INFO}->{MEMORY});
	
	$device->{INFO}->{RAM} = sprintf "%.0f", ($ramFree + $ramUsed) / (1000 * 1000);
	# $device->{logger}->debug("Cisco RAM: " . $device->{INFO}->{RAM});
}

1;

__END__

=head1 NAME

GLPI::Agent::SNMP::MibSupport::Cisco - Inventory module to enhance Cisco devices support.

=head1 DESCRIPTION

The module enhances Cisco support.
