require_relative "Scrabble"

RSpec.describe Scrabble do
	describe '#score' do
		it 'returns the score of a word' do
			expect(Scrabble.new.score("hello")).to eq(8)
			expect(Scrabble.new.score("cabbage")).to eq(14)
			expect(Scrabble.new.score("Hello")).to eq(8)	# capitalisation
			expect(Scrabble.new.score("")).to eq(0)		# empty string
			expect(Scrabble.new.score(nil)).to eq(0)	# nil input
			expect{Scrabble.new.score("he5llo")}.to raise_error(ArgumentError, "illegal characters in word")		#illegal characters
		end
	end
end