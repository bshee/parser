require_relative "scanner"

puts "Standard input:"

scanner = Scanner.new(ARGF.read)

puts "Here are the characters returned by the scanner:"
puts "  line col  character"

loop do
  char = scanner.get()

  puts char.to_s
  break if char.cargo == END_MARK
end
