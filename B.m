global sms;
for i =1:peoplecount
	id = cellfun('length',allpeople);
	if id(1,i)~=0
		x =  allpeople{1,i}.position(1,1);
		y =  allpeople{1,i}.position(1,2);
		z =  allpeople{1,i}.position(1,3);
		if sms{1,z}.State_map(x,y)==0
			fprintf("Wrong!\n");
		end
	end
end