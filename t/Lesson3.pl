#!/usr/bin/perl
use strict;
use warnings;

my $user_name = '';
my $user_pass = '';

$user_name = $ENV{USERNAME};
$user_pass = $ENV{USERPASSWORD};

sub _login {
    my ($user_name, $user_passwd) = @_;
    my %users_prms = (
        'run'       => 'qwe',
        'EVGENIA'   => '123',
        'fred'      => '0',
    );

    if ( $user_name eq '' ) {
        print('Не указано имя пользователя');
        exit;
    }

    if ( $user_passwd eq '' ) {
        print('Не указан пароль');
        exit;
    }

    if ($users_prms{$user_name} && $users_prms{$user_name} eq $user_passwd) {
        return(0);
    } else {
        return(-1);
    }
}

my $login = _login($user_name, $user_pass);

if ($login == 0) {
    print("Добро пожаловать, $user_name");
} else {
    print('Неверное имя пользователя или пароль');
}




