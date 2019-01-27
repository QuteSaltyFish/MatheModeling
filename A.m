[m,n] = size(width);
edgeWidth = [];
for i= 1:m
    for j = i:n
        if width(i,j)~=0
            edgeWidth(end+1) = width(i,j);
        end
    end
end

           