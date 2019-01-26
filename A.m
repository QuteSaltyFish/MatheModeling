classdef A
    %A Summary of this class goes here
    %   Detailed explanation goes here
    properties(GetAccess={?B})
        graph;
    end
    
    methods
        function obj = A(obj)
            %A Construct an instance of this class
            %   Detailed explanation goes here
        end
    end

    methods(Static = true)
        function obj = set(obj,x)
            A.graph = x;
        end

        function show()
            disp(graph);
        end
    end
end

