#!/usr/bin/perl
use strict;
use warnings;

use XML::LibXML;
use JSON;

my $xml_filename = 'C:\Users\EVGENIA\lessons\PerlLessons\simple.xml';

my $doc = XML::LibXML -> load_xml( location => $xml_filename );
for my $node ( $doc -> findnodes( '//text()' ) ) {
    print $node -> parentNode() -> nodeName(), ": ", $node -> nodeValue(), "\n";
}

my $json_filename = 'C:\Users\EVGENIA\lessons\PerlLessons\simple.json';

my $json_text = do {
    open( my $json_fh, "<:encoding(UTF-8)", $json_filename )
        or die( "Can't open \"$json_filename\": $!\n" );
    local $/;
    <$json_fh>
};

my $json = JSON -> new;
my $data = $json -> decode( $json_text );

for my $string ( keys %$data ) {
    print( $string . '=' . %$data{$string} . "\n" );
}

