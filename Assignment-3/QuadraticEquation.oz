proc {QuadraticEquation A B C ?RealSol ?X1 ?X2}
    D = B*B - 4.0*A*C
in
    if D < 0.0 then % no real roots
        RealSol = false
    else % one or two real roots
        RealSol = true
        X1 = (~B + {Sqrt D})/(2.0*A)
        X2 = (~B - {Sqrt D})/(2.0*A)
    end
end