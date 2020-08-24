clc, clear, close
tic
limit = sym(99); % a,b<100
mark = zeros(str2double(char(limit)),str2double(char(limit)));

for n = 1:limit
    for m = 1:limit
        val = n^m;
        str = char(val);
        sum = 0;
        for i = 1:length(str)
            sum = sum+str2double(str(i));
        end
        mark(str2double(char(m)),str2double(char(n)))=sum;
    end
end
fprintf('The maximum digital sum is %d\n',max(max(mark)))
toc