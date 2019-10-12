fun {GenerateOdd S E}
  fun {GenerateStream CurrentVal End JumpSize}
    if CurrentVal > End then
      nil
    else
      CurrentVal|{GenerateStream CurrentVal+JumpSize End JumpSize}
    end
  end in
  if S mod 2 == 1 orelse S mod 2 == ~1 then 
    {GenerateStream S E 2}
  else
    {GenerateStream S+1 E 2}
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

fun {FirstDigits Num Count}
    if Num >= {Pow 10 Count} then
        {FirstDigits Num div 10 Count}
    else Num
    end
end