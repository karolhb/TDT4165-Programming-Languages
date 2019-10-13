% Lazy version of the GenerateOdd function
fun lazy {LazyGenerateOdd S E}
  fun lazy {GenerateStream CurrentVal End JumpSize}
    if CurrentVal > End then
      nil
    else
      CurrentVal|{GenerateStream CurrentVal+JumpSize End JumpSize}
    end
  end 
in
  if S mod 2 == 1 orelse S mod 2 == ~1 then 
    {GenerateStream S E 2}
  else
    {GenerateStream S+1 E 2}
  end
end
