include apache
include apache::mod::php

include mysql::server

exec { 'apt-update':
  path    => '/usr/bin/',
  command => 'apt-get update',
}

mysql::db { 'wordpress':
  user     => 'username',
  password => 'password',
  host     => 'localhost',
  grant    => ['ALL'],
}

package { 'php5-mysql':
  ensure => latest,
}

apache::mod { 'rewrite': }

apache::vhost { 'wordpress':
  port               => 80,
  docroot            => '/vagrant/public',
  docroot_owner      => 'www-data',
  docroot_group      => 'www-data',
  logroot            => '/vagrant/log',
  configure_firewall => false,
  override           => ['ALL'],
}

Apt::Key <| |> -> Exec['apt-update']
Apt::Source <| |> -> Exec['apt-update']

Exec['apt-update'] -> Package <| |>
