<?php

$memcache = new Memcache;

$memcache->connect( '192.168.1.40', 11211 ) or die ( "Connection failed" );

$data = "I want to cache this string";

$memcache->set( 'retrieve_key', $data, false, 100 );

$result = $memcache->get( 'retrieve_key' );

var_dump( $result );
