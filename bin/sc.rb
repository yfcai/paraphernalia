#!/usr/bin/env ruby

def say(s); $stderr.puts s; end

if ARGV.length <= 1
  say "FATAL ERROR: call #{__FILE__} with $SCDIR and nonempty globs"
  puts Dir.pwd
  exit 1
end

scdir = ARGV[0]

final = Dir.pwd

regex = ARGV.drop(1)

hints = regex.map { |r|
  prefix, suffix = ['*', '*']
  if r.start_with?('^')
    prefix = ''
    r = r[1..-1]
  end
  if r.end_with?('$')
    suffix = ''
    r = r[0..-2]
  end
  "#{prefix}#{r}#{suffix}"
}

globs = "#{scdir}/#{hints.join("/")}/"

dirss = Dir.glob(globs)

case dirss.length
when 0
  say "Not found: #{globs}"
when 1
  final = dirss.first
else
  say "Found #{dirss.length} matches:"
  howMany = 3
  dirss.take(howMany).each { |dir| say dir }
  say '...' if dirss.length > howMany
end

puts final
