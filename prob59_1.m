clc, clear, close
tic
fid = fopen('C:\Users\Administrator\Desktop\收集Matlab函数\ProjectEuler\p059_cipher.txt','r');
ss = textscan(fid,'%d','Delimiter',',');
fclose(fid);
num = ss{1,1};

count = 0;
for a = 97:122
    for b = 97:122
        for c = 97:122
            count = count+1;
            dic(count,:)=[a,b,c];
        end
    end
end

len = length(dic);
for i = 1:len
    if mod(i,1e3)==0
        fprintf('iteration i = %d\n',i)
    end
    key = dic(i,:);
    ss=dc(num,key);
    str(i,:)=ss(:,1:20);
    mark(i,:)=[max(double(ss)),min(double(ss)),i];
end
mm = sortrows(mark);
% 在mm的合理字符范围内，通过 str(mm(:,3),:) 查看解码，挑出合适的解码对应的 i
% 也是就是mm(:,3),将该值带回dic，获取key后，带回function dc，得到全文，对应的key为god

% key = 'god';
% ss = dc(num,double(key));
toc