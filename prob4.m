
function [M, n1, n2]=prob4(~)
tic
a = [];
a1 = [];
a2 = [];
count = 0;

for i = 100 : 999
    for j = 100 : 999
        prodNum = i * j;
        strNum1 = num2str(prodNum);
        strNum2 = strNum1(end:-1:1);
        if strNum1 == strNum2
            a(count+1) = i*j;
            a1(count+1) = i;
            a2(count+1) = j;
            count = count + 1;
        end
    end
end
[M, I] = max(a);
n1=a1(I);
n2=a2(I);
disp(['Result is ',num2str(M)]);
toc
end
            