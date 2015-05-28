require 'pry'

class Encryptor

	def self.encrypt(msg, lowercase, uppercase, rotation)
		encryption = msg.split("")
		encryption = encryption.map do |character|
			if character == " "
				" "
			elsif character == character.downcase
				index_lowercase = lowercase.find_index(character)
				lowercase.rotate(rotation)[index_lowercase]
			else
				index_uppercase = uppercase.find_index(character)
				uppercase.rotate(rotation)[index_uppercase]
			end
		end
		encryption.join
	end

end

class Decryptor
	def self.decrypt(msg, lowercase, uppercase, rotation)
		decryption = msg.split("")
		decryption = decryption.map do |character|
			if character == " "
				" "
			elsif character == character.downcase
				index_lowercase = lowercase.find_index(character)
				lowercase.rotate(-rotation)[index_lowercase]
			else
				index_uppercase = uppercase.find_index(character)
				uppercase.rotate(-rotation)[index_uppercase]
			end
		end
		decryption.join
	end
end

class EncryptionEngine

	def initialize
		@lowercase = ("a".."z").to_a.shuffle(random: Random.new(1))
		@uppercase = ("A".."Z").to_a.shuffle(random: Random.new(1))
	end

	def encrypt(msg, rotation=13)
		Encryptor.encrypt(msg, @lowercase, @uppercase, rotation)
	end

	def decrypt(msg, rotation=13)
		Decryptor.decrypt(msg, @lowercase, @uppercase, rotation)
	end
end

puts "Object Based:"
engine = EncryptionEngine.new
output = engine.encrypt("My Message")
puts output  # outputs "Zl Zrffntr"
output2 = engine.decrypt("Vu Vjhhwlj")
puts output2 # outputs "My Message"

puts "\n"
puts "Flexible Rotation:"
engine = EncryptionEngine.new
output = engine.encrypt("My Message", 6)
puts output  # outputs "Zl Zrffntr"
output2 = engine.decrypt("Ds Dxttmax", 6)
puts output2 # outputs "My Message"