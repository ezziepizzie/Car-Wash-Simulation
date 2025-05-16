function time = generate_service_time(rn, bay)
    switch bay
        case 1
            if rn < 0.3
                time = 2;
            elseif rn < 0.8
                time = 4;
            else
                time = 6;
            end
        case 2
            if rn < 0.4
                time = 3;
            elseif rn < 0.8
                time = 5;
            else
                time = 7;
            end
        case 3
            if rn < 0.5
                time = 1;
            elseif rn < 0.8
                time = 4;
            else
                time = 8;
            end
    end
end