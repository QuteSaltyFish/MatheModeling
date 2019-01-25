classdef SmallGraph
    %SMALLGRAPH Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        LeftNode;
        RightNode;
        Row;
        Col;
        State_map;
        Person_map;
    end
    
    methods
        function obj = SmallGraph(Lt, Rt, x, y)
            obj.LeftNode = Lt;
            obj.RightNode = Rt;
            obj.Row = x;
            obj.Col = y;
            obj.State_map = zeros(x, y);
            obj.Person_map = cell(x, y);
            obj = obj.spawn();
            obj.show();
        end
        
        function obj = spawn(obj)
            obj.Person_map(2,2) = {people(2,2,1,2)}; 
            obj.State_map(2,2) = 1;
        end

        function obj = loop(obj)
            State_map_new = obj.State_map;
            Person_map_new = obj.Person_map;
            for i = 1:obj.Row
                for j = 1:obj.Col
                    if obj.State_map(i,j)==1 %if there is a node
                        %%
                        %move the node
                        if j==1

                        elseif j==obj.Col

                        else
                            dir = -1;
                            u = i;
                            v = j;
                            for k = 0:(obj.Person_map{u,v}.velocity)
                                if sum(obj.State_map(:,v+dir)==0)~=0
                                    [m,n] = find(obj.State_map(:,v+dir)==0,1);
                                    State_map_new(m,v+dir) = 1;
                                    State_map_new(u,v) = 0;
                                    Person_map_new{m,v+dir} = obj.Person_map{u,v};
                                    Person_map_new{u,v} = {};
                                    u = m;
                                    v = v+dir;
                                end
                            end
                        end

                        %%
                    end
                end
            end
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
                        obj.Person_map{x,y} = {};
                    end
                end
            end
        end
                
        function show(obj)
            disp(obj.State_map);
            disp(obj.Person_map);
        end
    end
end

