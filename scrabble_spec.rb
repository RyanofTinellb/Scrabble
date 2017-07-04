require_relative "Scrabble"

RSpec.describe Scrabble do
	describe '#score' do
		it 'returns the score of a word' do
			game = Scrabble.new
			expect(game.score("hello")).to eq(8)
			expect(game.score("cabbage")).to eq(14)
			expect(game.score("Hello")).to eq(8)	# capitalisation
			expect(game.score("")).to eq(0)		# empty string
			expect(game.score(nil)).to eq(0)	# nil input
			expect{game.score("he5llo")}.to raise_error(ArgumentError, "illegal characters in word")
			expect(game.score("hello", "-2---")).to eq(9)	# double letter score
			expect(game.score("hello", "-3---")).to eq(10)	# triple letter score
			expect(game.score("hello", "-D---")).to eq(16)	# double word score
			expect(game.score("hello", "-T---")).to eq(24)	# triple word score
			expect(game.score("hello", "-2-D-")).to eq(18)	# double word score and double letter score
			expect(game.score("hello", "-D-T-")).to eq(48)	# double word score and triple word score
			expect{game.score("hello", "---")}.to raise_error(ArgumentError, "too few characters in bonus string")
			expect{game.score("hello", "--------")}.to raise_error(ArgumentError, "too many characters in bonus string")
			expect{game.score("hello", "-R---")}.to raise_error(ArgumentError, "illegal characters in bonus string")
		end
	end
end