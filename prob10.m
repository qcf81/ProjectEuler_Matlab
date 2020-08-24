clc, clear, close

tic
primeNum = primes(1e7);
disp(primeNum(end));
primeExtent = length(primeNum);

sum = 0;
for i = 1 : primeExtent
    if primeNum(i) < 2e6
        sum = sum + primeNum(i);
    end
end
disp(['Result',' ','is',' ',num2str(sum)]);
toc
        