function prob17(~)
str='';
for i = 1:1000   
    if i<20 % 1-19
        str=[str,n2s(i)];
    elseif i<100 % 20-99
        n1 = fix(i/10);%十位数字
        n2 = mod(i,10);
        str=[str,n2s(n1*10),n2s(n2)];
    elseif i<1000 % 100-999
        n1 = fix(i/100); %百位
        temp = i-100*n1; %去掉百位余数
        if temp ==0
            str=[str,n2s(n1),'hundred'];
        elseif temp<20 %余数1-19
            str = [str,n2s(n1),'hundred','and',n2s(temp)]; %
        else % 余数20-99
            n2 = fix(temp/10);%十位
            n3 = mod(temp,10);
            str = [str,n2s(n1),'hundred','and',n2s(n2*10),n2s(n3)];
        end
    else
        str=[str,'OneThousand'];        
    end
end
length(str)
end

function str = n2s(num)
switch(num)
    case 0
        str='';
    case 1
        str = 'One';
    case 2
        str = 'Two';
    case 3
        str='Three';
    case 4
        str='Four';
    case 5
        str='Five';
    case 6
        str='Six';
    case 7
        str='Seven';
    case 8
        str='Eight';
    case 9
        str='Nine';
    case 10
        str='Ten';
    case 11
        str='Eleven';
    case 12
        str='Twelve';
    case 13
        str='Thirteen';
    case 14
        str='Fourteen';
    case 15
        str='Fifteen';
    case 16
        str='Sixteen';
    case 17
        str='Seventeen';
    case 18
        str='Eighteen';
    case 19
        str='Nineteen';
    case 20
        str='Twenty';
    case 30
        str='Thirty';
    case 40
        str='Forty';
    case 50
        str='Fifty';
    case 60
        str='sixty';
    case 70
        str='seventy';
    case 80
        str='Eighty';
    case 90
        str='Ninety'; 
end
end