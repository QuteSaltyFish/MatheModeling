n = 10;
z = zeros(n,n);
cells = z;
cells(n/2, 0.25*n:0.75*n) = 1;
cells(0.25*n:0.75*n, n/2) = 1;

%build the GUI
%define the plot button
plotbutton = uicontrol('style', 'pushbutton',...
	'string', 'Run',...
	'fontsize', 12,...
	'position', [100,400,50,20],...
	'callback', 'run=1;');

%define the stop button
erasebutton = uicontrol('style', 'pushbutton',...
	'string', 'Stop',...
	'fontsize', 12,...
	'position', [200,400,50,20],...
	'callback', 'freeze=1;');

%define the Quit button
quitbutton = uicontrol('style', 'pushbutton',...
	'string', 'Quit',...
	'fontsize', 12,...
	'position', [300,400,50,20],...
	'callback', 'stop=1;close;');

number = uicontrol('style', 'text',...
	'string', '1',...
	'fontsize', 12,...
	'position', [20,400,50,20]);

x = 2:n-1;
y = 2:n-1;
stop = 0; %wait for a quit button push
run = 0; %wait for a draw
freeze = 0; %wait for a freeze
while (stop == 0)
	if (run ==1)
		%nearest neighbor sum
		sum(x,y) = cells(x, y-1) + cells(x, y+1) + ...
		cells(x-1,y) + cells(x+1,y) + ...
		cells(x-1,y-1) + cells(x-1, y+1) + ...
		cells(3:n, y-1) + cells(x+1,y+1);

		%the CA rule;
		cells = (sum==3) | (sum == 2 & cells);

		%draw the new image
		set(imh, 'cdata', cat(3,cells,z,z))

		%update the step number display
		stepnumber = 1 + str2num(get(number, 'string'));
		set(number, 'string', num2str(strpnumber))
	end
	if(freeze == 1)
		run = 0;
		freeze = 0;
	end
	drawnow
end
