% Sample database
CabinRel = {New RelationClass init}
{CabinRel 
    assertall([distance(c1 c2 4 true) distance(c1 c3 2 true) distance(c1 c4 9 true) distance(c3 c4 4 true) distance(c4 c6 7 true) distance(c2 c3 3 true) distance(c2 c5 11 true)])}

% Assuming that Connected is always true
proc {CabinP Cabin1 Cabin2 Distance} {CabinRel query(distance(Cabin1 Cabin2 Distance true))} end

fun {Plan Cabin1 Cabin2}
    Dist Path
in 
    {FindPath Cabin1 Cabin2 [Cabin1] Path 0 Dist}
    Dist#Path
end

% Assuming the connections between the cabins correspond to a connected graph (as stated on Piazza)
proc {FindPath Cabin1 Cabin2 Trace ?Path DistAcc ?Dist}
    choice 
        Cabin1 = Cabin2
        Path = {Reverse Trace}
        Dist = DistAcc
    [] Cabin3 Distance in
        {CabinP Cabin1 Cabin3 Distance}
        {Member Cabin3 Trace} = false
        {FindPath Cabin3 Cabin2 Cabin3|Trace Path DistAcc+Distance Dist}     
    end
end

% FoldL from the book
fun {FoldL L F U}
    case L
    of nil then U
    [] X|L2 then
    {FoldL L2 F {F U X}}
    end
end

fun {BestPlan Cabin1 Cabin2}
    fun {SmallestPair X Y}
        case X#Y of (H1#_)#(H2#_) then
            if H1 < H2 then
                X
            else
                Y
            end
        end
    end
    fun {Max H|T}
        {FoldL T SmallestPair H}
    end
in
    {Max {SolveAll fun {$} {Plan Cabin1 Cabin2} end}}
end


