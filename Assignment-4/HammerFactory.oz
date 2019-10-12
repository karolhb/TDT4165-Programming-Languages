fun {RandomInt Min Max}
    X = {OS.rand}
    MinOS
    MaxOS
in
    {OS.randLimits ?MinOS ?MaxOS}
    Min + X*(Max - Min) div (MaxOS - MinOS)
end

fun lazy {HammerFactory}
    {Delay 1000}
    if {RandomInt 0 10} == 0 then
        defect|{HammerFactory}
    else
        working|{HammerFactory}
    end
end

fun {HammerConsumer HammerStream N}
    if N > 0 then
        if HammerStream.1 == working then 1 + {HammerConsumer HammerStream.2 N-1}
        else {HammerConsumer HammerStream.2 N-1}
        end
    else 0
    end
end

fun {BoundedBuffer HammerStream N}
    End                                                     % Final position of buffer
    fun lazy {Loop Stream End}
        case Stream of H|T then H|{Loop T thread End.2 end} % Return the demanded element and a stream of the rest. End.2 runs the HammerFactory
        end
    end
in
    End = thread {List.drop HammerStream N} end             % Drop the first N values, evaluate them. End will be the stream after these are evaluated
    {Loop HammerStream End}
end