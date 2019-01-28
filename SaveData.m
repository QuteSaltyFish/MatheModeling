[m,n] = size(sms);
result = [];
for i = 1:n
    result(i,:) = sms{1,i}.Density_Data;
end
[m, n] = size(result);  
data_cell = mat2cell(result, ones(m,1), ones(n,1)); 
s = xlswrite('Density.xls', result); 