clc, clear, close
tic

digit = zeros(2,3);
count =0;
for n = 2:9    
    seq = 1:n;
    for num = 1:1e10        
        str ='';
        for i = 1:length(seq)
            val= num*seq(i);
            str = [str,num2str(val)];
        end
        
        if length(str) >= 10
            break
        end        
        value = str2double(str);        
        if value > 987654321
            break
        end
        
        if value > 123456788
            str = unique(str);
            if length(str)==9
                flag = 1;
                for k = 1:9
                    if str(k) == '0'
                        flag =0;
                        break
                    end
                end
                if flag == 1
                    count = count+1;
                    digit(count,:) = [num, n, value];
                end
            end
        end
    end
end
fprintf('The largest 1 to 9 pandigital 9-digit number that can be formed as  the concatenated product of an integer with(1,2,...n) is % d\n',max(digit(:,3)))
toc