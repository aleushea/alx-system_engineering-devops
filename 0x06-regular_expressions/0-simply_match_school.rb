#!/usr/bin/env ruby
# This script (0-simply_match_school.rb)accepts one argument and pass it to a regular expression matching method

puts ARGV[0].scan(/school/i).join
