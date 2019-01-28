function newpop = cross(pop,pc,fitvalue)
[x,y] = size(pop);
newpop = pop;

pcc = 0.6;
favg = sum(fitvalue)/x;
for i = 1:2:x-1
    %{
    fd = max(fitvalue(1,i),fitvalue(1,i+1));
    if fd>=favg
        pc =pc- (pc-pcc)*(fd-favg)/(max(fitvalue)-favg);
    end
    %}
    if(rand<pc)
        for j = 1:y
            newpop(i,j) = pop(i,j)&pop(i+1,j);
            newpop(i+1,j) = pop(i,j)|pop(i+1,j);
        end
    else
        newpop(i,:) = pop(i,:);
        newpop(i+1,:) = pop(i+1,:);
    end
end
for i = 1:x
    if sum(newpop(i,:))<=1
        newpop(i,:)=1;
    end
end

end
