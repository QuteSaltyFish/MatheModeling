function [dir,path,singledistance,edgepath] = CalDir(index)
	global sms;
	global allpeople;
	global d;
    global ends;
    global c;
	obj = sms{allpeople{1,index}.position(1,3)};
	ld = d(obj.LeftNode, ends);
    rd = d(obj.RightNode, ends);   
    j = allpeople{1,index}.position(1,2);
    if min(ld)+j-1 > min(rd)+obj.Col-j
        dir = 1;
        fp = find(rd==min(rd),1);
        [path,distance,edgepath] = shortestpath(c,obj.RightNode, ends(fp));
        singledistance = distance + obj.Col-j;
    else
        dir = -1;
        fp = find(ld==min(ld),1);
        [path,distance,edgepath] = shortestpath(c,obj.LeftNode, ends(fp));
        singledistance = distance + j - 1 ;
    end
end

