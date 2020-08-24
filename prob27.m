clc, clear, close

tic
count = 0;
par2=primes(1000); 
%if n=0, the quadratic equation = b, so b is prime

for a = -999:2:999
  %if n=1, the quadratic equation =1+a=+b, because b is prime so a is odd

    for i = 1:length(par2)
        fun = @(n) n.^2+a.*n+par2(i);
        % to define the quadratic equation
        for n =1:1e2
            if fun(n) < 0
                break;
            end
            if ~isprime(fun(n))
                count = count+1;
                mark(count,1) = n-1;
                mark(count,2) = a;
                mark(count,3) = par2(i);
                break
            end
        end
    end
end

mark2 = sortrows(mark);
a = mark2(end,2);
b = mark2(end,3);
fprintf('The parameter of a and b and a*b are  %d, %d, %d \n',a,b,a*b);
toc