# frozen_string_literal: true

LOWERCASE = ('a'..'z').to_a
UPPERCASE = ('A'..'Z').to_a

# Creates a cipher at a specific shift value. Can encode abitrary number of messages
class Cipher
  def caesar_cipher(string, shift)
    rotated_lowercase = LOWERCASE.rotate(shift)
    rotated_uppercase = UPPERCASE.rotate(shift)

    cipher = string.chars.map do |c|
      if LOWERCASE.include?(c)
        rotated_lowercase[LOWERCASE.find_index(c)]
      elsif UPPERCASE.include?(c)
        rotated_uppercase[UPPERCASE.find_index(c)]
      else
        c
      end
    end
    cipher.join
  end

  def get_shift(input)
    return 'done' if input == 'done'

    Integer(input)
  rescue ArgumentError
    puts 'Please enter an integer number:'
    get_shift(gets.chomp)
  end
end

# rubocop:enable Naming/FileName
