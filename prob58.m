clc, clear, close
tic

mark = zeros(1,2);
value = zeros(1,4);
limit = 1e4;
start = 1;
circle = 0;
for i = 3:2:limit
    circle =circle+1;
    mark(circle,:)=[start+1,i^2];
    gap = i^2-start;
    value(circle,:)=[i^2,i^2-gap/4, i^2-gap/2, i^2-(3*gap/4)];%value on diagonal
    start = i^2;
%     seqp = primes(max(value(circle,:)));
    [m,n] = size(value);
    numdiagonal = m*n+1;
    count = 0;
    for a= 1:m
        for b = 1:n
            if isprime(value(a,b))
                count = count+1;
            end
        end
    end
    
    proption =count/numdiagonal;
    if  proption<0.1
        mm = i;
        disp(mm)
        break
    end
end
toc

