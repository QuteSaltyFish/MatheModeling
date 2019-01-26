function [State_map_new, Person_map_new] = calNewMap(obj,State_map_new, Person_map_new,i,j, dir)
%CALNEWMAP Summary of this function goes here
%   Detailed explanation goes here
    if j==1

    elseif j==obj.Col

    else
        u = i;
        v = j;
        for k = 1:(obj.Person_map{u,v}.velocity)
            if sum(obj.State_map(:,v+dir)==0)~=0
                [m,n] = find(obj.State_map(:,v+dir)==0,1);
                State_map_new(m,v+dir) = 1;
                State_map_new(u,v) = 0;
                Person_map_new{m,v+dir} = Person_map_new{u,v};
                Person_map_new{u,v} = [];
                u = m;
                v = v+dir;
            end
        end
    end
end

