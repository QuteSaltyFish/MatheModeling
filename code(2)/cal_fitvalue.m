function fitvalue = cal_fitvalue(pop)
    [m,n] = size(pop);
    fitvalue = zeros(1,m);
    for i=1:m
        fitvalue(1,i) = A(pop(i));
    end
end
