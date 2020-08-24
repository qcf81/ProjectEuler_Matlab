clc, clear, close
tic

fp =@(n) n.*(3.*n-1)./2;
limit=1.1e4;
seqP=fp(1:limit);

flag=0;
mark=[0,0];
for i= 1:1e4
    for j=i:-1:1
        if ismember(fp(i)+fp(j),seqP)  && ...
                ismember(fp(i)-fp(j),seqP)
            mark=[fp(i),fp(j)];
            flag=1;
            break
        end
    end
    if flag==1
        break
    end
end

fprintf('the answer is %d\n',mark(1)-mark(2))
toc


