clc, clear, close
tic
Num = 600851475143;
primeFactor = factor(Num);
maxFactor = primeFactor(end);
disp(['Result is ',num2str(maxFactor(end))]);
toc