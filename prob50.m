clc, clear, close
tic
limit = 1e6;
seqp = primes(limit);

csum = 0;
for n = 1:length(seqp)
    csum =csum+seqp(n);
    if csum>1e6
        %         disp('seqp(n)>1e6')
        break
    end
end

count =0;
for start = 1:length(seqp)-n
%     if mod(start,1e3)==0
%         fprintf('iteration start =%d\n',start)
%     end    
    for stop = start+n:-1:start+1
        value = sum(seqp(start:stop));
        if value<1e6 && isprime(value)
            count=count+1;
            mark(count,:)=[stop-start,start,stop];
            break
        end
    end
end
mark=sortrows(mark);
an = sum(seqp(mark(end,2):mark(end,3)));
fprintf('The sum of the most consecutive primes is %d\n',an)
toc
            