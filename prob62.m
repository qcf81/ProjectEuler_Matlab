clc, clear, close
tic
for i = 346:1e4 %346       
    flag =0;
    mark = i;    
    start = i+1;
    len = length(num2str(i));
    stop = 10^(len)-1;
    cubei = i^3;
    len2 = length(num2str(cubei));
    stri = sort(num2str(cubei));
    count =1;
    for j = start:stop        
        cubej =j^3;
        if cubej>10^(len2)-1
            break
        end
        strj = sort(num2str(cubej));
        if strcmp(stri,strj)
            count = count+1;
            mark = [mark,j];
            if count == 5
                flag =1;                
                break
            end
        end
    end %end of j
    if flag ==1
        digits(20)        
        disp(vpa(i^3))
        break
    end
end %end of i            
toc        
