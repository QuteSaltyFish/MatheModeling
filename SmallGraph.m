classdef SmallGraph
    %SMALLGRAPH Summary of this class goes here
    %   Detailed explanation goes here
    properties
        LeftNode;
        RightNode;
        area;
        Row;
        Col;
        index;
        State_map;
        Person_map;
        Move_map; %indicate last move
        vol;
        Density_Data;
    end
    
    methods
        function obj = SmallGraph(index,Lt, Rt, x, y)
            obj.Density_Data=[];
            obj.LeftNode = Lt;
            obj.RightNode = Rt;
            obj.Row = x;
            obj.Col = y;
            obj.index = index;
            obj.area = x*y;
            obj.vol = 0;
            obj.State_map = zeros(x, y);
            obj.Move_map = zeros(x,y);
            obj.Person_map = cell(x, y);
            for i = ceil(obj.Row*2/7):ceil(obj.Row*5/7)
                for j = ceil(obj.Col*3/7):ceil(obj.Col*4/7)
                    obj = obj.spawn(i, j);
                end
 
            end
            % obj.show();
        end
        
        function obj = spawn(obj,x,y)
            global allpeople;
            global peoplecount;
            obj.vol = obj.vol + 1;
            peoplecount = peoplecount+1;
            obj.Person_map{x,y} = people(x,y,obj.index, 1+(rand()<0.9), rand()<0.9, rand()<0.8);
            obj.State_map(x,y) = 1;
            obj.Move_map(x,y) = 1;
            allpeople{1,peoplecount} = obj.Person_map{x,y};
            
        end

        function obj = Density_Loop(obj)
            obj.Density_Data(end+1) = obj.vol/obj.area;
        end
                
        function show(obj)
            global c;
            disp(c);
            % disp(obj.State_map);
            % disp(obj.Person_map);
            disp(obj.Move_map);
        end
    end
end

