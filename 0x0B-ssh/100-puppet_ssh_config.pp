#!/usr/bin/env bash
# puppet as an alternative to edit configuration file

file { 'etc/ssh/ssh_config':
	ensure  => present,
content =>"
	host*
	IdentityFile ~/.ssh/school
	PasswordAuthentication no
	",
}
