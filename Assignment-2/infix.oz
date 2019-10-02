fun {Infix Tokens}
    Operations = operator('plus':'+'
		 'minus':'-'
		 'multiply':'*'
		 'divide':'/')
    Commands = command(invert:'i'
         multinvert:'^'
         duplicatetop:''
         print:'')

    fun {InfixInternal Tokens ExpressionStack}
        case Tokens of nil then ExpressionStack.1 % returns the first element of the stack, which should be 
                                                  % the whole converted expression if the input represents a valid expression
        [] number(Number)|Tokens then {InfixInternal Tokens Number|ExpressionStack}
        [] operator(type:Operator)|Tokens then
            Top|NextToTop|Rest = ExpressionStack in
            {InfixInternal Tokens "("#NextToTop#' '#Operations.Operator#' '#Top#")"|Rest}
        [] command(Command)|Tokens then
            Top|Rest = ExpressionStack in 
            {InfixInternal Tokens Commands.Command#Top|Rest}
        else % skip the invalid token
            _|Rest = Tokens in
            {InfixInternal Rest ExpressionStack}
        end
    end
in
    try {InfixInternal Tokens nil}
    catch Ex then raise Ex end
    end
end