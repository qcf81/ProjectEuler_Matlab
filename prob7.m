clc, clear, close

tic
primeNum = primes(1e7);
len = length(primeNum);
disp(['Answer',' ','is',' ',num2str(primeNum(10001))]);
toc