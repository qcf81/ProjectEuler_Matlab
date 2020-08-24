function result = prob1(~)
tic
naturalNum = 0:1000;
aliquotNum = [];
count = 0;
for i = 1:1000
    if rem(naturalNum(i),3) == 0
        aliquotNum(count+1) = naturalNum(i);
        count = count+1;
    elseif rem(naturalNum(i),5) == 0
        aliquotNum(count+1) = naturalNum(i);
        count = count + 1;
    end
end
result  = sum(aliquotNum);
disp(['Result is ',num2str(sum(aliquotNum))]);
toc
end