
clear;
popsize = 10;
chromlength = 73;
generation_size = 80;
firstbestfit = 0;
pc = 0.8;
pm = 0.1;

Bestindividual = zeros(generation_size,chromlength);
BestFit = zeros(1,generation_size);

pop = initpop(popsize,chromlength);

for i = 1:3
    i
    fitvalue = cal_fitvalue(pop);
    [bestindividual,bestfit] = best(pop,fitvalue);
    Bestindividual(i,:) = bestindividual;
    BestFit(1,i) = bestfit; 
    temp = bestindividual;
    newpop = selection(pop,fitvalue);
    newpop = cross(newpop,pc,fitvalue);
    newpop = mutate(newpop,pm,fitvalue);

    pop = newpop;
    pop(1,:) = temp;
end
draw;
[choose_T,cost] = best(Bestindividual,BestFit);
disp(sum(choose_T));
disp(cost);
