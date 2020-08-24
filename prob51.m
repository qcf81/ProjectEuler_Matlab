clc, clear, close
tic
seq = primes(1e6);
seq = seq(seq>56003);% define the whole 6-digits primes( total 68906 numbers)

for i = 1:length(seq)
    if mod(i,1e3)==0
        fprintf('iteration i=%d\n',i)
    end
    flag =0;
    num = seq(i);
    for n = 1:3 % define the quantity of digits to be replaced
        num1 = zeros(10,1);
        position = nchoosek(1:length(num2str(num)),n);
        [a,b] = size(position);
        for j = 1:a %define the row of position
            for nn = 0:9
                str = num2str(num);                
                str(position(j,:)) = num2str(nn);
                if ~strcmp(str(1),'0')
                    num1(nn+1,1)=str2double(str);
                end
            end %end of for nn
            num1=num1(isprime(num1));
            %             num1(num1==num)=[];
            if length(num1)>=8
                disp(num)
                flag = 1;
                break
            end
        end %end of for j
        if flag==1
            break
        end
    end % end of for n
    if flag==1
        break
    end
end %end of for i
