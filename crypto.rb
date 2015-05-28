require 'pry'

class Encryptor
	# Your code here
end

class Decryptor
	# Your code here
end

class EncryptionEngine

	def initialize
		@lowercase = ("a".."z").to_a
		@uppercase = ("A".."Z").to_a
	end

	def encrypt(msg)
		encryption = msg.split("")
		encryption = encryption.map do |character|
				if character == " "
					" "
				elsif character == character.downcase
					index_lowercase = @lowercase.find_index(character)
					@lowercase.rotate(13)[index_lowercase]
				else
					index_uppercase = @uppercase.find_index(character)
					@uppercase.rotate(13)[index_uppercase]
				end
		end
		encryption.join
	end

	def decrypt(msg)
		decryption = msg.split("")
		decryption = decryption.map do |character|
			if character == " "
				" "
			elsif character == character.downcase
				index_lowercase = @lowercase.find_index(character)
				@lowercase.rotate(-13)[index_lowercase]
			else
				index_uppercase = @uppercase.find_index(character)
				@uppercase.rotate(-13)[index_uppercase]
			end
		end
		decryption.join
	end
end

engine = EncryptionEngine.new
output = engine.encrypt("My Message")
puts output  # outputs "Zl Zrffntr"
output2 = engine.decrypt("Zl Zrffntr")
puts output2 # outputs "My Message"