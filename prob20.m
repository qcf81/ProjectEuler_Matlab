clc, clear,close
tic
m=sym(1);

for i = 100:-1:1
    m = m*i;
end

ss = char(m);
len = length(ss);

num = [];
count = 0;
for i = 1:len
    num(count+1) = str2num(ss(i));
    count = count + 1;
end
toc

fprintf('The sum of the digits of Factorial 100 is %d\n',sum(num))