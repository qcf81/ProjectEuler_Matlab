function prob54(~)
%% ������
tic
fid = fopen('C:\Users\Administrator\Desktop\�ռ�Matlab����\ProjectEuler\p054_poker.txt','r');
txt = textscan(fid,'%s %s %s %s %s %s %s %s %s %s');
fclose(fid);

score = zeros(1000,2);
for i = 1:1000
    poker1 = ''; poker2 = '';
    for j = 1:5
        % ��ȡ���1�˿���
        poker1=[poker1,txt{1,j}{i}];
    end
    for k=6:10
        %��ȡ���2�˿���
        poker2=[poker2,txt{1,k}{i}];
    end
    num1 = p2n(poker1); num2 = p2n(poker2);
    s1 = n2s(num1);      s2 = n2s(num2);
    
    if s1(1) > s2(1)
        score(i,1)=1; %���1��ʤ
    elseif s1(1) == s2(1) %���1�����2����һ��
        for ii = 2:6
            if s1(ii)~=s2(ii)
                if s1(ii)>s2(ii)
                    score(i,1)=1;
                else
                    score(i,2)=1;
                end
                break
            end
        end
    elseif s1(1)<s2(1)
        score(i,2)=1;
    end
end
toc
disp(sum(score))
end

function  num = p2n(str)
%% �˿���ת����
num = zeros(10,2);
for i = 1:2:9
    %�����Сת���� 2-14
    if str(i)=='T'
        num(i,1)=10;
    elseif str(i)=='J'
        num(i,1)=11;
    elseif str(i)=='Q'
        num(i,1)=12;
    elseif str(i)=='K'
        num(i,1)=13;
    elseif str(i)=='A'
        num(i,1)=14;
    else
        num(i,1)=str2double(str(i));
    end
    
    switch str(i+1) % ��ɫת���� H-1,C-2,S-3,D-4
        case 'H'
            num(i,2)=1;
        case 'C'
            num(i,2)=2;
        case 'S'
            num(i,2)=3;
        case 'D'
            num(i,2)=4;
    end
end
num(num(:,1)==0,:)=[];
num=sortrows(num);
num = num';
end

function style = n2s(num) 
%% ����ת����
% num (2,5)����
style = zeros(1,6);
%��һ�з����ͣ����水����ͬ�����ж�˳�����η�
%10�����ͣ� 1-���ƣ�2-���ӣ�3-���ԣ�4-������5-˳�ӣ�
% 6-ͬ����7-��«,�����������ӣ�8-������9-ͬ��˳��10-ͬ����˳
n1v = num(1,:); n1c = num(2,:);
%��ֵ             %��ɫ
if length(unique(n1v))==5
    %% ����--------------------
    if length(unique(n1c)) >= 2 % ����ͬ��
        style = [1,sort(n1v,'descend')];
    else  %ͬ��
        style = [6,sort(n1v,'descend')];
    end
    if n1v(2)-n1v(1)==1 && n1v(3)-n1v(2)==1 && n1v(4)-n1v(3)==1 && n1v(5)-n1v(4)==1
        %˳��
        if length(n1c) >= 2
            style = [5,sort(n1v,'descend')];
        else
            style = [9,sort(n1v,'descend')]; %ͬ��˳
        end
    end
    if n1v == [2 3 4 5 14];
        % [A 1 2 3 4] �������
        if length(n1c) >= 2
            style = [5,1,2,3,4,5];%˳��
        else
            style = [9,1,2,3,4,5]; %ͬ��˳
        end
    end
elseif length(unique(n1v)) == 4
    %% ����----------------
    un1v = unique(n1v);
    count = hist(n1v,un1v);
    for i = 1:4
        if count(i)==2
            break
        end
    end
    dv = un1v(i);
    un1v(un1v==dv)=[];
    if length(unique(n1c))>=2 % ����ͬ��
        style = [2,dv,dv,sort(un1v,'descend')];
    else
        style = [6,sort(n1v,'descend')];
    end    
elseif length(unique(n1v))==3
    %% ���Ի���1������-----
    un1v = unique(n1v);
    count = hist(n1v,un1v);
    c=zeros(1,3);
    for i = 1:3
        if count(i) ==2
            c(i)=i;
        end
    end
    c(c==0)=[];
    if length(c)==2
        %% ����
        dv1=un1v(c(1));
        dv2=un1v(c(2));
        dv=[dv1,dv2];
        un1v(un1v==dv1)=[]; un1v(un1v==dv2)=[];%ȡ��ֻ��1�ŵ���ֵ
        if length(unique(n1c))>=2 % ����ͬ��
            style = [3,max(dv),max(dv),min(dv),min(dv),un1v];
        else
            style = [6,sort(n1v,'descend')];
        end
        
    else
        %% ����
        for i = 1:3
            if count(i)==3 %����
                break
            end
        end
        un1v = unique(n1v);
        dv = un1v(i);
        un1v(un1v==dv)=[];
        
        if length(unique(n1c))>=2 % ����ͬ��
            style = [4,dv,dv,dv,sort(un1v,'descend')];
        else
            style = [6,sort(n1v,'descend')];
        end
    end    
elseif length(unique(n1v))==2
    %% ��« ���� ����
    un1v = unique(n1v);
    count = hist(n1v,un1v);
    dv1 = un1v(1);
    dv2 = un1v(2);
    if count(1)==2
        style = [7,dv2,dv2,dv2,dv1,dv1]; %��«
    elseif count(1) ==3
        style = [7,dv1,dv1,dv1,dv2,dv2];
    elseif count(1)==1
        style = [8,dv2,dv2,dv2,dv2,dv1]; %����
    else
        style = [8,dv1,dv1,dv1,dv1,dv2];
    end
end
end