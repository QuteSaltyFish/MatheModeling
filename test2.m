clc, clear;

people_num_change = [];
%Create a unDirected Graph
risk = 0;
global c;
global edgeWidth;
load('data.mat');
load('data2.mat');
% s = [1,1,2,3,4,5]; t = [2,3,3,4,5,6]; w = [5,6,7,8,9,10];
weight = floor(weight/10);
c = graph(EndNode(1,1:end),StartNode(1,1:end), weight(1,1:end));
% c = graph(s, t, w);
plot(c);

%variables initiation
edges = c.Edges{:,1};
weights = c.Edges{:,2};
[row, col] = size(edges);
loop = 0;
dissum = [];
global sms;
sms = {};
 

global ends;
ends = [45,49,50,65];
% ends = [1,2,3];

global HiddenEnds;
HiddenEnds = [1,2,3];

global EndDensity;

global EndChoice;
EndChoice = zeros(size(HiddenEnds));
[~,m] = size(HiddenEnds);
Th = 1-4/(4+m)+0.05;

global CurrentEnd;
tmp = EndChoice .* HiddenEnds;
id = tmp==0;
tmp(:,id)=[];
CurrentEnd = [ends,tmp]; 

global d;
d = distances(c);

global allpeople;
allpeople = cell(1,10000);
global peoplecount;
peoplecount = 0;
global path;
global edgepath;
global distance;

%use the edge of the Graph to create a SmallGraph
for i = 1:row
        sms{end+1}= SmallGraph(i,edges(i,1),edges(i,2),edgeWidth(1,i),weights(i,1));
end
distance = zeros(1,peoplecount);
id = cellfun('length',allpeople);
allpeople(id==0) = [];
% for i = 1:row
%     % sms{1,i} = sms{1,i}.loop();
%     sms{1,i}.show();
% end
% EndDensity = OpenDoors(Th);

EndDensity = InitEdgeDensity();
while ~isempty(allpeople)
    %start to loop and show results
    [m,n] = size(allpeople);
    
    for i = 1:n
        time = allpeople{1,i}.velocity;
        [dir, path,distance(1,i),edgepath] = CalDir(i);
        while time>0
            if loop==0 && i==2518
                fprintf("!");
            end
            time = CalNewPeople(i,time,dir); 
            TestVol();
        end
        i;
    end
    [p,q] = size(sms);
    for i = 1:q
        sms{i} = sms{i}.Density_Loop();
        if sms{i}.vol<0
            fprintf("Wrong!");
        end
    end
    [p,q] = size(sms);
    for k = 1:q
        sms{k} = sms{k}.Density_Loop();
        if sms{k}.vol<0
           fprintf("Wrong!");
        end
    end
    loop = loop + 1;
    %delete null data
    id = cellfun('length',allpeople);
    allpeople(id==0) = [];
    id = find(distance==0);
    distance(:,id)=[];
    
    %visualizaion matrix
    
    if mod(loop,10) == 0
        figure('Name','My Figure1');
        state_array = 255 * sms{92}.State_map;
        imagesc(state_array);
        colorbar();
    %     title("The ", num2str(loop), "th loop");
    end
    people_num_change(end+1) = peoplecount;
    [u,v] = size(distance);
    if v ~=peoplecount
        disp(1);
    end
%     if sum(distance~=0)~=peoplecount
%         disp(1);
%     end
    dissum = [dissum,sum(distance)];
    %Display the data
%     for i = 1:row
%         sms{1,i} = sms{1,i}.loop();
%         sms{1,i}.show();
%     end

%   open the hiddenDoor
	EndDensity = OpenDoors(Th);
    risk = risk + sum(EndChoice);
end
loop

% sm.Person_map{2,2}.velocity
