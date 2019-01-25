function LifeGame()
%N表示迭代次数
clear all;clc;close;
N=100;
pauseTime=0.001;
width=100;%列数
height=80;%行数
%%
%初试图案
% %方案1：随机二值化
 state_array=floor(rand(width,height)*256);
 for i=1:width
     for j=1:height
         if(state_array(i,j)<128)
             state_array(i,j)=0;
         else state_array(i,j)=255;
         end
     end
 end
 
%方案2：在一条水平线上
%state_array=zeros(width,height);
%state_array(33,:)=ones(1,height)*255;
 
%方案3：在一条垂直线上
%   state_array=zeros(width,height);
%   state_array(:,6)=ones(width,1)*255;
 
%方案4：正方形
%state_array=zeros(width,height);
%state_array(30:70,20:70)=255;
%state_array(width/2, height/2) = 255;
imagesc(state_array);
colorbar();
title('初始帧图像');
hold on;pause(pauseTime*1.5);
%%
%change state
for step=1:N
state_array_new=zeros(width,height);
for i=1:width
    for j=1:height
    if(Alive_Num(i,j,state_array)==3) 
        state_array_new(i,j)=255;
    end
    if(Alive_Num(i,j,state_array)==2) 
        state_array_new(i,j)=state_array(i,j);
    end
    end
end
state_array=state_array_new;
imagesc(state_array);
colorbar();
t=['第 ',int2str(step),' 帧图像'];
title(t);
hold on;
pause(pauseTime);
end
%%
 
    function [result]=Alive_Num(i,j,array)
        [width,height]=size(array);
        result=0;
  %%
  for k=0:2
        try
            if(array(i-1,j-1+k)==255)
                result=result+1;
            end
        catch
             
        end
        try
            if(array(i+1,j-1+k)==255)
                result=result+1;
            end
        catch
             
        end
  end
        try
            if(array(i,j-1)==255)
                result=result+1;
            end
        catch
             
        end
       try
            if(array(i,j+1)==255)
                result=result+1;
            end
        catch
             
        end
          
  end 
end