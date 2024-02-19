#!/usr/bin/perl
use strict;
#!use warnings;


system('cls');


my $result = 0;
my @stack;

@stack = _input();
_proccess(@stack);

sub _proccess {
    my $result = 0;
    my ($stack) = @_;
    while(@$stack > 0) {
        print($#stack);
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
    my $input = 0;
    my $last = 0;
    my $isSymbol = 0;
    while($input ne '=') {
        chomp($input = <STDIN>);
        $isSymbol = _checkNumber($input);
        if ($isSymbol == 0) {
            $isSymbol = _checkOperand($input);
        }

        if ($isSymbol == $last) {
            pop(@stack);
            push(@stack, $input);
            $last = $isSymbol;
        } else {
            push(@stack, $input);
            $last = $input;
        }

    }
    return @stack;
}

sub _checkNumber {
    my ($symbol) = @_;
    $symbol = $symbol + 0;
    if (length(do { no warnings "numeric"; $symbol & "" })){
        return(1);
    } else {
        return(0);
    }
}

sub _checkOperand {
    my($symbol) = @_;
    if ($symbol eq '+') {return 2;}
    if ($symbol eq '-') {return 2;}
    if ($symbol eq '*') {return 2;}
    if ($symbol eq '/') {return 2;}
    return 0;
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
