function [number,nChains]=prob14(~)
tic
max=0;
number=0;
for i=1:1e6
    n=i;
    count=1;
    while ~(n==1)
        if mod(n,2)==0
            n=n/2;
            count=count+1;
        else
            n=3*n+1;
            count=count+1;
        end
    end
    if count>max
        max=count;
        number=i;
    end
end
nChains=max;
% sequence(number);
toc
end

function seq =sequence(n)
count=1;
seq(count)=n;
while ~(n==1)
    if mod(n,2)==0
        n=n/2;
        count=count+1;
        seq(count)=n;
    else
        n=3*n+1;
        count=count+1;
        seq(count)=n;
    end
end
end
