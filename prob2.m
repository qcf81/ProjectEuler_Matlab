clc, clear, close

tic
Sequence = [];
Sequence(1) = 1;
Sequence(2) = 2;
sn = 0;
for i = 3:100
    Sequence(i) = Sequence(i-1) + Sequence(i-2);
    if Sequence(i) > 4e6
        sn = i-1;
        break
    end
end

count = 0;
evenSeq = [];
for i = 1:sn
    if mod(Sequence(i),2) == 0
        evenSeq(count+1) = Sequence(i);
        count = count + 1;    
    end
end

disp(['Result',' ','is',' ',num2str(sum(evenSeq))]);
toc