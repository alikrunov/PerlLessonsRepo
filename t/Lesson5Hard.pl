#!/usr/bin/perl
use strict;
use warnings;

my $conf_path = 'C:\Users\EVGENIA\lessons\PerlLessons\conf.ini';

my @bad_words = ('four', 'five');

print("Введите имя файла \n");
chomp(my $filename = <STDIN>);

my @array = _read_file($filename);

print($#array + 1 . "\n");

my %hash = _hash_word(@array);

_print_words(%hash);

_find_bad_words(@bad_words, @array);

sub _print_words {
    my($hash) = @_;

    foreach my $name (reverse sort { $hash{$a} <=> $hash{$b} } keys %hash) {
        if ($hash{$name} gt "1") {
        printf "%-8s %s\n", $name, $hash{$name};
        }
    }
}

sub _hash_word {
    my($array) = @_;

    my %hash;

    for my $i (0 .. $#array) {
       if (exists($hash{$array[$i]})) {
        my $count = $hash{$array[$i]};
           $hash{$array[$i]} = $count + 1;
       } else {
           $hash{$array[$i]} = 1;
       }
    }

    return(%hash);
}

sub _read_file {
    my($filename) = @_;
    my $path = 'C:/Users/EVGENIA/lessons/PerlLessons/';
    my $filepath = $path . $filename;

    my @array;

    open(FH, '<', $filepath) or die "File $filepath can't be opened";

    while(my $line = <FH>) {
        my @linearray = split(" ", $line);
        push(@array, @linearray);
    }
    close(FH);

    return @array;
}

sub _find_bad_words {
    my($bad_words, $array) = @_;
    my @find_array;

    foreach my $word (@array) {
        foreach my $bad_word (@bad_words) {
            if ($word eq $ bad_word) {
                print("Use bad word $word \n");
                push(@find_array, $word);
            }
        }
    }
}

