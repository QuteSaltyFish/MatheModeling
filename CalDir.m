function [dir,path,singledistance,edgepath] = CalDir(index)
	global sms;
	global allpeople;
	global d;
    global EndDensity;
    global c;
    global CurrentEnd;
	global ends;
    
    if allpeople{1,index}.foreign == 1
        obj = sms{allpeople{1,index}.position(1,3)};
        ld = d(obj.LeftNode, CurrentEnd);
        rd = d(obj.RightNode, CurrentEnd);   
        j = allpeople{1,index}.position(1,2);
        fpl = find(ld==min(ld),1);
        fpr = find(rd==min(rd),1);
        if ld(fpl)+j-1+ 10 * allpeople{1,index}.phone * EndDensity(fpl)> rd(fpr)+obj.Col-j+ 10 * allpeople{1,index}.phone * EndDensity(fpr)
            dir = 1;
            
            [path,distance,edgepath] = shortestpath(c,obj.RightNode, CurrentEnd(fpr));
            singledistance = distance + obj.Col-j+1;
        else
            dir = -1;
            
            [path,distance,edgepath] = shortestpath(c,obj.LeftNode, CurrentEnd(fpl));
            singledistance = distance + j;
        end
     else
         obj = sms{allpeople{1,index}.position(1,3)};
         ld = d(obj.LeftNode, ends);
         rd = d(obj.RightNode, ends);   
         j = allpeople{1,index}.position(1,2);
         fpl = find(ld==min(ld),1);
         fpr = find(rd==min(rd),1);
         if ld(fpl)+j-1+ 10 * allpeople{1,index}.phone * EndDensity(fpl)> rd(fpr)+obj.Col-j+ 10 * allpeople{1,index}.phone * EndDensity(fpr)
             dir = 1;
             
             [path,distance,edgepath] = shortestpath(c,obj.RightNode, ends(fpr));
             singledistance = distance + obj.Col-j+1;
         else
             dir = -1;
             
             [path,distance,edgepath] = shortestpath(c,obj.LeftNode, ends(fpl));
             singledistance = distance + j;
         end
    end
        
end

