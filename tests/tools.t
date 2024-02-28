#!/usr/bin/perl
use strict;
use warnings;
use lib "C:/Users/EVGENIA/lessons/PerlLessons/t";
use tools;
use Test::More tests => 32;

my %test_hash = ( 'username' => 'Userp@s5', );
my %test_hash_new = ( 'username'  => 'Userp@s5',
                      'user1name' => 'User1p@s5', );

my $TEST_CONF = "t/test.ini";

open( FH, ">$TEST_CONF" );
foreach my $key ( keys( %test_hash ) ) {
    print FH( $key . '=' . $test_hash{$key} . "\n" );
}
close FH;


#! login tests
is( tools::login( 'username', 'Userp@s5', %test_hash ), 0 );
is( tools::login( 'usernam', 'Userp@s5', %test_hash ), -1 );
is( tools::login( 'username', 'Userp@s', %test_hash ), -1 );
is( tools::login( '', 'Userp@s5', %test_hash ), -1 );
is( tools::login( 'username', '', %test_hash ), -1 );

#! del_user tests
is( tools::del_user( 'username', 'Userp@s5', %test_hash ), 0 );
is( tools::del_user( '', 'Userp@s5', %test_hash ), -1 );
is( tools::del_user( 'username', '', %test_hash ), -1 );
is( tools::del_user( 'usernam', 'Userp@s5', %test_hash ), -1 );
is( tools::del_user( 'username', 'Userp@s', %test_hash ), -1 );

#! reg_user tests
is( tools::reg_user( 'user1name', 'Userp@s5', %test_hash ), 0 );
is( tools::reg_user( '', 'Userp@s5', %test_hash ), -1 );
is( tools::reg_user( 'username', '', %test_hash ), -1 );
is( tools::reg_user( 'username', 'Userp@s5', %test_hash ), -1 );
is( tools::reg_user( '1username', 'Userp@s5', %test_hash ), -1 );
is( tools::reg_user( 'user1name', 'username', %test_hash ), -1 );

#! chp_user tests
is( tools::chp_user( 'username', 'Userp@s5', 'Userp@s6', %test_hash ), 0 );
is( tools::chp_user( '', 'Userp@s5', 'Userp@s6', %test_hash ), -1 );
is( tools::chp_user( 'username', '', 'Userp@s6', %test_hash ), -1 );
is( tools::chp_user( 'usernam', 'Userp@s5', 'Userp@s6', %test_hash ), -1 );
is( tools::chp_user( 'username', 'Userp@s', 'Userp@s6', %test_hash ), -1 );
is( tools::chp_user( 'username', 'Userp@s5', 'Userp@ss', %test_hash ), -1 );

#! check_user_name tests
is( tools::check_user_name( '1qwer' ), -1 );
is( tools::check_user_name( 'Qw_1er' ), 0 );

#! check_user_pass tests
is( tools::check_user_pass( 'Userp@s5' ), 0 );
is( tools::check_user_pass( 'Userp@s' ), -1 );
is( tools::check_user_pass( '5serp@s5' ), -1 );
is( tools::check_user_pass( 'Userpas5' ), -1 );
is( tools::check_user_pass( 'userp@s5' ), -1 );
is( tools::check_user_pass( 'Userp@ss' ), -1 );

is( tools::read_conf( $TEST_CONF ), %test_hash );

is( tools::rewrite_config( $TEST_CONF, %test_hash_new ), %test_hash_new );

unlink $TEST_CONF;

