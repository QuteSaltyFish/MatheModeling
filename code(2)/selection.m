function newpop = selection(pop,fitvalue)
[x,y] = size(pop);
popsize = x;
newpop = zeros(popsize,101);

temp_fitvalue = fitvalue;

[x,~] = size(pop);
totalfit = sum(temp_fitvalue);
p_fit = temp_fitvalue/totalfit;
p_fit = cumsum(p_fit);

ms = sort(rand(x,1));%pop_size�����������
fitin = 1;
newin = 1;

while newin<=x
    if(ms(newin)<p_fit(fitin))
        newpop(newin,:) = pop(fitin,:);
        newin = newin+1;
    else
        fitin = fitin+1;
    end
end
end
