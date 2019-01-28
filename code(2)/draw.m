%��������i��ѡ�����
%��������i��������Ӧ��
figure
subplot(2,1,1);
for x = 1:generation_size
    y(x) = sum(Bestindividual(x,:));
end
x = 1:generation_size;
plot(x,y);
xlabel('generation');
ylabel('BestIndividual');
subplot(2,1,2);
for x = 1:generation_size
    y(x) = BestFit(1,x);
end
x = 1:generation_size;
plot(x,y);
xlabel('generation');
ylabel('BestFit');