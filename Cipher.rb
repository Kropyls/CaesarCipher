
LOWERCASE = ("a".."z").to_a
UPPERCASE = ("A".."Z").to_a

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
  cipher.join()
end
