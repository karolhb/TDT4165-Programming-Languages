% Task 2, calling the function "SumList" to prevent name collision with the other Sum function
fun {SumList List}
    case List of nil then 0
    [] H|T then H + {SumList T}
    end
end

% Tail recursive function, with a "wrapper"/outer function and an inner function that takes an accumulator
fun {SumTail List}
    fun {SumTailInner List Acc}
        case List of nil then Acc
        [] H|T then {SumTailInner T Acc+H}
        end
    end
in
    {SumTailInner List 0}
end