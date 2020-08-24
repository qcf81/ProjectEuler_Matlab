clc, clear, close
tic
limit = 1e4;
mark = zeros(limit,2);
for n = 1:limit
    num = n;
    for i = 1:25
        num1 = num;
        str = num2str(num1);
        strR = str(end:-1:1);     
        num2 = str2double(strR);
        sum = num1+num2;
        strs = num2str(sum);
        strsR = strs(end:-1:1);
        num = sum;
        if strcmp(strs,strsR)
            mark(n,:) = [n,i];
            break
        end
    end
end
mark(mark(:,1)==0,:)=[];
fprintf('There ara %d Lychrel numbers below ten-thousand\n',limit-length(mark))
toc
