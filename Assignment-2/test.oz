functor
import
    System
    Application
define
    \insert list.oz
    \insert mdc.oz
    \insert infix.oz

    %%% Example/test code follows
    %% Ex. 1
    % a)
    {System.show {Length [1 6 3 9]}}
    % b)
    {System.show {Take [1 6 3 9] 2}}
    {System.show {Take [1 6 3 9] 5}}
    % c)
    {System.show {Drop [1 6 3 9] 2}}
    {System.show {Drop [1 6 3 9] 5}}
    % d)
    {System.show {Append [1 6 3 9] [3 2]}}
    % e)
    {System.show {Member [1 6 3 9] 2}}
    {System.show {Member [1 6 3 9] 3}}
    % f)
    {System.show {Position [1 6 3 9] 2}}
    {System.show {Position [1 6 3 9] 3}}

    %% Ex. 2
    % a)
    {System.show {Lex " 1 2 + 3 *"}}

    % b)
    {System.show {Tokenize {Lex "1 2 + 3 * p"}}}


    % c)
    {System.show {Interpret {Tokenize {Lex "1 2 3 + d"}}}}
    {System.show {Interpret [number(1.0) x(x) number(2.0) number(3.0) operator(type:plus) command(duplicatetop) command(multinvert)]}}

    %% Ex. 3
    {System.showInfo {Infix [number(1.0) number(10.0) number(9.0) operator(type:multiply) operator(type:minus) number(0.3) operator(type:plus)]}}
    {System.showInfo {Infix {Tokenize {Lex "1 2 3 + d"}}}}
    {System.showInfo {Infix {Tokenize {Lex "3.0 10.0 9.0 * - 0.3 +"}}}}
    {System.showInfo {Infix [number(3.0) command(invert) number(10.0) number(9.0) operator(type:multiply) operator(type:minus) number(0.3) operator(type:plus)]}}

    {Application.exit 0}
end