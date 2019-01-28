function time =  CalNewPeople(ix,time, dir)
    global allpeople;
    global sms;
    global path;
    global peoplecount;
    global edgepath;
    global distance;
    [~,b] = size(path);
    GraphIndex = allpeople{1,ix}.position(1,3);
    obj = sms{1,GraphIndex};
    u = allpeople{1,ix}.position(1,1);
    v = allpeople{1,ix}.position(1,2);
    if v==1 && dir == -1 %在图最左边，且前往下一张图
        time = time -1;
        %是终点
        if b == 1
            if path(1)==obj.LeftNode
                time = 0;
                obj.State_map(u,v) = 0;
                obj.Move_map(u,v) = 0;
%                  obj.Person_map{u,v} = [];
                allpeople{1,ix} = [];
                peoplecount = peoplecount - 1
                distance(1,ix)=0;
                obj.vol = obj.vol - 1;
            end

        %不是终点
        elseif b >= 2
            if sum(edgepath~=0)==1
                nextedge = sms{edgepath};
            else
                nextedge = sms{edgepath(find(edgepath~=obj.index,1))};
            end
            if nextedge.index == obj.index
                time = 0;
                obj.State_map(u,v) = 0;
                obj.Move_map(u,v) = 0;
%                 obj.Person_map{u,v} = [];
                allpeople{1,ix} = [];
                peoplecount = peoplecount - 1
                distance(1,ix)=0;
                obj.vol = obj.vol - 1;
            elseif nextedge.LeftNode == path(1)
                if sum(nextedge.State_map(:,1)==0)~=0
                    if (sum(nextedge.Move_map(:,1)==-dir) < nextedge.Row-1)
                        [m,~] = find(nextedge.State_map(:,1)==0,1);
                        %test add vol
                        test = obj.vol + nextedge.vol;
                        nextedge.State_map(m,1) = 1;
                        obj.State_map(u,v) = 0;
%                         nextedge.Person_map{m,1} = obj.Person_map{u,v};
%                         obj.Person_map{u,v} = [];
                        nextedge.vol = nextedge.vol + 1;
                        obj.vol = obj.vol - 1;
                        nextedge.Move_map(m,1) = -dir;
                        obj.Move_map(u,v) = 0;
                        allpeople{1,ix}.position(1,1) = m;
                        allpeople{1,ix}.position(1,2) = 1;
                        allpeople{1,ix}.position(1,3) = nextedge.index;
                        sms{1,nextedge.index} = nextedge;
                        if test~=(obj.vol + sms{1,nextedge.index}.vol)
                            fprintf("Wrong!");
                        end
                    end
                end
            else
                if sum(nextedge.State_map(:,nextedge.Col)==0)~=0
                    if (sum(nextedge.Move_map(:,nextedge.Col)==dir) < nextedge.Row-1)
                        test = obj.vol + nextedge.vol;
                        [m,~] = find(nextedge.State_map(:,nextedge.Col)==0,1);
                        nextedge.State_map(m,nextedge.Col) = 1;
                        obj.State_map(u,v) = 0;
%                         nextedge.Person_map{m,nextedge.Col} = obj.Person_map{u,v};
%                         obj.Person_map{u,v} = [];
                        nextedge.Move_map(m,nextedge.Col) = dir;
                        obj.Move_map(u,v) = 0;
                        nextedge.vol = nextedge.vol + 1;
                        obj.vol = obj.vol - 1;
                        allpeople{1,ix}.position(1,1) = m;
                        allpeople{1,ix}.position(1,2) = nextedge.Col;
                        allpeople{1,ix}.position(1,3) = nextedge.index;
                        sms{1,nextedge.index} = nextedge;
                        if test~=(obj.vol + sms{1,nextedge.index}.vol)
                            fprintf("Wrong!");
                        end
                    end
                end
            end
                
        end
    %从图的右侧进入下一张图
    elseif v==obj.Col && dir ==1
        time = time -1;
        %是终点
        if b == 1
            if path(1)==obj.RightNode
                time = 0;
                obj.State_map(u,v) = 0;
                obj.Move_map(u,v) = 0;
%                 obj.Person_map{u,v} = [];
                allpeople{1,ix} = [];
                peoplecount = peoplecount - 1
                distance(1,ix)=0;
                obj.vol = obj.vol - 1;
            end
        %不是终点
        elseif b >= 2
            if sum(edgepath~=0)==1
                nextedge = sms{edgepath};
            else
                nextedge = sms{edgepath(find(edgepath~=obj.index,1))};
            end
            if nextedge.index == obj.index
                time = 0;
                obj.State_map(u,v) = 0;
                obj.Move_map(u,v) = 0;
%                 obj.Person_map{u,v} = [];
                allpeople{1,ix} = [];
                peoplecount = peoplecount - 1
                distance(1,ix)=0;
                obj.vol = obj.vol - 1;
            elseif nextedge.LeftNode == path(1)
                if sum(nextedge.State_map(:,1)==0)~=0
                    if (sum(nextedge.Move_map(:,1)==dir) < nextedge.Row-1)
                        test = obj.vol + nextedge.vol;
                        [m,~] = find(nextedge.State_map(:,1)==0,1);
                        nextedge.State_map(m,1) = 1;
                        obj.State_map(u,v) = 0;
%                         nextedge.Person_map{m,1} = obj.Person_map{u,v};
%                         obj.Person_map{u,v} = [];
                        nextedge.Move_map(m,1) = dir;
                        obj.Move_map(u,v) = 0;
                        nextedge.vol = nextedge.vol + 1;
                        obj.vol = obj.vol - 1;
                        allpeople{1,ix}.position(1,1) = m;
                        allpeople{1,ix}.position(1,2) = 1;
                        allpeople{1,ix}.position(1,3) = nextedge.index;
                        sms{1,nextedge.index} = nextedge;
                        if test~=(obj.vol + sms{1,nextedge.index}.vol)
                            fprintf("Wrong!");
                        end
                    end
                end
            else
                if sum(nextedge.State_map(:,nextedge.Col)==0)~=0
                    if (sum(nextedge.Move_map(:,nextedge.Col)==-dir) < nextedge.Row-1)
                        test = obj.vol + nextedge.vol;
                        [m,~] = find(nextedge.State_map(:,nextedge.Col)==0,1);
                        nextedge.State_map(m,nextedge.Col) = 1;
                        obj.State_map(u,v) = 0;
%                         nextedge.Person_map{m,nextedge.Col} = obj.Person_map{u,v};
%                         obj.Person_map{u,v} = [];
                        nextedge.Move_map(m,nextedge.Col) = -dir;
                        obj.Move_map(u,v) = 0;
                        nextedge.vol = nextedge.vol + 1;
                        obj.vol = obj.vol - 1;
                        allpeople{1,ix}.position(1,1) = m;
                        allpeople{1,ix}.position(1,2) = nextedge.Col;
                        allpeople{1,ix}.position(1,3) = nextedge.index;
                        sms{1,nextedge.index} = nextedge;
                        if test~=(obj.vol + sms{1,nextedge.index}.vol)
                            fprintf("Wrong!");
                        end
                    end
                end
            end
                
        end
    else
        if sum(obj.State_map(:,v+dir)==0)~=0
            time = time -1;
            if (sum(obj.Move_map(:,v+dir)==dir) < obj.Row-1)
                [m,~] = find(obj.State_map(:,v+dir)==0,1);
                obj.State_map(m,v+dir) = 1;
                obj.State_map(u,v) = 0;
%                 obj.Person_map{m,v+dir} = obj.Person_map{u,v};
%                 obj.Person_map{u,v} = [];
                obj.Move_map(m,v+dir) = dir;
                obj.Move_map(u,v) = 0;
                allpeople{1,ix}.position(1,1) = m;
                allpeople{1,ix}.position(1,2) = v+dir;
            else 
                % obj.Move_map(u,v) = dir;
            end

%         elseif sum(obj.State_map(:,v)==0)==0 && dir~=obj.Move_map(u,v)
%             time = CalNewPeople(index,time, -dir);
        else
            time = 0;
            % obj.Move_map(u,v) = dir;
        end
    end
    sms{1,GraphIndex} = obj;
    %obj.Move_map
end