functor
import
    System
    Space
    Application
define
    \insert solve.oz
    \insert RelationClass.oz
    \insert TripPlanner.oz

    {System.show {SolveAll fun {$} {Plan c1 c4} end}}
    {System.show {BestPlan c1 c4}}

    {Application.exit 0}
end