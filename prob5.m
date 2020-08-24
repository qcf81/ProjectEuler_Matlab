
clc,clear,close
limit = 1e10;
N = 20;
% The smallest positive number is divisible by 20, So N begin from 20, it
% is also the multiple of 20. So the Iteration is design as the followed.
tic
for i = N:N:limit
    for j = N:-1:1
        if mod(i,j) ~=0
            break;
        end
    end
    if j == 1 % To make sure all the number i is divisible by 1-20.
        answer = i;
        break
    end
    
end
fprintf('The smallest positive number is %d \n', answer)
toc