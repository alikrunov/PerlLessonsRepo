#!/usr/bin/perl
use strict;
use warnings;

use XML::LibXML;

my $filename = 'C:\Users\EVGENIA\lessons\PerlLessons\simple.xml';

my $doc = XML::LibXML -> load_xml( location => $filename );
for my $node ( $doc -> findnodes( '//text()' ) ) {
    print $node -> parentNode() -> nodeName(), ": ", $node -> nodeValue(), "\n";
}
