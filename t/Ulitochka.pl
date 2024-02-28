#!/usr/bin/perl
use strict;
use warnings;

print( "Задач в бэклоге \n" );
chomp( my $backlog = <STDIN> );

print( "Скорость решения задач \n" );
chomp( my $speed = <STDIN> );

print( "Сколько задач приходит \n" );
chomp( my $tasks = <STDIN> );

my $dayspeed = $speed - $tasks;

my $result = $backlog / ( $dayspeed * 10 );

print( $dayspeed > 0 ? "Справится за $result спринтов" : 'Не справится' );


