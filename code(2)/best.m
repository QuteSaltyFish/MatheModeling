function [a,b] = best(pop,fitvalue)
[x,~] = size(pop);
a = pop(1,:);
b= fitvalue(1,1);

for i = 1:x
    if fitvalue(1,i)<=b
        a = pop(i,:);
        b = fitvalue(1,i);
    end
end
end