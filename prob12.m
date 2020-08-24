
function   [triNum, i, num]=prob12(~)
tic
num = 0;
i = 1;
while num < 500
    i = i + 1;
    triNum = sum(1:i);
    num = Factor_Num(triNum);
end

disp(['triNum is ',num2str(triNum)])
disp(['factor number is ',num2str(num)])
toc
end

function num = Factor_Num(n) 
num = 0;
m = floor(sqrt(n));
if n == 1
    num = 1;
else
    for i = 1:m
        if mod(n,i) == 0
            num = num+2;
            if m == i && i*i == n
                num = num-1;
            end
        end
    end
end
end