classdef SmallGraph
    %SMALLGRAPH Summary of this class goes here
    %   Detailed explanation goes here
    properties
        LeftNode;
        RightNode;
        Row;
        Col;
        index;
        State_map;
        Person_map;
        Move_map; %indicate last move
    end
    
    methods
        function obj = SmallGraph(index,Lt, Rt, x, y)
            obj.LeftNode = Lt;
            obj.RightNode = Rt;
            obj.Row = x;
            obj.Col = y;
            obj.index = index;
            obj.State_map = zeros(x, y);
            obj.Move_map = zeros(x,y);
            obj.Person_map = cell(x, y);
            for i = 1:obj.Col
                obj = obj.spawn(ceil(obj.Row/2),i);
            end
            % obj.show();
        end
        
        function obj = spawn(obj,x,y)
            obj.Person_map(x,y) = {people(2,2,1,2)}; 
            obj.State_map(x,y) = 1;
            obj.Move_map(x,y) = +inf;
        end

        function obj = loop(obj)
            global c;
            global d;
            global ends;
            global sms;
            State_map_new = obj.State_map;
            Person_map_new = obj.Person_map;
            Move_map_new = obj.Move_map;
            % imagesc(State_map_new);
            % colorbar();
            % pause(0.2);
            for i = 1:obj.Row
                for j = 1:obj.Col
                    if obj.State_map(i,j)==1 %if there is a node
                        %%
                        %move the node
                        u = i;
                        v = j;
                        ld = d(obj.LeftNode, ends);
                        rd = d(obj.RightNode, ends);    
                        if min(ld)+j-1 > min(rd)+obj.Col-j
                            dir = 1;
                            fp = find(rd==min(rd),1);
                            [path,~] = shortestpath(c,obj.RightNode, ends(fp));
                        else
                            dir = -1;
                            dir = 1;
                            fp = find(ld==min(ld),1);
                            [path,~] = shortestpath(c,obj.LeftNode, ends(fp));
                        end
                        time = obj.Person_map{u,v}.velocity;
                        while time>0
                            [State_map_new,Person_map_new,Move_map_new,u,v,time] = calNewMap(obj,State_map_new,Person_map_new,Move_map_new,u,v,dir,time,path);
                            % imagesc(State_map_new);
                            % colorbar();
                            % pause(0.2);
                        end
                        %%
                    end
                end
            end
            obj.State_map = State_map_new;
            obj.Person_map = Person_map_new;
            obj.Move_map = Move_map_new;
        end

        function obj = move(obj, x, y, dir)
            if y==0

            elseif y==obj.Col

            else
                for i = 0:(obj.Person_map{x,y}.velocity)
                    if sum(obj.State_map(:,y+dir)==0)~=0
                        [m,n] = find(obj.State_map(:,y+dir)==0,1);
                        obj.State_map(m,y+dir) = 1;
                        obj.State_map(x,y) = 0;
                        obj.Person_map{m,y+dir} = obj.Person_map{x,y};
                        obj.Person_map{x,y} = [];
                    end
                end
            end
        end
                
        function show(obj)
            global c;
            disp(c);
            disp(obj.State_map);
            disp(obj.Person_map);
            disp(obj.Move_map);
        end
    end
end

