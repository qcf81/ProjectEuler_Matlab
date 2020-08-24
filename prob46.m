clc, clear, close
tic
limit = 1e4;
seqp = primes(limit);
seqodd = zeros(limit,1);
for i=9:limit
    if (~isprime(i)) && mod(i,2)==1
        seqodd(i)=i;
    end
end
seqodd(seqodd==0)=[];

for j = 1:length(seqodd)
    flage = 0;
    flagend =0;
    for k =1:length(seqp)
        if seqp(k)>seqodd(j)
            mark = [k,seqp(k),seqodd(j)];
            flagend=1;
            break
        end
        for n=1:1e2
            if seqodd(j)==seqp(k)+2*n^2
                flage =1;
                break
            end
            
        end %end of n
        if flage ==1
            break
        end
    end %end of k
    if flagend ==1
        break
    end
end %end of j
disp(mark) 
disp(['answer is ',num2str(mark(3))])
toc
    

                
            
            
        