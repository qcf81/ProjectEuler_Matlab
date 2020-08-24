function prob21(N)
% if the Inpute is Null, then initializing the input value.
if nargin == 0
    N=1e4;
end
N = fix(N);
amicablePosition = zeros(N,2);
tic
for k = 1:N
    sum1 = d(k);
    sum2 = d(sum1);
    if sum2>=1 && sum2<=N
        if sum2 == k
            amicablePosition(k,1)=k;
            amicablePosition(k,2)=sum1;
        end
    end
end
toc
out = amicablePosition;
out(out(:,1)==0,:)=[];
%if the element in the first column is 0,then delete the corresponding row
out(out(:,1)==out(:,2),:)=[];
%if the element in the column 1 is equal to column 2, then delete the
%corresping row
fprintf('The sum of all the amicable numbers under %d is %d\n',N,sum(out(:,1)))
end


function sumDivisors =  d(n)
n = fix(n);
Divisors = zeros(1,n);
if n == 1
    Divisors(1)=1;
end
if n~=1
    for i = 1:n/2
        if rem(n,i)==0
            Divisors(i) = i;
        end
    end
end

Divisors(Divisors==0)=[];
sumDivisors = sum(Divisors);
end


