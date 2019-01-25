function LifeGame()
%N表示迭代次数
clear all;clc;close;
N=100;
pauseTime=0.1;
width=100;%列数
height=80;%行数
%%
%初试图案
% % %方案1：随机二值化
%  state_array=floor(rand(width,height)*256);
%  for i=1:width
%      for j=1:height
%          if(state_array(i,j)<128)
%              state_array(i,j)=0;
%          else state_array(i,j)=255;
%          end
%      end
%  end
 
%方案2：在一条水平线上
%state_array=zeros(width,height);
%state_array(33,:)=ones(1,height)*255;
 
%方案3：在一条垂直线上
%   state_array=zeros(width,height);
%   state_array(:,6)=ones(width,1)*255;
 
%方案4：正方形
state_array = zeros(width,height);
state_array(width/2, height/2) = 255;
tmp = people(width/2, height/2, 1, 1);
Group= [tmp];
state_array(width/2, height/2) = 255;
imagesc(state_array);
colorbar();
title('初始帧图像');
hold on;pause(pauseTime*1.5);
%%
%change state
for step=1:N
state_array_new=zeros(width,height);
for i=2:width-1
    for j=2:height-1
    	if state_array(i,j) == 255
	        if state_array(i, j-1) == 0
	    		state_array_new(i,j-1) = 255;
	    		tmp = people(i, j-1);
	        end
	    	if state_array(i, j+1) == 0
	    		state_array_new(i,j+1) = 255;
	        end
	    	if state_array(i-1, j) == 0
	    		state_array_new(i-1,j) = 255;
	        end
	    	if state_array(i+1, j) == 0
	    		state_array_new(i+1,j) = 255;
	        end
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
