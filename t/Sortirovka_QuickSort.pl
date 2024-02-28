#!/usr/bin/perl
use strict;
use warnings;

sub binarySearch( \@ ) {
    my ( $array ) = @_;
    print( "Введите цифру из массива: \n" );
    chomp( my $input = <STDIN> );
    my $target = _inputCheck( $input );
    if ( $target ) {
        my $result = _bSearch( $array, $target );
        print( "Индекс в массиве: $result \n" )
    }
    else {
        print( 'Введено не число' );
    }

}

sub _inputCheck {
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

sub _bSearch() {
    my ( $array, $target ) = @_;
    my $left = 0;
    my $right = @$array - 1;

    while ( $left <= $right ) {
        my $mid = int( ( $left + $right ) / 2 );

        if ( $target > @$array[$mid] ) {

            $left = $mid + 1;
        }
        if ( $target < @$array[$mid] ) {
            $right = $mid - 1;
        }
        if ( $target == @$array[$mid] ) {
            return $mid;
        }
    }
    return -1;
}

sub quickSort( \@ ) {
    _startSort( $_[0], 0, $#{$_[0]} )
}

sub _startSort() {
    my ( $array, $left, $right ) = @_;
    if ( $left < $right ) {
        my $q = _partition( $array, $left, $right );
        _startSort( $array, $left, $q - 1 );
        _startSort( $array, $q + 1, $right );
    }

}

sub _partition() {
    my ( $array, $left, $right ) = @_;
    my $x = @$array[$right];

    my $i = $left - 1;
    for my $j ( $left .. $right - 1 ) {
        if ( @$array[$j] <= $x ) {
            $i++;
            @$array[$i, $j] = @$array[$j, $i];
        }
    }
    $i++;
    @$array[$i, $right] = @$array[$right, $i];
    return $i;

}

my @testArray = qw( 3 1 8 6 5 9 2 );

print( "@testArray \n" );
quickSort( @testArray );
print( "@testArray \n" );

binarySearch( @testArray );

