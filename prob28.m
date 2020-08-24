clc, clear, close

tic
nSum = 1; %第一圈1，不算数，直接累积到总数中；
% the first number 1, we don't think it is a circle, we count it in sum
nEnd = 1; 
% define it as the last number of each circle
circle = fix(1001/2);
% the whole circle of the diagonals in a 1001; 

for i = 1:circle
    nEnd = nEnd+8*i;
    %the quanatity of number in each circle is geometric progression, 8*i;
    for j = 1:4
        nSum = nSum + nEnd -(j-1)*2*i;
        %compute the sum of each circle;
    end
end

fprintf('the sum of the numbers on the diagonals in 1001 by 1001 spiral is %d\n',nSum)
toc