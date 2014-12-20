class Expander

	INITIALISMS = {
		'lol' => 'laugh out loud',
		'dw'  => 'don\'t worry',
		'hf'  => 'have fun',
		'gg'  => 'good game',
		'brb' => 'be right back',
		'g2g' => 'got to go',
		'wtf' => 'what the fuck',
		'wp'  => 'well played',
		'gl'  => 'good luck',
		'imo' => 'in my opinion'
	}

	def filter(input)
		input.split(/\b/).map {|word| replace(word)}.join
	end

	private

	def replace(word)
		INITIALISMS[word] || word
	end

end

input = gets.chomp
puts Expander.new.filter(input)
