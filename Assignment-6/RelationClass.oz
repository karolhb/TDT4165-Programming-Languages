proc {Choose ?X Ys} 
    choice Ys=X|_ 
    [] Yr in Ys=_|Yr {Choose X Yr} end 
end

class RelationClass 
    attr d 
    meth init 
        d:={NewDictionary} 
    end 
    meth assertall(Is) 
        for I in Is do {self assert(I)} end 
    end 
    meth assert(I) 
        if {IsDet I.1} then 
            Is={Dictionary.condGet @d I.1 nil} in 
            {Dictionary.put @d I.1 {Append Is [I]}} 
        else 
            raise databaseError(nonground(I)) end 
        end 
    end 
    meth query(I) 
        if {IsDet I} andthen {IsDet I.1} then 
            {Choose I {Dictionary.condGet @d I.1 nil}} 
        else 
            {Choose I {Flatten {Dictionary.items @d}}} 
        end 
    end 
end
