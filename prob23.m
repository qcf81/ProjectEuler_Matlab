clc, clear, close

tic
N = 28123; 

count1 = 0;
nAbundant =[];% all the abundant number less than N

for i = 2:N    
    count2 = 0;
    num=[];
    for j = 1:i-1  %Iteration j, to calculte the whole proper divisors of Integer i.
        if mod(i,j) == 0
            count2 = count2+1;
            num(count2) = j;
        end
    end
    if sum(num)>i
        count1 = count1+1;
        nAbundant(count1) = i;
    end        
end
abundantSum = [];  %计算任意两个过剩数之和，全循环的方式会造成很多重复
count3 = 0;

    for i = 1:length(nAbundant)
        for j = i:length(nAbundant)
            if nAbundant(i)+ nAbundant(j) < 28123
                count3 = count3+1;
                abundantSum(count3)=nAbundant(i)+nAbundant(j);
            end
        end
    end
    
 trueAbundantSum=sort(abundantSum); %下面循环目的将找出重复的数字，所有重复去掉
 count5 = 0;
 index=[];
 for i = 2:length(trueAbundantSum)
     if trueAbundantSum(i)==trueAbundantSum(i-1)
         count5=count5+1;
         index(count5)=i;
     end
 end
 trueAbundantSum(index)=[];
 
    
numNoAbundant=[];
count4 = 0;
for i = 1:28122  %因为真因子都有1，所以和就确定28123-1作为上限
    for j = 1:length(trueAbundantSum)
        if i==trueAbundantSum(j)
            break
        end
        if j == length(trueAbundantSum)
            count4 = count4+1;
            numNoAbundant(count4)=i;
        end
    end
end

fprintf('The sum of all the integers which cannot be written as the sum of two abundant numbers is %d\n',sum(numNoAbundant))
toc