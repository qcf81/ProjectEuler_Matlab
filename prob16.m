clc, clear
tic
m=sym(2);  
% set m as symbolic number 2
for i=2:1000
    m=m*2;
end

ss=char(m);
len=length(ss);
num=[];
count=1;
for i=1:len
    num(count)=str2num(ss(i));
    count=count+1;
end
a=sum(num);
fprintf('The sum of the digits is %d\n',a)
toc    
