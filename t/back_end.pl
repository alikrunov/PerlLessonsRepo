#!/usr/bin/perl
use strict;
use warnings;
use lib "C:/Users/EVGENIA/lessons/PerlLessons/t";
use tools;

while ( ) {
    print( "Выберите действие \n" );
    chomp( my $action = <STDIN> );

    my %conf_hash = tools::read_conf( $tools::CONF_PATH );

    if ( $action eq 'log' ) {
        _action_log( %conf_hash );
    }

    if ( $action eq 'reg' ) {
        _action_reg( %conf_hash );
    }

    if ( $action eq 'del' ) {
        _action_del( %conf_hash );
    }

    if ( $action eq 'chp' ) {
        _action_chp( %conf_hash );
    }

    if ( $action eq 'exit' ) {
        exit;
    }
    system( 'cls' );
    print( "
######################################################
#back_end.pl usage
#reg - registration new user in system;
#log - login in system
#del - remove user from system
#chp - change user password
#exit - exit
######################################################
" );
}

sub _action_log {
    my ( %conf_hash ) = @_;
    print( "Введите логин \n" );
    chomp( my $user_name = <STDIN> );

    print( "Введите пароль \n" );
    chomp( my $user_passwd = <STDIN> );

    tools::login( $user_name, $user_passwd, %conf_hash );
    exit;
}

sub _action_reg {
    my ( %users_prms ) = @_;
    print( "Введите имя пользователя \n" );
    chomp( my $user_name = <STDIN> );

    print( "Введите пароль \n" );
    chomp( my $user_pass = <STDIN> );

    if ( !tools::reg_user( $user_name, $user_pass, %users_prms ) ) {
        $users_prms{$user_name} = $user_pass;
        tools::rewrite_config( $tools::CONF_PATH, %users_prms );
        print( "Пользователь $user_name создан \n" );
    }
    exit;
}

sub _action_del {
    my ( %users_prms ) = @_;
    print( "Введите логин \n" );
    chomp( my $user_name = <STDIN> );

    print( "Введите пароль \n" );
    chomp( my $user_passwd = <STDIN> );
    if ( !tools::del_user( $user_name, $user_passwd, %users_prms ) ) {
        delete( $users_prms{$user_name} );
        tools::rewrite_config( $tools::CONF_PATH, %users_prms );
        print( "Пользователь $user_name удалён" );
    }
    exit;
}

sub _action_chp {
    my ( %users_prms ) = @_;
    print( "Введите логин \n" );
    chomp( my $user_name = <STDIN> );

    print( "Введите пароль \n" );
    chomp( my $user_passwd = <STDIN> );

    print( "Введите новый пароль \n" );
    chomp( my $new_pass = <STDIN> );

    if ( !tools::chp_user( $user_name, $user_passwd, $new_pass, %users_prms ) ) {
        $users_prms{$user_name} = $new_pass;
        tools::rewrite_config( $tools::CONF_PATH, %users_prms );
        print( "Пароль успешно изменён \n" );
    }
    exit;
}