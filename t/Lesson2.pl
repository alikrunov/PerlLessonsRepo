#!/usr/bin/perl
use strict;
use warnings;

my @users_list = qw(run EVGENIA fred);
my $find = 0;

#!my $user_name = $ARGV[0];
#!print("$user_name\n");

#!foreach $ENV (keys %ENV) {
#!    print("$ENV \n");
#!}

my $user_name = $ENV{USERNAME};
my $user_pass = $ENV{USERPASSWORD};
print ("$user_name \n");
print ("$user_pass \n");
# !print ("$user_password \n");

foreach my $user (@users_list) {
    if ($user eq $user_name) {
        $find = 1;
    }
}

if ($find) {
    print("Добро пожаловать, $user_name!  \n");
    print("Твой пароль, $user_pass!  \n");
} else {
    print("Ты кто такой, $user_name?!");
}