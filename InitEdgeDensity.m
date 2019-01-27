function EdgeDensity = InitEdgeDensity()
    global sms;
    global ends;
    global c;
    EdgeDensity =[];
	%endEdges = zeros(HiddenEnds);
    [~,l] = size(ends);
    endEdges = {};
    endEdgeVol = zeros(1,l);
    endEdgeArea = zeros(1,l);
    endEdgeDensity = zeros(1,l);
    for i=1:l
        endEdges{end+1} = outedges(c, ends(i));
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
        EdgeDensity(1,i) = endEdgeDensity(i);
    end
end

