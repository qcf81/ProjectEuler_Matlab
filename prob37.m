clc, clear, close
tic

limit = 1e6;
seqPrimes = primes(limit);
rightToLeft = zeros(limit,1);

for i = 5:length(seqPrimes)
    num = seqPrimes(i);
    strNum = num2str(num);
    for m = length(strNum):-1:1
        if m ~= 1
            numTest = str2double(strNum(1:m-1));
            if ismember(numTest,seqPrimes)
            else
                break
            end
        end
    end
    if m == 1
        rightToLeft(i)=seqPrimes(i);
    end
end

rightToLeft(rightToLeft==0)=[];

leftToRight=zeros(length(rightToLeft),1);

for i = 1:length(rightToLeft)
    num = rightToLeft(i);
    strNum = num2str(num);
    
    for m = 1:length(strNum)
        flag = 1;
        numTest = str2double(strNum(m:end));
        
        if ~ismember(numTest,seqPrimes)
            flag =0;
            break
        end        
    end
    if flag==1 && m==length(strNum)
        leftToRight(i)=rightToLeft(i);
    end
end
leftToRight(leftToRight==0)=[];
fprintf('the sum of the only eleven primes is %d\n',sum(leftToRight))

toc

        
                
            