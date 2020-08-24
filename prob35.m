clc, clear, close
tic
limit = 1e6;
result = zeros(limit,1);
seqPrimes = primes(limit);
parfor i = 2:limit    
%     if mod(i,1e4)==0
%         fprintf('i = %d\n',i)
%     end
    num = zeros(7,1);    
    str = num2str(i);    
    strNum ='';
    for m = 1:length(str)
        if m == 1
            strNum = str;
        else
            strNum = [str(m:end),str(1:m-1)];
        end
        num(m) = str2double(strNum);
    end
    num(num==0)=[];
    for n = 1:length(num)        
        if ismember(num(n),seqPrimes)
            if n==length(num)
                result(i)=i;
            end
        else
            break
        end
    end    
end

result(result ==0)=[];
fprintf('There are %d circular primes below one million\n',length(result))
toc