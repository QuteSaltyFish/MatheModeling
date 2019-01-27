[m,n] = size(ve1);
ve1(isnan(ve1)==1) = 0;
StartNode=[]; EndNode=[]; weight=[];
for i = 1:m
    for j = i:n
        if ve1(i,j)~=0
            StartNode = [StartNode,i];
            EndNode = [EndNode,j];
            weight = [weight,ve1(i,j)];
        end
    end
end

c = graph(StartNode, EndNode,weight);
plot(c);