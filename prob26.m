clc, clear, close
tic
limit = 1e3;
mark = zeros(1e3,2);
for n =1:1e3
    r = 1; %初始分母为1
    R = 1; % 初始分母为1，将每次除n的余数累加到R的后面；
    while(true)
        r = mod(10*r,n);
        if r==0 %能被整除
            circle =0;
            break;
        else
            if ismember(r,R)
                circle = length(R)-length(r)+1;
                break
            end
        end
        R = [R,r];
    end
    mark(n,:)=[circle,n];    
end
mark(mark(:,1)==0,:)=[];
mark  = sortrows(mark);
disp(mark(end,2))
toc