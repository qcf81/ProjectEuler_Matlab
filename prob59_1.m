clc, clear, close
tic
fid = fopen('C:\Users\Administrator\Desktop\�ռ�Matlab����\ProjectEuler\p059_cipher.txt','r');
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
% ��mm�ĺ����ַ���Χ�ڣ�ͨ�� str(mm(:,3),:) �鿴���룬�������ʵĽ����Ӧ�� i
% Ҳ�Ǿ���mm(:,3),����ֵ����dic����ȡkey�󣬴���function dc���õ�ȫ�ģ���Ӧ��keyΪgod

% key = 'god';
% ss = dc(num,double(key));
toc