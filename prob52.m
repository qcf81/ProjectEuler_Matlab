clc, clear, close
tic
start =1e4;
limit = 1e7;

for i = start:limit
%     if mod(i,1e4)==0
%         fprintf('iteration i=%d\n',i)
%     end
    str1 = sort(num2str(i));
    str2 = sort(num2str(2*i));    
    if strcmp(str1,str2)
        str3 = sort(num2str(3*i));
        str4 = sort(num2str(4*i));
        if strcmp(str3,str4)
            str5=sort(num2str(5*i));
            str6=sort(num2str(6*i));
            if strcmp(str5,str6) && strcmp(str1,str3) &&strcmp(str4,str5)
                mark = [i,2*i,3*i,4*i,5*i,6*i];
                disp(mark)
                break
            end
        end
    end    
end
toc
    