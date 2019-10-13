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
        if HammerStream.1 == working then 
            1 + {HammerConsumer HammerStream.2 N-1}
        else 
            {HammerConsumer HammerStream.2 N-1}
        end
    else 0
    end
end

fun {BoundedBuffer HammerStream N}
    % Declare variable for final position of buffer
    End
    fun lazy {Loop Stream End}
        case Stream of H|T then 
            % Return the demanded element and a stream 
            % End.2 runs the factory that creates the stream
            H|{Loop T thread End.2 end}
        end
    end
in
    % Drop and evaluate the first N values
    % End is the stream after theevaluation of these
    End = thread {List.drop HammerStream N} end
    {Loop HammerStream End}
end