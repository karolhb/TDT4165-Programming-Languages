% a)
fun {Lex Input}
    {String.tokens Input & }
end

% b)
fun {Tokenize Lexemes}
    Operations = '#'('+':plus '-':minus '*':multiply '/':divide)
    Commands = '#'('p':print 'd':duplicatetop 'i':invert '^':multinvert)
in
    {Map Lexemes
        fun {$ Lexeme}
            if {HasFeature Operations {String.toAtom Lexeme}} then
                operator(type:Operations.{String.toAtom Lexeme})
            elseif {HasFeature Commands {String.toAtom Lexeme}} then
                command(Commands.{String.toAtom Lexeme})
            else
                try % if not a number => raise exception
                    number({String.toFloat Lexeme})
                catch Ex then raise Ex end
                end
            end
        end
    }
end

% c)
fun {Interpret Tokens}
    Commands = command(print:fun {$ Top|Rest} {System.show Top} Top|Rest end 
		 duplicatetop:fun {$ Top|Rest} Top|Top|Rest end
         invert:fun {$ Top|Rest} ~Top|Rest end
         multinvert:fun{$ Top|Rest} {Number.pow Top ~1.0}|Rest end)
    Operations = operator('plus':Number.'+'
		 'minus':Number.'-'
		 'multiply':Number.'*'
		 'divide':Float.'/')
    fun {Iterate Stack Tokens}
        case Tokens of nil then 
            {Tokenize {Map {Reverse Stack} Float.toString}}    
        [] number(Number)|Tokens then {Iterate Number|Stack Tokens}
        [] command(Command)|Tokens then
	        {Iterate {Commands.Command Stack} Tokens}
        [] operator(type:Operator)|Tokens then
	        Top|NextToTop|Rest = Stack in
	        {Iterate {Operations.Operator NextToTop Top}|Rest Tokens}
        else % skip the invalid token
            _|Rest = Tokens in
            {Iterate Stack Rest}
        end
    end
in
    try {Iterate nil Tokens}
    catch Ex then raise Ex end
    end
end