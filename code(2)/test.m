clear;
data = csvread('data.csv');
data2 = data;
%choose_T = csvread('answer.csv');
choose_T = [0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1];
caldata = zeros(500,90);
x = 0;                                                                       
min = 0;

for i = 1:90
    if choose_T(1,i) == 0
        data2(:,i-min) = [];
        min = min+1;
    end
end
for j = 1:500
    caldata(j,:) = interp1(data2(j*2,:),data2(1,:),data(j*2,:),'spline');
    for k = 1:90
        if choose_T(1,k) == 1
            x = x+50;
        end
        C = abs(caldata(j,k)-data(1,k));
            if (1>=C)&&(C>0.5)
                x = x+1;
            elseif (C>1)&&(C<=1.5)
                x= x+5;
            elseif (C>1.5)&&(C<=2)
                x = x+10;
            elseif (C>2)
                x= x+10000;
            end
    end
end
fitvalue = x/500;
disp(fitvalue);