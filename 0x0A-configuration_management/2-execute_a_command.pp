s script creates a manifest that kills killmenow process
# it uses pkill with puppet

exec { 'pkill':
  command => 'pkill -f killmenow',
  path    => '/usr/bin',
}
