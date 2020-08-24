clc, clear, close
tic
count =0;
for n = 1:100
    for k =1:n
        value =nchoosek(n,k);
        if value>1e6
            count =count+1;
        end
    end
end
disp(count)
toc