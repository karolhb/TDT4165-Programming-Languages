functor
import
    System(show:Show showInfo:ShowInfo)
    Application(exit:Exit)
    OS
define
    \insert GenerateOdd.oz
    %\insert LazyGenerateOdd.oz
    \insert HammerFactory.oz
    
    % Task 1
    {ShowInfo "Task "#1}
    {Show {GenerateOdd ~1 10}}

    % Task 2
    {ShowInfo "\nTask "#2}
    {System.show {Product [1 2 3 4]}}

    % Task 3
    % {ShowInfo "\nTask "#3}
    % local Xs in
    %     thread Xs = {GenerateOdd 0 1000} end % Producer thread
    %     thread {Show {Product Xs}} end % Consumer thread
    % end

    % Task 4
    % {ShowInfo "\nTask "#4}
    % local XsL in
    %     thread XsL = {LazyGenerateOdd 0 1000} end % Producer thread
    %     thread {Show {Product XsL}} end % Consumer thread
    % end

    % Task 5
    %% a)
    {ShowInfo "\nTask 5"}
    {ShowInfo "\na)"}
    local HammerTime B in
        HammerTime = {HammerFactory}
        B = HammerTime.2.2.2.1
        {Show B}
        {Show HammerTime}
    end

    %% b)
    {ShowInfo "\nb)"}
    local HammerTime Consumer in
        HammerTime = {HammerFactory}
        Consumer = {HammerConsumer HammerTime 10}
        {Show Consumer}
    end

    %% c)
    {ShowInfo "\nc)"}
    {ShowInfo "\nWith buffer:"}
    local HammerStream Buffer in
        HammerStream = {HammerFactory}
        Buffer = {BoundedBuffer HammerStream 6}
        {Delay 6000}
        Consumer = {HammerConsumer Buffer 10}
        {Show Consumer}
    end

    {ShowInfo "\nWithout buffer:"}
    local HammerStream in
        HammerStream = {HammerFactory}
        {Delay 6000}
        Consumer = {HammerConsumer HammerStream 10}
        {Show Consumer}
    end





    {Exit 0}
end