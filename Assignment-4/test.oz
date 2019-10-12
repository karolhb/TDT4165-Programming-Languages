functor
import
    System(show:Show showInfo:ShowInfo)
    Application(exit:Exit)
    OS
define
    \insert GenerateOdd.oz
    \insert LazyGenerateOdd.oz
    \insert HammerFactory.oz
    
    % Task 1
    {ShowInfo "Task 1"}
    {Show {GenerateOdd ~1 10}}

    % Task 2
    {ShowInfo "\nTask 2"}
    {System.show {Product [1 2 3 4]}}

    % Task 3
    local Xs N = 3 in
        thread Xs = {GenerateOdd 0 1000} end % Producer thread
        thread {ShowInfo "\nTask 3\nFirst "#N#" digits:"} {Show {FirstDigits {Product Xs} N}} end % Consumer thread
    end

    {Delay 1000} % Wait for Task 3 to finish

    % Task 4   
    local Xs N = 3 in
        thread Xs = {LazyGenerateOdd 0 1000} end % Producer thread
        thread {ShowInfo "\nTask 4\nFirst "#N#" digits:"} {Show {FirstDigits {Product Xs} N}} end % Consumer thread
    end

    % Task 5
    %% a)
    local HammerTime B StartTime EndTime in
        {Time.time StartTime}
        HammerTime = {HammerFactory}
        B = HammerTime.2.2.2.1
        {Time.time EndTime}
        {ShowInfo "\nTask 5\na)"}
        {Show B}
        {Show HammerTime}
        {ShowInfo "Time elapsed: "#(EndTime-StartTime)#" seconds"}
    end

    %% b)
    local HammerTime Consumer StartTime EndTime in
        {Time.time StartTime}
        HammerTime = {HammerFactory}
        Consumer = {HammerConsumer HammerTime 10}
        {Time.time EndTime}
        {ShowInfo "\nb)"}
        {Show Consumer}
        {ShowInfo "Time elapsed: "#(EndTime-StartTime)#" seconds"}
    end

    %% c)
    local HammerStream Buffer Consumer StartTime EndTime in
        {Time.time StartTime}
        HammerStream = {HammerFactory}
        Buffer = {BoundedBuffer HammerStream 6}
        {Delay 6000}
        Consumer = {HammerConsumer Buffer 10}
        {Time.time EndTime}
        {ShowInfo "\nc)"}
        {ShowInfo "With buffer:"}
        {Show Consumer}
        {ShowInfo "Time elapsed: "#(EndTime-StartTime)#" seconds"}
    end

    local HammerStream Consumer StartTime EndTime in
        {Time.time StartTime}
        HammerStream = {HammerFactory}
        {Delay 6000}
        Consumer = {HammerConsumer HammerStream 10}
        {Time.time EndTime}
        {ShowInfo "\nWithout buffer:"}
        {Show Consumer}
        {ShowInfo "Time elapsed: "#(EndTime-StartTime)#" seconds"}
    end

    {Exit 0}
end