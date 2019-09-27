functor
import
    System
    Application
define
    \insert QuadraticEquation.oz
    \insert SumList.oz
    \insert RightFold.oz
    \insert Quadratic.oz
    \insert LazyNumberGenerator.oz

    % Task 1
    {System.showInfo "-QuadraticEquation:"}
    {System.showInfo "--Two real roots (0.5 and -1):"}
    local A = 2.0 B = 1.0 C = ~1.0 RealSol X1 X2 in
        {QuadraticEquation A B C RealSol X1 X2}
        {System.show RealSol}
        {System.show X1}
        {System.show X2}
    end

    {System.showInfo "\n--No real roots (X1 and X2 should stay unbound):"}
    local A = 2.0 B = 1.0 C = 2.0 RealSol X1 X2 in
        {QuadraticEquation A B C RealSol X1 X2}
        {System.show RealSol}
        {System.show X1}
        {System.show X2}
    end

    {System.showInfo "\n--One real root (-1):"}
    local A = 2.0 B = 4.0 C = 2.0 RealSol X1 X2 in
        {QuadraticEquation A B C RealSol X1 X2}
        {System.show RealSol}
        {System.show X1}
        {System.show X2}
    end

    % Task 2
    {System.showInfo "\n-SumList (sum is 21):"}
    {System.show {SumList [1 2 3 4 5 6]}}

    % Task 3
    {System.showInfo "\n-RightFold (answers are 21, 3 and 14):"}
    {System.show {Sum [1 2 3 4 5 6]}}
    {System.show {Length [1 2 3]}}
    {System.show {Product [2 1 7]}}

    % Task 4
    {System.showInfo "\n-Quadratic (answer should be 17):"}
    {System.show {{Quadratic 3 2 1} 2}}

    % Task 5
    {System.showInfo "\n-LazyNumberGenerator (answers should be 0, 1 and 5):"}
    {System.show {LazyNumberGenerator 0}.1}
    {System.show {{LazyNumberGenerator 0}.2}.1}
    {System.show {{{{{{LazyNumberGenerator 0}.2}.2}.2}.2}.2}.1}

    % Task 6
    {System.showInfo "\n-Tail recursive Sum function (sum is 21):"}
    {System.show {SumTail [1 2 3 4 5 6]}}

    {Application.exit 0}
end