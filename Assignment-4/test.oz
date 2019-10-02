functor
import
    System(show:Show)
    Application(exit:Exit)
define
    \insert GenerateOdd.oz
    
    {Show {GenerateOdd ~1 10}}

    local Xs in
        thread Xs={GenerateOdd 0 1000} end % Producer thread
        thread {System.show {Product Xs 1}} end % Consumer thread
    end

    {Exit 0}
end