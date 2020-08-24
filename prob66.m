clc, clear, close
tic
square = [];
for i = 1:sqrt(1001)
    square = [square, i^2];
end
seqD = 1:1000;
seqD(ismember(seqD,square))=[];

mark(:,3) = seqD';
limit = 1e9;
for k = 1:length(seqD)
    flagt = 0;    
    for y = 1:limit
        x = sqrt(seqD(k)*y^2+1);
        if x == fix(x)
            mark(k,1) = x;
            mark(k,2) =y;
            flagt = 1;
            break
        end
    end
    if flagt ==0
        fprintf('when D= %d, x and y are missed\n',seqD(k))
    end
end
tt = sortrows(mark,-1);
vpa(tt(1,:))
toc