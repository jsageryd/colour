#!/usr/bin/env ruby

ESCAPE_CODES = {
  reset:          "\e[0m",
  black:          "\e[0;30m",
  red:            "\e[0;31m",
  green:          "\e[0;32m",
  yellow:         "\e[0;33m",
  blue:           "\e[0;34m",
  magenta:        "\e[0;35m",
  cyan:           "\e[0;36m",
  white:          "\e[0;37m",
  bright_black:   "\e[1;30m",
  bright_red:     "\e[1;31m",
  bright_green:   "\e[1;32m",
  bright_yellow:  "\e[1;33m",
  bright_blue:    "\e[1;34m",
  bright_magenta: "\e[1;35m",
  bright_cyan:    "\e[1;36m",
  bright_white:   "\e[1;37m"
}

colour = ARGV.shift

begin
  colour or raise KeyError
  print ESCAPE_CODES.fetch(colour.to_sym)
  while buffer = $stdin.read(4096)
    $stdout.write(buffer)
  end
  print ESCAPE_CODES[:reset]
rescue KeyError
  puts <<-EOF
Give a colour as first argument. Available colours:
#{ESCAPE_CODES.keys.reject { |k| k == :reset }.map { |k| "#{ESCAPE_CODES[k]}██#{ESCAPE_CODES[:reset]} #{k}" }.to_a.join("\n")}
  EOF
end
