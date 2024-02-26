package tools;
use strict;
use warnings;

our $conf_path = 'C:\Users\EVGENIA\lessons\PerlLessons\conf.ini';

sub login {
    my (%users_prms) = @_;

    print("Введите логин \n");
    chomp(my $user_name = <STDIN>);

    print("Введите пароль \n");
    chomp(my $user_passwd = <STDIN>);

    if ($user_name eq '') {
        print('Не указано имя пользователя');
        exit;
    }

    if ($user_passwd eq '') {
        print('Не указан пароль');
        exit;
    }

    if ($users_prms{$user_name} && $users_prms{$user_name} eq $user_passwd) {
        print("Добро пожаловать, $user_name");
        return (1);
    }
    else {
        print('Неверное имя пользователя или пароль');
        return (0);
    }
}

sub del_user {
    my (%users_prms) = @_;

    print("Введите логин \n");
    chomp(my $user_name = <STDIN>);

    print("Введите пароль \n");
    chomp(my $user_passwd = <STDIN>);

    if ($user_name eq '') {
        print('Не указано имя пользователя');
        exit;
    }

    if ($user_passwd eq '') {
        print('Не указан пароль');
        exit;
    }

    if (!$users_prms{$user_name}) {
        print("Пользователя $user_name нет в базе");
        exit;
    }

    if ($users_prms{$user_name} eq $user_passwd) {
        print("Пользователь $user_name удалён");
        delete($users_prms{$user_name});
        return (%users_prms);
    }
    else {
        print('Неверный пароль');
        exit;
    }
}

sub chp_user {
    my (%users_prms) = @_;
    my $new_pass = '';
    my $check_pass = 0;

    print("Введите логин \n");
    chomp(my $user_name = <STDIN>);

    print("Введите пароль \n");
    chomp(my $user_passwd = <STDIN>);

    if ($user_name eq '') {
        print('Не указано имя пользователя');
        exit;
    }

    if ($user_passwd eq '') {
        print('Не указан пароль');
        exit;
    }

    if (!$users_prms{$user_name}) {
        print("Пользователя $user_name нет в базе");
        exit;
    }

    if ($users_prms{$user_name} ne $user_passwd) {
        print('Неверный пароль');
        exit;
    }

    do
    {
        print("Введите новый пароль \n");
        chomp($new_pass = <STDIN>);
        $check_pass = check_user_pass($new_pass);

    } while (!$check_pass);

    $users_prms{$user_name} = $new_pass;
    print("Пароль успешно изменён \n");
    return (%users_prms);
}

sub reg_user {
    my (%users_prms) = @_;
    my $user_name = '';
    my $user_pass = '';
    my $check_name = 0;
    my $check_pass = 0;

    do
    {
        print("Введите имя пользователя \n");
        chomp($user_name = <STDIN>);

        if ($users_prms{$user_name}) {
            print "Пользователь с таким логином уже зарегистрирован \n";
        }
        else {
            $check_name = check_user_name($user_name);
            if (!$check_name) {
                print "неверный формат логина \n";
            }
        }
    } while (!$check_name);

    do
    {
        print("Введите пароль \n");
        chomp($user_pass = <STDIN>);
        $check_pass = check_user_pass($user_pass);

    } while (!$check_pass);

    $users_prms{$user_name} = $user_pass;
    print("Пользователь $user_name создан \n");
    return (%users_prms);
}

sub rewrite_config {
    my (%users_prms) = @_;
    open(my $fh, '>', $conf_path) or die "Could not open file '$conf_path' $!";
    foreach my $key (keys(%users_prms)) {
        print $fh ($key . '=' . $users_prms{$key} . "\n");
    }
    close $fh;

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
        return 1;
    }
    return 0;
}

sub check_user_pass {
    my ($string) = @_;
    if ($string !~ m/^.{8,}$/) {
        print("В пароле должно быть не менее 8 символов \n");
        return 0;
    }

    if ($string !~ m/^[a-zA-Z]/) {
        print("Пароль должен начинаться с латинской буквы \n");
        return 0;
    }

    if ($string !~ m/[!@#$%^&*()]/) {
        print("Пароль должен содержать хоть один спецсимвол !@#$%^&*() \n");
        return 0;
    }

    if ($string !~ m/[A-Z]/) {
        print("Пароль должен содержать хоть одну букву в верхнем регистре \n");
        return 0;
    }

    if ($string !~ m/[\d]/) {
        print("Пароль должен содержать хоть одну цифру \n");
        return 0;
    }
    return 1;
}

1;