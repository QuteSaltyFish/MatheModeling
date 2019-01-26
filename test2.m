clc, clear;
%%
%Create a unDirected Graph
s = [1,1,2,3,4,5]; t = [2,3,3,4,5,6]; w = [5,6,7,8,9,10];
global c;
c = graph(s,t,w);
plot(c);
edges = c.Edges{:,1};
weights = c.Edges{:,2};
[row, col] = size(edges);
global sms;
sms = {};

global ends;
ends = [1,2];

global d;
d = distances(c);
%%
%use the edge of the Graph to create a SmallGraph
for i = 1:row
    sms{end+1}= SmallGraph(i,edges(i,1),edges(i,2),5,weights(i,1));
end

%%
%start to loop and show results
for i = 1:row
    sms{1,i} = sms{1,i}.loop();
    sms{1,i}.show();
end


% sm.Person_map{2,2}.velocity
