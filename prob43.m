clc, clear, close
tic

seqPrime = primes(17);
seqPerm = perms([0 1 2 3 4 5 6 7 8 9]);

seqPerm(mod(seqPerm(:,4),2)==1,:)=[];
% d4 is even number, shrink half of seqPerm

seqPerm(mod(seqPerm(:,5),3)~=0,:)=[];
% d5 is divisible by 3, shrink to 4/10 of seqPerm

seqPerm(mod(seqPerm(:,6),5)~=0,:)=[];
% d6 is dibisible by 5, shrink to 1/5 of seqPerm

seqPerm(seqPerm(:,1)==0,:)=[];
% delete d1 = 0

[m,n] = size(seqPerm);
count = 0;
for i = 1:m
%     if mod(i,1e4)==0
%         fprintf('iteration i =%d\n',i)
%     end
    
    str = '';
    for j = 1:n
        % get the pandigital string
        str = [str,num2str(seqPerm(i,j))];
    end
    
    num = zeros(7,1);
    %define the seven judging numbers    
    
    for nn = 1:7
        num(nn) = str2double(str(nn+1:nn+3));
    end    
    
    flag = 1;
    for mm = 1:7
        if mod(num(mm),seqPrime(mm))==0
        else
            flag = 0;
            break
        end
    end
    if mm==7 && flag ==1
        count = count +1;
        mark{count,1}=str;        
    end    
end % end of iteration i

[a,b] = size(mark);
value = 0;
for ii =1:a
    value = value+str2double(mark{ii,1});
end
fprintf('The sum of all 0 to 9 pandigital numbers with this property is %d\n',value)
toc