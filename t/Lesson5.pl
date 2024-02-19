#!/usr/bin/perl
use strict;
use warnings;

my $conf_path = 'C:\Users\EVGENIA\lessons\PerlLessons\conf.ini';

_read_conf($conf_path);


sub _read_conf {
    my($conf_path) = @_;
    my @array;

    open(FH, '<', $conf_path) or die "File $conf_path can't be opened";

    while(<FH>) {
        push(@array, $_);
    }

    close(FH);
}