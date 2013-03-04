<?php

$memcache = new Memcached;

$memcache->addServer( "192.168.1.40", 11211 );
//$memcache->addServers( array( array("192.168.1.40", 11211), array("192.168.1.41", 11211) ) );

$memcache->set( 'retrieve_key', 'I want to cache this string' );

var_dump( $memcache->get( 'retrieve_key' ) );

//$memcache->setMulti( array( 'foo' => 'I want to cache this string as foo',
//                           'bar' => 'I want to cache this string as bar' ) );

$memcache->flush();
