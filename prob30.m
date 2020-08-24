clc, clear, close
tic
count = 0;
limit = 1e6;
numOut = zeros(limit,1);

parfor i = 10:limit
    if mod(i,1e5)==0
        fprintf('Mark iteration i = %d\n',i)
    end
    
    num=zeros(100,1);
    sumPower = 0;
    
    strNum = num2str(i);
    for j = 1:length(strNum)
        num(j) = str2double(strNum(j));
        sumPower = sumPower + num(j)^5;
    end
    
    if i == sumPower
        count = count+1;
        numOut(i) = i;
    end
end
numOut(numOut ==0) =[];
fprintf('the sum of all the numbers that can be written as the sum of fifth powers of their digits. is %d\n',sum(numOut))
toc

    