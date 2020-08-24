clc, clear, close

tic
seq = 1 : 100;
sum1 = sum(seq.^2);
sum2 = sum(seq)^2;
result = sum2 - sum1;
disp(['Answer',' ','is',' ',num2str(result)]);
toc