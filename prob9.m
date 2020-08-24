clc, clear, close
nm = 0;
count = 0;
tic
for i = 1 : 998
    for j = i + 1 : 999
        for k = j+1 : 1000
            nm = nm+1;
            if i^2+j^2 == k^2 && i<j && j<k && i+j+k==1000
                a = i;
                b = j;
                c = k;
                count = count+1;
                break
            end
        end
    end
end
toc
disp(['iterationTimes',' ',num2str(nm)])
a; b; c; abc=a*b*c;
disp(['Answer',' ','is',' ',num2str(abc)])