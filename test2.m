clc, clear;
%Create a unDirected Graph
global c;
load('data.mat');
% s = [1,1,2,3,4,5]; t = [2,3,3,4,5,6]; w = [5,6,7,8,9,10];
weight = floor(weight/10);
c = graph(EndNode,StartNode,weight);
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
%ends = [1,2,3];

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
        sms{end+1}= SmallGraph(i,edges(i,1),edges(i,2),50,weights(i,1));
end
distance = zeros(1,peoplecount);
id = cellfun('length',allpeople);
allpeople(id==0) = [];
% for i = 1:row
%     % sms{1,i} = sms{1,i}.loop();
%     sms{1,i}.show();
% end
while ~isempty(allpeople)
    %start to loop and show results
    [m,n] = size(allpeople);
    
    for i = 1:n
        time = allpeople{1,i}.velocity;
        [dir, path,distance(i),edgepath] = CalDir(i);
        
        while time>0
            time = CalNewPeople(i,time,dir);
        end
        i
    end
    loop = loop + 1;
    %delete null data
    id = cellfun('length',allpeople);
    allpeople(id==0) = [];
    
    
    dissum = [dissum,sum(distance)];
    
    plot(1:loop, dissum);
    %Display the data
%     for i = 1:row
%         sms{1,i} = sms{1,i}.loop();
%         sms{1,i}.show();
%     end
    
    n
end
loop



% sm.Person_map{2,2}.velocity
