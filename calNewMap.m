function [State_map_new, Person_map_new, Move_map_new, u, v,time] = calNewMap(obj,State_map_new, Person_map_new, Move_map_new,u,v,dir,time,path)
%CALNEWMAP Summary of this function goes here
%   Detailed explanation goes here
    global sms;
    global c;
    global allpeople;
    [~,b] = size(path);
    if v==1 && dir == -1
        time = time -1;
        if b == 1
            if path(1)==obj.LeftNode
                time = 0;
                State_map_new(u,v) = 0;
                Move_map_new(u,v) = 0;
                Person_map_new{u,v} = [];
                allpeople = allpeople - 1;
            end

        elseif b >= 2
            nextedge = sms{findedge(c,path(1),path(2))};
            if nextedge.LeftNode == path(1)
                if sum(nextedge.State_map(:,1)==0)~=0
                    if (sum(nextedge.Move_map(:,1)==-dir) < nextedge.Row-1)
                        [m,n] = find(nextedge.State_map(:,1)==0,1);
                        nextedge.State_map(m,1) = 1;
                        State_map_new(u,v) = 0;
                        nextedge.Person_map{m,1} = Person_map_new{u,v};
                        Person_map_new{u,v} = [];
                        nextedge.Move_map(m,1) = -dir;
                        Move_map_new(u,v) = 0;
                        u = m;
                        v = 1;
                        while time>0
                            [nextedge.State_map,nextedge.Person_map,nextedge.Move_map,u,v,time] = calNewMap(nextedge,nextedge.State_map,nextedge.Person_map,nextedge.Move_map,u,v,-dir,time,path(:,2:end));
                        end
                        sms{findedge(c,path(1),path(2))} = nextedge;
                    end
                end
            else
                if sum(nextedge.State_map(:,nextedge.Col)==0)~=0
                    if (sum(nextedge.Move_map(:,nextedge.Col)==dir) < nextedge.Row-1)
                        [m,n] = find(nextedge.State_map(:,nextedge.Col)==0,1);
                        nextedge.State_map(m,nextedge.Col) = 1;
                        State_map_new(u,v) = 0;
                        nextedge.Person_map{m,nextedge.Col} = Person_map_new{u,v};
                        Person_map_new{u,v} = [];
                        nextedge.Move_map(m,nextedge.Col) = dir;
                        Move_map_new(u,v) = 0;
                        u = m;
                        v = nextedge.Col;
                        if time>0
                            [nextedge.State_map,nextedge.Person_map,nextedge.Move_map,u,v,time] = calNewMap(nextedge,nextedge.State_map,nextedge.Person_map,nextedge.Move_map,u,v,dir,time,path(:,2:end));
                        end
                        sms{findedge(c,path(1),path(2))} = nextedge;
                    end
                end
            end
                
        end
        
            
%   
    elseif v==obj.Col && dir ==1
        time = time -1;
        if b == 1
            if path(1)==obj.RightNode
                time = 0;
                State_map_new(u,v) = 0;
                Move_map_new(u,v) = 0;
                Person_map_new{u,v} = [];
                allpeople = allpeople - 1;
            end
        elseif b >= 2
            nextedge = sms{findedge(c,path(1),path(2))};
            if nextedge.LeftNode == path(1)
                if sum(nextedge.State_map(:,1)==0)~=0
                    if (sum(nextedge.Move_map(:,1)==dir) < nextedge.Row-1)
                        [m,n] = find(nextedge.State_map(:,1)==0,1);
                        nextedge.State_map(m,1) = 1;
                        State_map_new(u,v) = 0;
                        nextedge.Person_map{m,1} = Person_map_new{u,v};
                        Person_map_new{u,v} = [];
                        nextedge.Move_map(m,1) = dir;
                        Move_map_new(u,v) = 0;
                        u = m;
                        v = 1;
                        if time>=0
                            [nextedge.State_map,nextedge.Person_map,nextedge.Move_map,u,v,time] = calNewMap(nextedge,nextedge.State_map,nextedge.Person_map,nextedge.Move_map,u,v,dir,time,path(:,2:end));
                        end
                        sms{findedge(c,path(1),path(2))} = nextedge;
                    end
                end
            else
                if sum(nextedge.State_map(:,nextedge.Col)==0)~=0
                    if (sum(nextedge.Move_map(:,nextedge.Col)==-dir) < nextedge.Row-1)
                        [m,n] = find(nextedge.State_map(:,nextedge.Col)==0,1);
                        nextedge.State_map(m,nextedge.Col) = 1;
                        State_map_new(u,v) = 0;
                        nextedge.Person_map{m,nextedge.Col} = Person_map_new{u,v};
                        Person_map_new{u,v} = [];
                        nextedge.Move_map(m,nextedge.Col) = -dir;
                        Move_map_new(u,v) = 0;
                        u = m;
                        v = nextedge.Col;
                        if time>=0
                            [nextedge.State_map,nextedge.Person_map,nextedge.Move_map,u,v,time] = calNewMap(nextedge,nextedge.State_map,nextedge.Person_map,nextedge.Move_map,u,v,-dir,time,path(:,2:end));
                        end
                        sms{findedge(c,path(1),path(2))} = nextedge;
                    end
                end
            end
                
        end
        
    else
        %if there is a empty spot and there can add a new stream.
        if sum(State_map_new(:,v+dir)==0)~=0
            time = time -1;
            if (sum(obj.Move_map(:,v+dir)==dir) < obj.Row-1)
                [m,n] = find(State_map_new(:,v+dir)==0,1);
                State_map_new(m,v+dir) = 1;
                State_map_new(u,v) = 0;
                Person_map_new{m,v+dir} = Person_map_new{u,v};
                Person_map_new{u,v} = [];
                Move_map_new(m,v+dir) = dir;
                Move_map_new(u,v) = 0;
                u = m;
                v = v+dir;
            else 
                Move_map_new(u,v) = dir;
            end

        elseif sum(State_map_new(:,v)==0)==0 && dir~=Move_map_new(u,v)
            [State_map_new,Person_map_new,Move_map_new,u,v,time] = calNewMap(obj,State_map_new,Person_map_new,Move_map_new,u,v,-dir,time);
        else
            time = time-1;
            Move_map_new(u,v) = dir;
        end
        

    end
end

