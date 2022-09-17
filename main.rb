# frozen_string_literal: true

require './lib/cipher'

cipher = Cipher.new

puts 'Input message to encode now, press enter, then enter the shift value.'
puts 'Enter "done" when finished.'

input = gets.chomp
puts 'Input shift value now. Value must be an integer.'
shift = cipher.get_shift(gets.chomp)

until input == 'done' || shift == 'done'
  puts cipher.caesar_cipher(input, shift)

  input = gets.chomp
  break if input == 'done'

  shift = cipher.get_shift(gets.chomp)
end

puts 'finished.'
