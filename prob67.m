clc, clear, close
tic
fid = fopen('C:\Users\Administrator\Desktop\ÊÕ¼¯Matlabº¯Êý\ProjectEuler\p067_triangle.txt');
ss = textscan(fid,'%d');
fclose(fid);
nn = ss{1,1};
sum =0;
for n = 1:1000
    sum = sum+n;
    if sum == length(nn);
        break
    end
end

count =0;
num = zeros(n,n);
for i = 1:n    
    for j = 1:i
        count = count+1;
        num(i,j) = nn(count);
    end
end

accum = zeros(n,n);
accum(n,:) = num(n,:);

for i = n-1:-1:1
    for j = 1:i
        accum(i,j) = num(i,j) + max(accum(i+1,j),accum(i+1,j+1));
    end
end
disp(accum(1,1))
toc