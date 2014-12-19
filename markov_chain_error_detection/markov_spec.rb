require_relative 'markov'

describe SpellChecker do 

	

	before do 
		@check = SpellChecker.new('practice_list.txt')
	end

	describe 'on instantiation' do

		it 'fills its markov hash' do
			markov = {"a"=>{"a"=>1, "b"=>0, "c"=>0, "d"=>0, "e"=>0, "f"=>0, "g"=>0, "h"=>0, "i"=>0, "j"=>0, "k"=>0, "l"=>0, "m"=>0, "n"=>3, "o"=>0, "p"=>0, "q"=>0, "r"=>2, "s"=>0, "t"=>0, "u"=>0, "v"=>0, "w"=>0, "x"=>1, "y"=>0, "z"=>0}, 
								"b"=>{"a"=>1, "b"=>0, "c"=>0, "d"=>0, "e"=>0, "f"=>0, "g"=>0, "h"=>0, "i"=>0, "j"=>0, "k"=>0, "l"=>0, "m"=>0, "n"=>0, "o"=>0, "p"=>0, "q"=>0, "r"=>1, "s"=>0, "t"=>0, "u"=>0, "v"=>0, "w"=>0, "x"=>0, "y"=>0, "z"=>0}, 
								"c"=>{"a"=>0, "b"=>0, "c"=>0, "d"=>0, "e"=>0, "f"=>0, "g"=>0, "h"=>0, "i"=>0, "j"=>0, "k"=>0, "l"=>0, "m"=>0, "n"=>0, "o"=>1, "p"=>0, "q"=>0, "r"=>0, "s"=>0, "t"=>0, "u"=>0, "v"=>0, "w"=>0, "x"=>0, "y"=>0, "z"=>0}, 
								"d"=>{"a"=>0, "b"=>0, "c"=>0, "d"=>0, "e"=>0, "f"=>0, "g"=>0, "h"=>0, "i"=>0, "j"=>0, "k"=>0, "l"=>0, "m"=>0, "n"=>0, "o"=>0, "p"=>0, "q"=>0, "r"=>0, "s"=>0, "t"=>0, "u"=>0, "v"=>1, "w"=>0, "x"=>0, "y"=>0, "z"=>0}, 
								"e"=>{"a"=>0, "b"=>1, "c"=>0, "d"=>0, "e"=>2, "f"=>0, "g"=>0, "h"=>0, "i"=>0, "j"=>0, "k"=>0, "l"=>0, "m"=>0, "n"=>0, "o"=>1, "p"=>0, "q"=>0, "r"=>1, "s"=>0, "t"=>1, "u"=>0, "v"=>0, "w"=>0, "x"=>0, "y"=>0, "z"=>0}, 
								"f"=>{"a"=>0, "b"=>0, "c"=>0, "d"=>0, "e"=>1, "f"=>1, "g"=>0, "h"=>0, "i"=>0, "j"=>0, "k"=>0, "l"=>0, "m"=>0, "n"=>0, "o"=>0, "p"=>0, "q"=>0, "r"=>0, "s"=>0, "t"=>0, "u"=>0, "v"=>0, "w"=>0, "x"=>0, "y"=>0, "z"=>0}, 
								"g"=>{"a"=>0, "b"=>0, "c"=>0, "d"=>0, "e"=>0, "f"=>0, "g"=>0, "h"=>0, "i"=>0, "j"=>0, "k"=>0, "l"=>0, "m"=>0, "n"=>1, "o"=>1, "p"=>0, "q"=>0, "r"=>0, "s"=>0, "t"=>0, "u"=>0, "v"=>0, "w"=>0, "x"=>0, "y"=>0, "z"=>0}, 
								"h"=>{"a"=>0, "b"=>0, "c"=>0, "d"=>0, "e"=>0, "f"=>0, "g"=>0, "h"=>0, "i"=>0, "j"=>0, "k"=>0, "l"=>0, "m"=>0, "n"=>0, "o"=>0, "p"=>0, "q"=>0, "r"=>0, "s"=>0, "t"=>0, "u"=>0, "v"=>0, "w"=>0, "x"=>0, "y"=>0, "z"=>0}, 
								"i"=>{"a"=>0, "b"=>0, "c"=>0, "d"=>0, "e"=>0, "f"=>0, "g"=>1, "h"=>0, "i"=>0, "j"=>0, "k"=>0, "l"=>0, "m"=>0, "n"=>0, "o"=>0, "p"=>0, "q"=>0, "r"=>0, "s"=>0, "t"=>0, "u"=>0, "v"=>0, "w"=>0, "x"=>0, "y"=>0, "z"=>1}, 
								"j"=>{"a"=>0, "b"=>0, "c"=>0, "d"=>0, "e"=>0, "f"=>0, "g"=>0, "h"=>0, "i"=>0, "j"=>0, "k"=>0, "l"=>0, "m"=>0, "n"=>0, "o"=>0, "p"=>0, "q"=>0, "r"=>0, "s"=>0, "t"=>0, "u"=>0, "v"=>0, "w"=>0, "x"=>0, "y"=>0, "z"=>0}, 
								"k"=>{"a"=>0, "b"=>0, "c"=>0, "d"=>0, "e"=>0, "f"=>0, "g"=>0, "h"=>0, "i"=>0, "j"=>0, "k"=>0, "l"=>0, "m"=>0, "n"=>0, "o"=>0, "p"=>0, "q"=>0, "r"=>0, "s"=>0, "t"=>0, "u"=>0, "v"=>0, "w"=>0, "x"=>0, "y"=>0, "z"=>0}, 
								"l"=>{"a"=>0, "b"=>0, "c"=>0, "d"=>0, "e"=>0, "f"=>0, "g"=>0, "h"=>0, "i"=>0, "j"=>0, "k"=>0, "l"=>0, "m"=>0, "n"=>0, "o"=>1, "p"=>0, "q"=>0, "r"=>0, "s"=>0, "t"=>0, "u"=>0, "v"=>0, "w"=>0, "x"=>0, "y"=>0, "z"=>0}, 
								"m"=>{"a"=>1, "b"=>0, "c"=>0, "d"=>0, "e"=>0, "f"=>0, "g"=>0, "h"=>0, "i"=>0, "j"=>0, "k"=>0, "l"=>0, "m"=>0, "n"=>0, "o"=>0, "p"=>0, "q"=>0, "r"=>0, "s"=>0, "t"=>0, "u"=>0, "v"=>0, "w"=>0, "x"=>0, "y"=>0, "z"=>0}, 
								"n"=>{"a"=>2, "b"=>0, "c"=>0, "d"=>0, "e"=>1, "f"=>0, "g"=>1, "h"=>0, "i"=>0, "j"=>0, "k"=>0, "l"=>0, "m"=>0, "n"=>0, "o"=>0, "p"=>0, "q"=>0, "r"=>0, "s"=>0, "t"=>0, "u"=>0, "v"=>0, "w"=>0, "x"=>0, "y"=>0, "z"=>0}, 
								"o"=>{"a"=>0, "b"=>0, "c"=>0, "d"=>0, "e"=>0, "f"=>1, "g"=>0, "h"=>0, "i"=>0, "j"=>0, "k"=>0, "l"=>1, "m"=>0, "n"=>0, "o"=>0, "p"=>0, "q"=>0, "r"=>0, "s"=>0, "t"=>1, "u"=>1, "v"=>0, "w"=>0, "x"=>1, "y"=>0, "z"=>0}, 
								"p"=>{"a"=>0, "b"=>0, "c"=>0, "d"=>0, "e"=>0, "f"=>0, "g"=>0, "h"=>0, "i"=>1, "j"=>0, "k"=>0, "l"=>0, "m"=>0, "n"=>0, "o"=>0, "p"=>0, "q"=>0, "r"=>0, "s"=>0, "t"=>0, "u"=>0, "v"=>0, "w"=>0, "x"=>0, "y"=>0, "z"=>0}, 
								"q"=>{"a"=>0, "b"=>0, "c"=>0, "d"=>0, "e"=>0, "f"=>0, "g"=>0, "h"=>0, "i"=>0, "j"=>0, "k"=>0, "l"=>0, "m"=>0, "n"=>0, "o"=>0, "p"=>0, "q"=>0, "r"=>0, "s"=>0, "t"=>0, "u"=>0, "v"=>0, "w"=>0, "x"=>0, "y"=>0, "z"=>0}, 
								"r"=>{"a"=>1, "b"=>0, "c"=>0, "d"=>1, "e"=>0, "f"=>0, "g"=>0, "h"=>0, "i"=>0, "j"=>0, "k"=>1, "l"=>0, "m"=>0, "n"=>0, "o"=>1, "p"=>0, "q"=>0, "r"=>0, "s"=>0, "t"=>0, "u"=>0, "v"=>0, "w"=>0, "x"=>0, "y"=>0, "z"=>0}, 
								"s"=>{"a"=>0, "b"=>0, "c"=>0, "d"=>0, "e"=>0, "f"=>0, "g"=>0, "h"=>0, "i"=>0, "j"=>0, "k"=>0, "l"=>0, "m"=>0, "n"=>0, "o"=>0, "p"=>0, "q"=>0, "r"=>0, "s"=>0, "t"=>0, "u"=>0, "v"=>0, "w"=>1, "x"=>0, "y"=>0, "z"=>0}, 
								"t"=>{"a"=>0, "b"=>0, "c"=>0, "d"=>0, "e"=>0, "f"=>0, "g"=>0, "h"=>0, "i"=>0, "j"=>0, "k"=>0, "l"=>1, "m"=>0, "n"=>0, "o"=>0, "p"=>0, "q"=>0, "r"=>0, "s"=>0, "t"=>0, "u"=>0, "v"=>0, "w"=>0, "x"=>0, "y"=>0, "z"=>0}, 
								"u"=>{"a"=>0, "b"=>0, "c"=>0, "d"=>0, "e"=>0, "f"=>0, "g"=>0, "h"=>0, "i"=>0, "j"=>0, "k"=>0, "l"=>0, "m"=>0, "n"=>0, "o"=>0, "p"=>0, "q"=>0, "r"=>0, "s"=>1, "t"=>0, "u"=>0, "v"=>0, "w"=>0, "x"=>0, "y"=>0, "z"=>0}, 
								"v"=>{"a"=>1, "b"=>0, "c"=>0, "d"=>0, "e"=>0, "f"=>0, "g"=>0, "h"=>0, "i"=>0, "j"=>0, "k"=>0, "l"=>0, "m"=>0, "n"=>0, "o"=>0, "p"=>0, "q"=>0, "r"=>0, "s"=>0, "t"=>0, "u"=>0, "v"=>0, "w"=>0, "x"=>0, "y"=>0, "z"=>0}, 
								"w"=>{"a"=>0, "b"=>0, "c"=>0, "d"=>0, "e"=>1, "f"=>0, "g"=>0, "h"=>0, "i"=>0, "j"=>0, "k"=>0, "l"=>0, "m"=>0, "n"=>0, "o"=>0, "p"=>0, "q"=>0, "r"=>0, "s"=>0, "t"=>0, "u"=>0, "v"=>0, "w"=>0, "x"=>0, "y"=>0, "z"=>0}, 
								"x"=>{"a"=>0, "b"=>0, "c"=>0, "d"=>0, "e"=>1, "f"=>0, "g"=>0, "h"=>0, "i"=>0, "j"=>0, "k"=>0, "l"=>0, "m"=>0, "n"=>0, "o"=>1, "p"=>0, "q"=>0, "r"=>0, "s"=>0, "t"=>0, "u"=>0, "v"=>0, "w"=>0, "x"=>0, "y"=>0, "z"=>0}, 
								"y"=>{"a"=>0, "b"=>0, "c"=>0, "d"=>0, "e"=>0, "f"=>0, "g"=>0, "h"=>0, "i"=>0, "j"=>0, "k"=>0, "l"=>0, "m"=>0, "n"=>0, "o"=>0, "p"=>0, "q"=>0, "r"=>0, "s"=>0, "t"=>0, "u"=>0, "v"=>0, "w"=>0, "x"=>0, "y"=>0, "z"=>0}, 
								"z"=>{"a"=>1, "b"=>0, "c"=>0, "d"=>0, "e"=>1, "f"=>0, "g"=>0, "h"=>0, "i"=>0, "j"=>0, "k"=>0, "l"=>0, "m"=>0, "n"=>0, "o"=>0, "p"=>0, "q"=>0, "r"=>0, "s"=>0, "t"=>0, "u"=>0, "v"=>0, "w"=>0, "x"=>0, "y"=>0, "z"=>1}}
			expect(@check.markov_hash).to eq(markov)
		end

	end

end