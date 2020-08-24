clc, clear, close
tic
seq = zeros(1,2);
count = 0;
for i = 10:99
    for j = 10:99
        if i < j
            a = num2str(i);
            b = num2str(j);
            if a(2)==b(1)
                if str2double(a(1))/str2double(b(2)) == i/j
                    if str2double(a(1))/str2double(b(1)) ~=i/j
                        count = count+1;
                        seq(count,:)=[i,j];
                    end
                end
            end
        end
    end
end

fprintf('the four fraction is \n')
seq
toc