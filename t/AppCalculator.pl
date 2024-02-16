#!/usr/bin/perl
use strict;
use warnings;

system('cls');


my $result = 0;
my @stack;

@stack = _input();

sub _proccess {
    my $result = 0;
    my ($stack) = @_;
    while(@$stack > 0) {

    }

}

sub _findPriority {
    my ($stack) = @_;
    for my $i (0 .. $stack)
    {
        if ($stack[$i] eq '*' || $stack[$i] eq '/') {
            return $i;
        }
    }
    return -1;
}

sub _input {
    my @stack;
    my $input;
    while($input eq '=') {
        chomp($input = <STDIN>);
        push(@stack, $input);
    }
    return @stack;
}




sub _calculate {
    my $result = 0;
    my ($first, $second, $operand) = @_;
    if ($operand eq '*') { $result = $first * $second; }
    if ($operand eq '/') {
        if ($second == 0) {
            print('На ноль делить нельзя');
            return($result);
        }
        $result = $first / $second;
    }
    if ($operand eq '+') { $result = $first + $second; }
    if ($operand eq '-') { $result = $first - $second; }
    return($result);
}
