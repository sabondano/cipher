require 'minitest/autorun'
require 'minitest/pride'
require_relative 'crypto'

class EncryptionEngineTest < Minitest::Test
	def test_it_encrypts_using_rot13
		engine = EncryptionEngine.new
		output = engine.encrypt("My Message")
		assert_equal "Zl Zrffntr", output
	end

	def test_it_decrypts_using_rot13
		engine = EncryptionEngine.new
		output = engine.decrypt("Zl Zrffntr")
		assert_equal "My Message", output
	end

	def test_it_encrypts_using_rot6
		engine = EncryptionEngine.new
		output = engine.encrypt("My Message", 6)
		assert_equal "Se Skyygmk", output
	end

	def test_it_decrypts_using_rot6
		engine = EncryptionEngine.new
		output = engine.decrypt("Se Skyygmk", 6)
		assert_equal "My Message", output
	end
end

