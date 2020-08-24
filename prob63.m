clc, clear, close
tic
limit = sym(200);
count = 0;
for i = 1:9
    for j = 1:limit
        str=char(i^j);
        len = length(str);
        if len>str2double(char(j))
            break
        end
        if str2double(char(j))==len
            count = count+1;
        end
    end
end
disp(count)
toc
    