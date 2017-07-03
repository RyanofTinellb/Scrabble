require_relative "Scrabble"

RSpec.describe Scrabble do
	describe '#score' do
		it 'returns the score of a word' do
			expect(Scrabble.new.score("hello")).to eq(8)
			expect(Scrabble.new.score("cabbage")).to eq(14)
			expect(Scrabble.new.score("")).to eq(0)
			expect(Scrabble.new.score(nil)).to eq(0)
		end
	end
end