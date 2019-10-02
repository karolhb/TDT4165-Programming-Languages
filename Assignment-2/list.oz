    fun {Length List}
        case List of nil then 0
        else
            1 + {Length List.2}
        end
    end

    fun {Take List Count}
        case List of nil then
            nil
        else
            if Count == 1 then
                List.1|nil
            else
                List.1|{Take List.2 Count-1}
            end
        end
    end

    fun {Drop List Count}
        case List of nil then nil
        else
            if Count == 0 then List
            else
                {Drop List.2 Count-1}
            end
        end
    end

    fun {Append List1 List2}
        case List1 of nil then List2
        [] H|T then H|{Append T List2}
        end
    end

    fun {Member List Element}
        case List of nil then 0
        else
            if List.1 == Element then 1
            else
                {Member List.2 Element}
            end
        end
    end

    % Første element i listen får posisjon/indeks 0
    fun {Position List Element}
        case List of nil then ~1
        else
            if {Member List Element} == 0 then ~1
            else
                1 + {Position List.2 Element}
            end
        end
    end
