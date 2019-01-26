classdef B
    %B Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        data;
    end
    
    methods
        function obj = B()
            %B Construct an instance of this class
            %   Detailed explanation goes here
            data = x
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
end

