class Scrabble

	def initialize
		@@letter_scores = {
			  "A" => 1, "B" => 3, "C" => 3, "D" => 2,
			  "E" => 1, "F" => 4, "G" => 2, "H" => 4,
			  "I" => 1, "J" => 8, "K" => 5, "L" => 1,
			  "M" => 3, "N" => 1, "O" => 1, "P" => 3,
			  "Q" =>10, "R" => 1, "S" => 1, "T" => 1,
			  "U" => 1, "V" => 4, "W" => 4, "X" => 8,
			  "Y" => 4, "Z" => 10
			}
	end

	# determines the Scrabble score for input word
	# @param word [String] the string to be scored
	# @param bonus [String] a representation of bonus score modifiers
	#	-: no bonus
	#	2: double letter score
	#	3: triple letter score
	#	D: double word score
	#	T: triple word score
	# @return [Fixnum] the score of the input word, possibly with bonuses applied
	def score(word, bonus = nil)
		if (!word) then return 0 end
		begin
			if (!bonus)
				return word.chars.map{|a| @@letter_scores[a.capitalize]}.reduce(:+) || 0
			end
		rescue TypeError
				raise ArgumentError, "illegal characters in word"
		end
		# else if bonus
		if (word.length < bonus.length)
			raise ArgumentError, "too many characters in bonus string"
		elsif (word.length > bonus.length)
			raise ArgumentError, "too few characters in bonus string"
		end
		out = 0
		word_multiplier = 1
		word.chars.zip(bonus.chars).each do |a|
			temp = @@letter_scores[a[0].capitalize]
			if !temp
				raise ArgumentError, "illegal characters in word"
			end
			case a[1]
				when "-"
					out += temp
				when "2", "3"
					out += a[1].to_i * temp
				when "D"
					out += temp
					word_multiplier *= 2
				when "T"
					out += temp
					word_multiplier *= 3
				else
					raise ArgumentError, "illegal characters in bonus string"
			end
		end
		return out *= word_multiplier
	end
end
