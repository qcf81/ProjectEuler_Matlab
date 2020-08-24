clc, clear, close
tic
solution = zeros(1,4);
count = 0;

for p = 120:1000
    for a = 1:p
        for b = 1:p
            for c = a:p
                if a+b+c>p
                    break
                end
                if c<b
                    break
                end
                if a+b+c==p && a^2+b^2==c^2
                    count = count+1;
                    solution(count,:) = [a,b,c,a+b+c];
                end
            end
        end
    end
end

% First list the whole p value satisfied the right angle triangle; 
% With the unique function,we can find the unique p value; 
% Through the hist function, we can find the repetition of each p value. 
% With iteration to find the maximum repetition of p and mark the position. 
% Through the position, we can find the p value.
p=solution(:,4);
up = unique(p);
count = hist(p,up);
for i = 1:length(count)
    if count(i)==max(count)
        mark =i;
    end
end
fprintf('when p = %d, the number of solutions maximised\n',up(mark))

toc