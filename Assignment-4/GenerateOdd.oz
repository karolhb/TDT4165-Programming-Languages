fun {GenerateOdd S E}
    if E-S < 0 then nil
    elseif S mod 2 \= 0 then
        S|{GenerateOdd S+2 E}
    else
        S+1|{GenerateOdd S+3 E}
    end
end

fun {Product Xs A}
    case Xs
    of X|Xr then {Product Xr A*X}
    [] nil then A
    end
end