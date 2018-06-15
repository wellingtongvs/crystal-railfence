module RailFenceCipher
  # encrypt function
  def self.encrypt(text, key)
    if key
      key = key.to_i
    else
      exit(1)
    end

    if text.size <= 0
      exit(1)
    end

    # filters end of line character
    text = text.delete('\n')
    
    # if the text size isn't divisible by key value, fill the remaining characters with a special character
    remainingSpaces = text.size % key
    if (remainingSpaces != 0)
      (text.size .. text.size + remainingSpaces).each do
        text = text + "X"
      end
    end

    encryptedText = ""
   
    # encrypts the text
    railFenceRows = (text.size/key).to_i
    (0..key-1).each do |j|
      (0..railFenceRows-1).each do |i|
        encryptedText = encryptedText + text.char_at(i * key + j)
      end
    end

    return encryptedText
  end

  # decrypt function
  def self.decrypt(text, key)
    if key
      key = key.to_i
    else 
      exit(1)
    end

    if text.size <= 0
      exit(1)
    end

    # filters end of line character
    text = text.delete('\n')

    decryptedText = ""

    # decrypts the encrypted text
    railFenceRows = (text.size/key).to_i
    (0..railFenceRows-1).each do |i|
      (0..key-1).each do |j|
        decryptedText = decryptedText + text.char_at(j*railFenceRows + i)
      end
    end

    return decryptedText
  end
end
