#!/usr/bin/perl
use strict;
use warnings;
use lib "C:/Users/EVGENIA/lessons/PerlLessons/t";
use tools;

print("Выберите действие \n");
chomp(my $action = <STDIN>);

if ($action ne 'reg' && $action ne 'log' && $action ne 'del' && $action ne 'chp') {
    print('Неверное действие');
    exit;
}

my %conf_hash = tools::read_conf($tools::conf_path);

if ($action eq 'log') {
    tools::login(%conf_hash);
}

if ($action eq 'reg') {
    my %new_conf = tools::reg_user(%conf_hash);
    tools::rewrite_config(%new_conf);
}

if ($action eq 'del') {
    my %new_conf = tools::del_user(%conf_hash);
    tools::rewrite_config(%new_conf);
}

if ($action eq 'chp') {
    my %new_conf = tools::chp_user(%conf_hash);
    tools::rewrite_config(%new_conf);
}







