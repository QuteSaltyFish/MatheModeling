map = [1,1,1; 0,0,0];
colormap(map);

%set the size of meth
S = 121;
L = zeros(S);

%set the middle number to one as seed
M = (S+1)/2+1;
L(M,M) = 1;
Temp = L;
imagesc(L);

%calculate layer
Layer = (S-1)/2+1;

for  t=2:Layer
	for x=M-t+1:M+t-1
		if x==M-t+1 || x==M+t-1

			for y=M-t+1:M+t-1
				SUM = 0;
				for m=-1:1
					for n=-1:1
						if x+m>0 && x+m<=S && y+n>0 && y+n<=S
							SUM = SUM +L(x+m, y+n);
						end
					end
				end
				SUM = SUM - L(x,y);
				Temp(x, y) = mod(SUM, 2);
			end

		else 
			y = M-t+1;
			SUM = 0;
			for m = -1:1
				for n = -1:1
					if x+m>0 && x+m<=S && y+n>0 && y+n<=S
						SUM = SUM + L(x+m, y+n);
					end
				end
			end
			SUM = SUM -L(x,y);
			Temp(x,y) = mod(SUM, 2);

			y = M+t-1;
			SUM = 0;
			for m = -1:1
				for n = -1:1
					if x+m>0 && x+m<=S && y+n>0 &&y+n<=S
						SUM = SUM + L(x+m,y+n);
					end
				end
			end
			SUM = SUM - L(x,y);
			Temp(x,y) = mod(SUM,2);
		end
	end
	L = Temp;
	imagesc(L);
	pause(0.0001);
end


