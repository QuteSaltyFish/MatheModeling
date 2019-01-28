classdef Door
    %DOOR Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Vol;
        Vol_Sequence;
    end
    
    methods
        function obj = Door()
            obj.Vol = [];
        end
        
        function obj = Loop(obj)
            obj.Vol(1,end+1)= 0;
        end
            
        function obj = Circle(obj)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            obj.Vol(1,end) = obj.Vol(1,end)+1;
        end
        
        function obj = accumulate(obj)
            [~,n]  = size(obj.Vol);
            for i = 1:n
                obj.Vol_Sequence(1,i) = sum(obj.Vol(1,1:i));
            end
        end
        
            
    end
end

