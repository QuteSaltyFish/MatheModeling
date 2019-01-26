clc, clear;
s = [1,1,2]; t = [2,3,3]; w = [1,2,3];
c = graph(s,t,w);
plot(c);
c = addnode(c,1);
c = addedge(c,3,4,4);
edge = c.Edges;
edge{1,1}(1,1), edge(1,2)
h = plot(c);
h.layout('force');
p = shortestpath(c, 1, 4);
d = distances(c);
% D = cell(2,3);
% D(2,1) = {people(1,1,1,2)};
% g = SmallGraph(1,2,4,5);
% g.show();
a = [1,3,4];
b = [1,3,4];
C = d(1,a)*2;
D = d(2,a)*2;
% h = view(biograph(c,[],'ShowArrows','off','ShowWeights','off')); %draw the undirected graph
% Edges = getedgesbynodeid(h);
% set(Edges, 'LineColor', [0,0,0]); %black edge
% set(Edges, 'LineWidth', 1.5); %set lineWidth