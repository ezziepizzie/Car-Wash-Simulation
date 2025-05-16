function type = generate_service_type(rn)
    if rn < 0.3
        type = 1;
    elseif rn < 0.7
        type = 2;
    else
        type = 3;
    end
end