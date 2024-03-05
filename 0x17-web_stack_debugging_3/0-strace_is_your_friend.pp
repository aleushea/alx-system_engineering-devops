exec { 'strace_apache':
  command     => 'strace -o /tmp/strace_output.txt -f -p $(pgrep apache)',
  refreshonly => true,
  subscribe   => Service['apache'],
}

file { '/var/www/html/wp-settings.php':
  ensure  => present,
  content => file('/var/www/html/wp-settings.php'),
  notify  => Exec['fix_wp_settings'],
}

exec { 'fix_wp_settings':
  command     => 'sed -i "s/phpp/php/g" /var/www/html/wp-settings.php',
  refreshonly => true,
  subscribe   => File['/var/www/html/wp-settings.php'],
  require     => Exec['strace_apache'],
}

service { 'apache':
  ensure  => running,
  require => Exec['fix_wp_settings'],
}