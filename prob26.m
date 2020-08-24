clc, clear, close
tic
limit = 1e3;
mark = zeros(1e3,2);
for n =1:1e3
    r = 1; %��ʼ��ĸΪ1
    R = 1; % ��ʼ��ĸΪ1����ÿ�γ�n�������ۼӵ�R�ĺ��棻
    while(true)
        r = mod(10*r,n);
        if r==0 %�ܱ�����
            circle =0;
            break;
        else
            if ismember(r,R)
                circle = length(R)-length(r)+1;
                break
            end
        end
        R = [R,r];
    end
    mark(n,:)=[circle,n];    
end
mark(mark(:,1)==0,:)=[];
mark  = sortrows(mark);
disp(mark(end,2))
toc