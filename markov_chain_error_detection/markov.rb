# Generate the Markov Chain
#  make a hash with each letter of the alphabet as a key
#  each key points to another hash, also with each letter of the alphabet as a key
#  when working through the word list, for each letter in the current word, look at the next letter
#   find the current letter's hash in the hash, then increment the count for the next letter
#   do this for each word in the word list
# Using the Markov Chain
#  when receiving input (e.g., a paragraph), split it into its words
#  for each word, split it into its letters, look at each letter and its succeeding letter
#  if the letter is succeeded by a letter for which the count is 0, assign a certain number of
#    points to the word
#    do this for all the letters in the word--if the word's points are above a certain 
#      threshold, surround it with asterisks
# Example Usage
#  markov("hello, wqrld") #=> hello, **wqrld**

# class Word

# 	attr_reader :word

# 	def initialize(word)
# 		@word = word
# 	end



# end

class SpellChecker

	attr_reader :markov_hash, :word_list

	def initialize(word_list)
		@word_list = word_list
		@markov_hash = empty_markov
		fill_markov
	end

	def check(file)
		
	end

	private

	def empty_markov
		Hash[('a'..'z').zip(Array.new(26) {inner_hash})]
	end

	def inner_hash
		Hash[('a'..'z').zip(Array.new(26,0))]
	end

	def fill_markov
		File.new(word_list).each do |word|
			analyze(word)
		end
	end

	def analyze(word)
		letters = word.gsub(/[^a-zA-Z]/, '').chars
		letters.each.with_index do |letter, i|
			break if i == letters.length - 1
			@markov_hash[letter][(letters[i + 1])] += 1
		end
	end

end

# s = SpellChecker.new('word_list.txt')
# puts s.markov_hash