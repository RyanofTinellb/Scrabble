class Scrabble

	# determines the Scrabble score for input word
	# @param word [String] the string to be scored
	# @return [Fixnum] the score of the input word
	def score(word)
		if !word then return 0 end
		@@score_hash = {
			  "A" => 1, "B" => 3, "C" => 3, "D" => 2,
			  "E" => 1, "F" => 4, "G" => 2, "H" => 4,
			  "I" => 1, "J" => 8, "K" => 5, "L" => 1,
			  "M" => 3, "N" => 1, "O" => 1, "P" => 3,
			  "Q" => 10, "R" => 1, "S" => 1, "T" => 1,
			  "U" => 1, "V" => 4, "W" => 4, "X" => 8,
			  "Y" => 4, "Z" => 10
			}
		word.chars.map{|a| @@score_hash[a.capitalize]}.reduce(:+) || 0
		rescue TypeError
			raise ArgumentError, "illegal characters in word"
	end
end