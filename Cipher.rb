#constant declaration
LOWERCASE = ("a".."z").to_a
UPPERCASE = ("A".."Z").to_a

def caesar_cipher(string, shift)
  #set up the roted arrays in both upper and lowercase
  #would be nice if there was a method to check if a char was caps or lowercase
  rotated_lowercase = LOWERCASE.rotate(shift)
  rotated_uppercase = UPPERCASE.rotate(shift)
  #break the input string into individual chars
  chars = string.chars
  #now the fun starts: there are 2 includes? checks to preserve the casing of the char
  cipher = chars.map do |c|
    #check if the char is a letter
    if LOWERCASE.include?(c)
      #and return the rotated index of the letter if true
      rotated_lowercase[LOWERCASE.find_index(c)]
    #duplicate of the above lines but for upper case
    elsif UPPERCASE.include?(c)
      rotated_uppercase[UPPERCASE.find_index(c)]
    else
      #don't change the char if it isn't a letter
      c
    end
  end
  #and put it back to a string
  cipher.join()
end
