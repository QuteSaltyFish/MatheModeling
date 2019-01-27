function  EdgeDensity = OpenDoors(Th)
%   Detailed explanation goes here
	global sms;
    global ends;
    global c;
    global EndChoice;
    global HiddenEnds;
    global CurrentEnd;
    
    EdgeDensity =[];
	%endEdges = zeros(HiddenEnds);
    [~,l] = size(CurrentEnd);
    endEdges = {};
    endEdgeVol = zeros(1,l);
    endEdgeArea = zeros(1,l);
    endEdgeDensity = zeros(1,l);
    for i=1:l
        endEdges{end+1} = outedges(c, CurrentEnd(i));
        %outedges(c, HiddenEnds(1,i))
    end
    for i=1:l
        E = endEdges{i};
        [m,~]=size(E);
        for j=1:m
            endEdgeVol(i) = endEdgeVol(i) + sms{E(j)}.vol;
            endEdgeArea(i) = endEdgeArea(i) + sms{E(j)}.area;
        end
        endEdgeDensity(i) = endEdgeVol(i)/endEdgeArea(i);
        EdgeDensity(end+1) = endEdgeDensity(i);
    end
    
    
    
    endEdges = {};
    [~,n] = size(HiddenEnds);
    for i=1:n
        endEdges{end+1} = outedges(c, HiddenEnds(i));
        %outedges(c, HiddenEnds(1,i))
    end
    endEdgeVol = zeros(1,n);
    endEdgeArea = zeros(1,n);
    endEdgeDensity = zeros(1,n);
    for i=1:n
        E = endEdges{i};
        [m,~]=size(E);
        for j=1:m
            endEdgeVol(i) = endEdgeVol(i) + sms{E(j)}.vol;
            endEdgeArea(i) = endEdgeArea(i) + sms{E(j)}.area;
        end
        endEdgeDensity(i) = endEdgeVol(i)/endEdgeArea(i);
    end
    
    [val,y] = max(endEdgeDensity);
    x=l;
    while val+ 1-x/(l+n)>Th
        EndChoice(1,y) = 1;
        x = x+1;
        EdgeDensity(end+1) = endEdgeDensity(y);
        endEdgeDensity(1,y) = 0;
        [val,y] = max(endEdgeDensity);
    end
    tmp = EndChoice .* HiddenEnds;
    id = tmp==0;
    tmp(:,id)=[];
    CurrentEnd = [ends,tmp]; 

end

