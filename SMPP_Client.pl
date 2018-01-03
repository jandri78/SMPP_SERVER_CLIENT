#!/usr/bin/perl
#use strict;
#use warnings;
use Net::SMPP;

my $host = 'localhost';
my $port = 9900;
my $user = 'GSMSGW';
my $pw = 'secret';
my $message = $ARGV[0];
my $smpp = Net::SMPP->new_transmitter(
    $host,
    port      => $port,
    system_id => $user,
    password  => $pw,
) or die;

for (my $i=1; $i <= 1; $i++) {
$resp_pdu = $smpp->submit_sm(
    destination_addr => '573214723006',
    source_addr => '3333',
    short_message    => $message
) or die;
die "Response indicated error: " . $resp_pdu->explain_status()
if $resp_pdu->status;
$msg_id = $resp_pdu->{message_id};
}
$smpp->unbind();