package tools;
use strict;
use warnings;

our $conf_path = 'C:\Users\EVGENIA\lessons\PerlLessons\conf.ini';

sub login {
    my ($user_name, $user_passwd, %users_prms) = @_;

    if ($user_name eq '') {
        print("Не указано имя пользователя \n");
        return (-1);
    }

    if ($user_passwd eq '') {
        print("Не указан пароль \n");
        return (-1);
    }

    if ($users_prms{$user_name} && $users_prms{$user_name} eq $user_passwd) {
        print("Добро пожаловать, $user_name \n");
        return (0);
    }
    else {
        print("Неверное имя пользователя или пароль \n");
        return (-1);
    }
}

sub del_user {
    my ($user_name, $user_passwd, %users_prms) = @_;

    if ($user_name eq '') {
        print("Не указано имя пользователя \n");
        return (-1);
    }

    if ($user_passwd eq '') {
        print("Не указан пароль \n");
        return (-1);
    }

    if (!$users_prms{$user_name}) {
        print("Пользователя $user_name нет в базе \n");
        return (-1);
    }

    if ($users_prms{$user_name} eq $user_passwd) {
        return (0);
    }
    else {
        print("Неверный пароль \n");
        return (-1);
    }
}

sub chp_user {
    my ($user_name, $user_passwd, $new_pass, %users_prms) = @_;

    if ($user_name eq '') {
        print("Не указано имя пользователя \n");
        return (-1);
    }

    if ($user_passwd eq '') {
        print("Не указан пароль \n");
        return (-1);
    }

    if (!$users_prms{$user_name}) {
        print("Пользователя $user_name нет в базе \n");
        return (-1);
    }

    if ($users_prms{$user_name} ne $user_passwd) {
        print("Неверный пароль \n");
        return (-1);
    }

    if (check_user_pass($new_pass)) {
        return (-1);
    }

    return (0);
}

sub reg_user {
    my ($user_name, $user_pass, %users_prms) = @_;

    if ($user_name eq '') {
        print("Не указано имя пользователя \n");
        return (-1);
    }

    if ($user_pass eq '') {
        print("Не указан пароль \n");
        return (-1);
    }

    if ($users_prms{$user_name}) {
        print "Пользователь с таким логином уже зарегистрирован \n";
        return (-1);
    }
    if (check_user_name($user_name)) {
        print "неверный формат логина \n";
        return (-1);
    }
    if (check_user_pass($user_pass)) {
        return (-1);
    }
    return (0);
}

sub rewrite_config {
    my ($path, %users_prms) = @_;
    open(my $fh, '>', $path) or die "Could not open file '$path' $!";
    foreach my $key (keys(%users_prms)) {
        print $fh ($key . '=' . $users_prms{$key} . "\n");
    }
    close $fh;
    return(%users_prms);
}

sub read_conf {
    my ($conf_path) = @_;
    my @array;
    my %hash;

    open(FH, '<', $conf_path) or die "File $conf_path can't be opened";

    while (<FH>) {
        my $string = $_;
        $string =~ s/\s*//g;

        my @split_array = split('=', $string);
        if ($split_array[0] ne "" && $split_array[1] ne "") {
            if ($string !~ m/^\#/) {
                $hash{$split_array[0]} = $split_array[1];
            }
        }

    }
    close(FH);
    return (%hash)
}

sub check_user_name {
    my ($string) = @_;
    if ($string =~ m/^[a-zA-Z][a-zA-Z0-9_-]+[a-zA-Z]$/) {
        return 0;
    }
    return -1;
}

sub check_user_pass {
    my ($string) = @_;
    if ($string !~ m/^.{8,}$/) {
        print("В пароле должно быть не менее 8 символов \n");
        return -1;
    }

    if ($string !~ m/^[a-zA-Z]/) {
        print("Пароль должен начинаться с латинской буквы \n");
        return -1;
    }

    if ($string !~ m/[!@#$%^&*()]/) {
        print("Пароль должен содержать хоть один спецсимвол !@#$%^&*() \n");
        return -1;
    }

    if ($string !~ m/[A-Z]/) {
        print("Пароль должен содержать хоть одну букву в верхнем регистре \n");
        return -1;
    }

    if ($string !~ m/[\d]/) {
        print("Пароль должен содержать хоть одну цифру \n");
        return -1;
    }

    return 0;
}

1;