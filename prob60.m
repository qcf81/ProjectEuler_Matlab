function prob60(~)
tic
limit = 1e4;seqp = primes(limit);len  = length(seqp);

count = 0 ;
flagt = 0;
for i = 2:len-4 % 第一个数2的组合不是质数，从质数3开始计算
    fprintf('iteration i = %d\n',i)
    num1 = seqp(i);
    for j = i+1:len-3
        num2 = seqp(j);
        if pj(num1,num2)  %judge pair 1-2
            for k = j+1: len-2
                num3 = seqp(k);
                if pj(num1,num3) && pj(num2,num3) %judge pair 1-3,2-3
                    for l = k+1:len-1
                        num4 = seqp(l);
                        if pj(num1,num4)&& pj(num2,num4) && pj(num3,num4)
                            for m = l+1:len
                                num5 = seqp(m);
                                if pj(num1,num5)&& pj(num2,num5) && pj(num3,num5) && pj(num4,num5)
                                    count = count+1;
                                    mark(count,:) = [num1, num2,num3,num4,num5];
                                    if count ==1
                                        flagt=1;
                                        break
                                    end
                                end
                            end %end of m
                        end
                        if flagt ==1
                            break
                        end
                    end %end of for l
                end
                if flagt ==1
                    break
                end
            end % end of for k
        end
        if flagt ==1
            break
        end
    end % end of for j
    if flagt ==1
        break
    end
end % end of for i

disp(mark) 
disp(sum(mark))
toc
end

function  jv = pj(n1,n2)
% If any combination of the prime pair is prime, the jv is 1; else jv is 0
jv = 0;
str1 = num2str(n1);str2 = num2str(n2);
str3 = [str1,str2];str4 = [str2,str1];
num3 = str2double(str3);
if isprime(num3)
    num4 = str2double(str4);
    if isprime(num4)
        jv =1;
    end
end
end