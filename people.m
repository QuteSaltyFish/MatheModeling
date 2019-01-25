classdef people
    %PEOPLE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        velocity;
        position;
        phone;
        foreign;        
    end
    
    methods
        function obj = people(x,y,z,v)
            %PEOPLE Construct an instance of this class
            %   Detailed explanation goes here
            choice = [1,0,0];
            if nargin == 0
                obj.position = [0,0,0];
                obj.velocity = v;
            else
                obj.position = [x,y,z];
                obj.velocity = v;
            end
        end
        
        function show(obj)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            fprintf('The volocity is:')
            disp(obj.velocity);
            fprintf('The position is:')
            disp(obj.position);
        end

        function obj=relocate(obj,x,y,z)
            obj.position = [x,y,z];
        end
    end
end

