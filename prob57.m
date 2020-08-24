clc, clear, close
tic
start = sym(1/2);
limit = 1e3;
i = 1;
while (i<=limit)
    demonitator = 2+start;
    start = 1/demonitator;
    i = i+1;
    mark{i} = 1+1/demonitator;
end
count =0;
for i = 2:1e3
    str = char(mark{i});
    b = strsplit(str,'/');
    str1 = b{1};
    str2 = b{2};
    if length(str1)>length(str2)
        count = count+1;
    end
end
disp(count)
toc