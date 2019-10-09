fun {GenerateOdd S E}
    if E-S < 0 then nil
    elseif S mod 2 \= 0 then
        S|{GenerateOdd S+2 E}
    else
        S+1|{GenerateOdd S+3 E}
    end
end

fun {Product S}
    fun {ProductInner S A}
        case S
        of H|T then {ProductInner T A*H}
        [] nil then A
        end
    end
in
    {ProductInner S 1}
end