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
		input.split(/\b/).map {|word| INITIALISMS.fetch(word, word)}.join
	end

end

e = Expander.new
ARGF.each_line {|line| puts e.filter(line)}