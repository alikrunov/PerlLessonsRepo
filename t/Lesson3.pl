#!/usr/bin/perl
use strict;
use warnings;

my %users_prms = (
    "run"       => "qwe",
    "EVGENIA"   => "123",
    "fred"      => "0",
);

my $user_name = $ENV{USERNAME};
my $user_pass = $ENV{USERPASSWORD};



if ($users_prms{$user_name} && $users_prms{$user_name} eq $user_pass) {
    print("Добро пожаловать, $user_name!  \n");
} else {
    print("Неверный логин или пароль");
}