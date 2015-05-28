require 'pry'

class Encryptor
	# Your code here
end

class Decryptor
	# Your code here
end

class EncryptionEngine

	def encrypt(msg)
		lowercase = ("a".."z").to_a
		uppercase = ("A".."Z").to_a
		encryption = []
		message = msg.split("")
		message.each do |character|
			if character == " "
				encryption<<" "
			elsif character == character.downcase
				index_lowercase = lowercase.find_index(character)
				lowercase = lowercase.rotate(13)
				encryption<<lowercase[index_lowercase]
			else
				index_uppercase = uppercase.find_index(character)
				encryption<<uppercase.rotate(13)[index_uppercase]
			end
		end
		encryption.join
	end

	def decrypt(msg)

	end
end

engine = EncryptionEngine.new
output = engine.encrypt("My Message")
puts output  # outputs "Zl Zrffntr"
output2 = engine.decrypt("Zl Zrffntr")
puts output2 # outputs "My Message"