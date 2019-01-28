function [loop, risk, mainflow, otherflow] = mainFunction(mag,x)
    people_num_change = [];
    [a,b] = size(x);
    
            
    %Create a unDirected Graph
    risk = 0;
    global c;
    global edgeWidth;
    load('data.mat');
    load('data2.mat');
    % s = [1,1,2,3,4,5]; t = [2,3,3,4,5,6]; w = [5,6,7,8,9,10];
    weight = ceil(weight/mag);
    c = graph(EndNode(1,1:end),StartNode(1,1:end), ceil(weight(1,1:end)/mag));
    % c = graph(s, t, w);
%     plot(c);

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
    HiddenEnds=[];
    for i=1:b
        if x(i)==1 && i~=45 && i~=49 && i~=50 && i~=65
            HiddenEnds(end+1)=i;
        end
    end
    
    global EndDensity;

    global EndChoice;
    EndChoice = zeros(size(HiddenEnds));
    [~,m] = size(HiddenEnds);
    Th = 1-4/(4+m)+0.05;
    
    global AllEnds;
    AllEnds = [ends, HiddenEnds];
    
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
    global EndFlow;
    [~,y1] = size(ends);
    [~,y2] = size(HiddenEnds);
    for i = 1:(y1+y2)
        EndFlow{i} = Door();
    end
    while ~isempty(allpeople)
        loop = loop + 1;
        for i = 1:(y1+y2)
            EndFlow{i} = EndFlow{i}.Loop();
        end
        %start to loop and show results
        [m,n] = size(allpeople);

        for i = 1:n
            time = allpeople{1,i}.velocity;
            [dir, path,distance(1,i),edgepath] = CalDir(i);
            while time>0
                time = CalNewPeople(i,time,dir); 
            end
        end
        [p,q] = size(sms);
        for i = 1:q
            sms{i} = sms{i}.Density_Loop();
            if sms{i}.vol<0
                fprintf("Wrong!");
            end
        end
        %delete null data
        id = cellfun('length',allpeople);
        allpeople(id==0) = [];
        id = find(distance==0);
        distance(:,id)=[];

        people_num_change(end+1) = peoplecount;
        dissum = [dissum,sum(distance)];
    
        EndDensity = OpenDoors(Th);
        risk = risk + sum(EndChoice);
    end
    loop
    mainflow=0;
    otherflow=0;
    for i = 1:(y1+y2)
        EndFlow{i} = EndFlow{i}.accumulate();
        if i<=y1
            mainflow = mainflow + sum(EndFlow{i}.Vol);
        else
            otherflow = otherflow + sum(EndFlow{i}.Vol);
        end
    end
end
