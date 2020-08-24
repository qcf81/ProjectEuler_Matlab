clc, clear, close
tic
limit = 1e7;
num = zeros(limit,1);
parfor i = 3:limit
    if rem(i,1e4)==0
        fprintf('iteration i = %d\n',i)
    end
    str = num2str(i);
    len = length(str);
    sumFactorial = 0;
    for j = 1:len
        sumFactorial = sumFactorial+factorial(str2double(str(j)));
    end
    if sumFactorial == i
        num(i) = i;
    end
end
num(num==0)=[];
fprintf('the sum is %d\n',sum(num))
toc
