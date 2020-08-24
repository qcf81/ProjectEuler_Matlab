clc, clear, close
tic

k = 7;
seq = perms(1:k);
[m,n] = size(seq);
mark = zeros(m,1);

parfor i = 1:m
    if rem(i,1e4)==0
        fprintf('iteration i = %d\n',i)
    end
    str ='';
    for j = 1:n
        str = [str,num2str(seq(i,j))];
    end
    num = str2double(str);
    if isprime(num)        
        mark(i)=i;
        %break
    end
end % end of parfor i

mark(mark==0)=[];
seq = seq(mark,:);

str = '';
for ii = 1:n
    str = [str,num2str(seq(1,ii))];
end

fprintf('the largest n-digit pandigital primes is %s\n',str)
toc