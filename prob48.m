clc, clear, close
tic
num = sym(1);
val = sym(0);
for i = num:1e3
    val = val+i^i;
end

str = char(val);
disp(str(end-9:end))
toc