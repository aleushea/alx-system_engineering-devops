# 0x17. Web stack debugging
===============================================================================

When debugging, sometimes logs are not enough. Either because the software is breaking in a way that was not expected and the error is not being logged, or because logs are not providing enough information. In this case, you will need to go down the stack, the good news is that this is something Holberton students can do :)

Wordpress is a very popular tool, it allows you to run blogs, portfolios, e-commerce and company websites… It actually powers 26% of the web, so there is a fair chance that you will end up working with it at some point in your career.

Wordpress is usually run on LAMP (Linux, Apache, MySQL, and PHP), which is a very widely used set of tools.

The web stack you are debugging today is a Wordpress website running on a LAMP stack.
================================================================================

General Requirements
================================================================================
- All files are interpreted on Ubuntu 14.04 LTS
	use a server ie named with Ubuntu 14.04 LTS
- Ensure that all your files end with a new line.
	You can use the sed command to add a new line at the end of each file in a directory:
	find /path/to/project -type f -exec sed -i -e '$a\' {} \;
-Create a README.md file at the root of your project folder.
	vi /path/to/project/README.md
	touch /path/to/project/README.md
- Install puppet-lint version 2.1.1 and use it to check your Puppet manifests for errors.
	You can install puppet-lint using RubyGems:you can add sudo if it doesnt work
	gem install puppet-lint -v 2.1.1
- Run puppet-lint on your Puppet manifests to check for errors:
	puppet-lint /path/to/manifests/*.pp
- Ensure that your Puppet manifests run without errors and check for any runtime errors:
	puppet apply /path/to/manifests/*.pp
- Add a comment at the first line of each Puppet manifest file explaining its purpose.

- Make sure your Puppet manifest files have the extension .pp.

	If any of your manifest files have a different extension, 
	you can use the rename command to change the extensions to .pp:
	rename 's/\.[^.]+$/.pp/' /path/to/manifests/*
- Use Puppet version 3.4 to check your files. Install Puppet version 3.4 on your Ubuntu 14.04 LTS machine.

	puppet apply --version 3.4 /path/to/manifests/*.pp

================================================================================
### More Info
**Install ``puppet-lint``**
	```
	$ apt-get install -y ruby
	$ gem install puppet-lint -v 2.1.1
	```
===============================================================================
