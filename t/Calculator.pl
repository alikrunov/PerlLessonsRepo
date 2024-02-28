#!/usr/bin/perl
use strict;
use warnings;

main();

sub main {
    system( 'cls' );
    chomp( my $firstSymb = <STDIN> );
    chomp( my $operand = <STDIN> );
    chomp( my $secondSymb = <STDIN> );

    my $first = _checkNumber( $firstSymb );
    my $second = _checkNumber( $secondSymb );
    my $result = _calculate( $first, $second, $operand );

    system( 'cls' );
    print( "$first $operand $second = $result" );
}

sub _calculate {
    my $result = 0;
    my ( $first, $second, $operand ) = @_;
    if ( $operand eq '*' ) { $result = $first * $second; }
    if ( $operand eq '/' ) { $result = $first / $second; }
    if ( $operand eq '+' ) { $result = $first + $second; }
    if ( $operand eq '-' ) { $result = $first - $second; }
    return ( $result );
}

sub _checkNumber {
    my ( $target ) = @_;
    $target = $target + 0;
    if ( length( do {
        no warnings "numeric";
        $target & ""
    } ) ) {
        return ( $target );
    }
    else {
        return ( 0 );
    }
}