clc, clear, close
tic
num1 = primes(1e4);
num1(num1<1000)=[];
count = 0;
for i = 1:length(num1)
    if mod(i,1e2)==0
        fprintf('iteration i =%d\n',i)
    end
    n1=num1(i);
    num2=num1;
    num2 (num2==n1)=[];
    for j =1:length(num2)
        n2 =num2(j);
        num3 = num2;
        num3(num3==n2)=[];
        for k = 1:length(num3)
            n3=num3(k);
            if n2-n1 == n3-n2
                count = count+1;
                mark(count,:) = [ n1,n2,n3];
                break
            end
        end
    end
end
[m,n]=size(mark);
mark2=zeros(m,3);
for i = 1:m
    str1 = num2str(mark(i,1));
    str2 = num2str(mark(i,2));
    str3 = num2str(mark(i,3));
    str1=sort(str1);
    str2=sort(str2);
    str3=sort(str3);
    if strcmp(str1,str2) && strcmp(str2,str3)
        mark2(i,:) = mark(i,:);
    end
end
mark2(mark2(:,1)==0,:)=[];
mark2=sort(mark2,2);
mark2=unique(mark2,'rows');
disp(mark2)
toc
