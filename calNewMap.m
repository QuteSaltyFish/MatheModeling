function [State_map_new, Person_map_new, Move_map_new, u, v,time] = calNewMap(obj,State_map_new, Person_map_new, Move_map_new,u,v,dir,time,path)
%CALNEWMAP Summary of this function goes here
%   Detailed explanation goes here
    if v==1 && dir == -1
        time = 0;
    elseif v==obj.Col && dir ==1
        time = 0;
    else
        %if there is a empty spot and there can add a new stream.
        if sum(State_map_new(:,v+dir)==0)~=0
            time = time -1;
            if (sum(obj.Move_map(:,v+dir))==dir < obj.Row-1)
                [m,n] = find(State_map_new(:,v+dir)==0,1);
                State_map_new(m,v+dir) = 1;
                State_map_new(u,v) = 0;
                Person_map_new{m,v+dir} = Person_map_new{u,v};
                Person_map_new{u,v} = [];
                Move_map_new(m,v+dir) = dir;
                Move_map_new(u,v) = 0;
                u = m;
                v = v+dir;
            end

        elseif sum(State_map_new(:,v)==0)==0
            [State_map_new,Person_map_new,Move_map_new,u,v,time] = calNewMap(obj,State_map_new,Person_map_new,Move_map_new,u,v,-dir,time);
        else
            time = time-1;
        end
        

    end
end

