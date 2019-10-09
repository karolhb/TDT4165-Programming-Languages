fun lazy {LazyGenerateOdd S E}
    if E-S < 0 then nil
    elseif S mod 2 \= 0 then
        S|{LazyGenerateOdd S+2 E}
    else
        S+1|{LazyGenerateOdd S+3 E}
    end
end