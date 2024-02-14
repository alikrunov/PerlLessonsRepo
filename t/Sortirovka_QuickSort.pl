#!/usr/bin/perl
use strict;
use warnings;

use Scalar::Util qw(looks_like_number);

sub binarySearch(\@) {
    my($array) = @_;
    print("Введите цифру из массива: \n");
    chomp(my $target = <STDIN>);
    if (looks_like_number($target)) {
        foreach my $array (@$array) {
            print($array);
        }
    } else {
        print("it's not a number!")
    }

}

sub quickSort (\@) {
    startSort($_[0], 0, $#{$_[0]})
}

sub startSort() {
    my($array, $left, $right) = @_;
        if ($left < $right) {
        my $q = partition($array, $left, $right);
            startSort($array, $left, $q - 1);
            startSort($array, $q + 1, $right);
    }

}

sub partition() {
    my ($array, $left, $right) = @_;
    my $x = @$array[$right];

    my $i = $left - 1;
    for my $j ($left .. $right - 1) {
        if (@$array[$j] <= $x) {
            $i++;
            @$array[$i, $j] = @$array[$j, $i];
        }
    }
    $i++;
    @$array[$i, $right] = @$array[$right, $i];
    return $i;

}

my @testArray = qw(3 1 8 6 5 9 2);

print("@testArray \n");
quickSort (@testArray);
print("@testArray \n");

binarySearch(@testArray);

