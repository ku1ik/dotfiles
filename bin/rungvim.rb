#!/usr/bin/env ruby

system("gvim " + (ARGV.empty? ? '' : "--remote-tab-silent " + ARGV.join(" ")))
