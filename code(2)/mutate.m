function newpop = mutate(pop,pm,fitvalue)
[x,y] = size(pop);
newpop = pop;

pmm = 0.001;
favg = sum(fitvalue)/x;
for i = 1:x
    %{
    fd = fitvalue(1,i);
    if fd>=favg
        pm =pm- (pm-pmm)*(fd-favg)/(max(fitvalue)-favg);
    end
    %}
    if(rand<pm)
        point = round(rand*y);
        if point==0;
            continue;
        else
            newpop(i,point) = 1-pop(i,point);
        end
    end
end
for i = 1:x
    if sum(newpop(i,:))<=1
        newpop(i,:)=1;
    end
end
end
