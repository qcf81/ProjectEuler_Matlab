clc, clear, close
tic
seq = [2];
for i = 2:100
    seq = [seq,2*i];
end
a= 1;
for j = 1:length(seq)
    a = [a,seq(j)];
    a= [ a,1,1];
end
limit = 99; % 2时计算的是第三个
a = a(1:limit);
b = sym(1/a(limit));

for k = limit-1:-1:1
    b = 1/(a(k)+b);
end
e = 2+b;
s = char(e);
ss = strsplit(s,'/');
str = ss{1,1};
sum =0;
for i = 1:length(str)
    sum = sum+str2double(str(i));
end
disp(sum)
toc