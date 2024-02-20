#!/usr/bin/perl
use strict;
use warnings;

my $conf_path = 'C:\Users\EVGENIA\lessons\PerlLessons\conf.ini';

my $user_name = '';
my $user_pass = '';

$user_name = $ENV{USERNAME};
$user_pass = $ENV{USERPASSWORD};



sub _login {
    my ($user_name, $user_passwd, %users_prms) = @_;

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
sub _read_conf {
    my($conf_path) = @_;
    my @array;
    my %hash;

    open(FH, '<', $conf_path) or die "File $conf_path can't be opened";

    while(<FH>) {
        my $string = $_;
        $string=~s/\s*//g;

        my @split_array = split('=', $string);
        if ($split_array[0] ne "" && $split_array[1] ne "") {
            if ($string!~m/^\#/) {
                $hash{$split_array[0]} = $split_array[1];
            }
        }


    }
    close(FH);
    return(%hash)
}


my %conf_hash = _read_conf($conf_path);
my $login = _login($user_name, $user_pass, %conf_hash);

if ($login == 0) {
    print("Добро пожаловать, $user_name");
} else {
    print('Неверное имя пользователя или пароль');
}






