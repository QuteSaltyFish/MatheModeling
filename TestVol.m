function TestVol()
    global sms;
    global peoplecount;
    all = 0;
    [~,n] = size(sms);
    for i = 1:n
        all = all + sms{i}.vol;
    end
    if all~=peoplecount
        fprintf("Wrong!\n");
    end
end