tic
grid = zeros(21,21);
grid(1,2:21)=1;
grid(2:21,1)=1;
for i = 2:21
    for j =2:21
        grid(i,j)=grid(i-1,j)+grid(i,j-1);
    end
end
disp(num2str(grid(21,21)))
toc