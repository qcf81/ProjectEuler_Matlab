clc, clear, close
tic
a(1) = sym(1);
a(2) = sym(1);
mark = 0;

for i = 3:1e4
    a(i) = a(i-1)+a(i-2);
    b = char(a(i));
    
    if rem(i,20) == 0 % the whole iteration take too long time ,to mark the course of iteration
        fprintf(' i = %d , length(b) = %d\n',i,length(b))
    end
    
    if length(b) == 1000;
        mark = i;
        break
    end
end

fprintf('The answer of prob25 is %d\n',mark)
toc
