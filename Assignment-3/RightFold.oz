fun {RightFold List Op U}
    % if the list is empty, i.e., we are at the end of the list, 
    % then return the neutral element. This element will be applied
    % to the result by the given operation Op
    case List of nil then U
    % if there are elements left in the list, apply the given
    % operation Op to the list
    [] H|T then {Op H {RightFold T Op U}}
    end
end

fun {Sum List}
    {RightFold List fun {$ X Y} X+Y end 0}
end

fun {Length List}
    {RightFold List fun {$ X Y} 1+Y end 0}
end

% Extra: Using RightFold to calculate product of elements in list
fun {Product List}
    {RightFold List fun {$ X Y} X*Y end 1}
end
