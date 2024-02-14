#!/usr/bin/perl
use strict;
use warnings;

my @users_list = qw(run evg fred);
my $find = 0;
print("Введите ваше имя: \n");
chomp(my $user_name = <STDIN>);

foreach my $user (@users_list) {
    #!print("username now is $user\n");
    if ($user eq $user_name) {
        $find = 1;
    }
}

if ($find) {
    print("Добро пожаловать, $user_name!");
} else {
    print("Ты кто такой, $user_name?!");
}