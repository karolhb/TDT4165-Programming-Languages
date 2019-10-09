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
    if {RandomInt 1 100} =< 10 then
        defect|{HammerFactory}
    else
        working|{HammerFactory}
    end
end

fun {HammerConsumer HammerStream N}
    if N < 1 then 0
    elseif HammerStream.1 == working then 1 + {HammerConsumer HammerStream.2 N-1}
    else {HammerConsumer HammerStream.2 N-1}
    end
end

fun {BoundedBuffer HammerStream N}
    End={List.drop HammerStream N}
    fun lazy {Loop HammerStream End}
        case HammerStream of H|T then H|{Loop T End.2}
        end
    end
in
    {Loop HammerStream End}
end