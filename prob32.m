clc, clear, close
tic

count1 = 0;
seq = zeros(1e6,3);
for i = 1:1e2
%     if mod(i,10)==0
%         fprintf('i = %d\n',i)
%     end
    for j = 100:1e4
        if length(num2str(i))+length(num2str(j))+length(num2str(i*j)) == 9
            count1 = count1+1;
            seq(count1,:) = [i,j,i*j];
        end
    end
end
seq((seq(:,1)==0),:)=[];

result = zeros(1,3);
count2 =0;

[m,n]=size(seq);
for i = 1:m
    str = [num2str(seq(i,1)),num2str(seq(i,2)),num2str(seq(i,3))];
    if strcmp(sort(str),'123456789')
        count2 =count2+1;
        result(count2,:)=seq(i,:);
    end
end

fprintf('the sum is %d\n',sum(unique(result(:,3))))
toc