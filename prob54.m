function prob54(~)
%% 主函数
tic
fid = fopen('C:\Users\Administrator\Desktop\收集Matlab函数\ProjectEuler\p054_poker.txt','r');
txt = textscan(fid,'%s %s %s %s %s %s %s %s %s %s');
fclose(fid);

score = zeros(1000,2);
for i = 1:1000
    poker1 = ''; poker2 = '';
    for j = 1:5
        % 获取玩家1扑克牌
        poker1=[poker1,txt{1,j}{i}];
    end
    for k=6:10
        %获取玩家2扑克牌
        poker2=[poker2,txt{1,k}{i}];
    end
    num1 = p2n(poker1); num2 = p2n(poker2);
    s1 = n2s(num1);      s2 = n2s(num2);
    
    if s1(1) > s2(1)
        score(i,1)=1; %玩家1获胜
    elseif s1(1) == s2(1) %玩家1和玩家2牌型一样
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
%% 扑克牌转数字
num = zeros(10,2);
for i = 1:2:9
    %牌面大小转数字 2-14
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
    
    switch str(i+1) % 花色转数字 H-1,C-2,S-3,D-4
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
%% 数字转牌型
% num (2,5)数字
style = zeros(1,6);
%第一列放牌型，后面按照相同牌型判断顺序依次放
%10种牌型： 1-单牌；2-对子；3-两对；4-三条；5-顺子；
% 6-同花；7-葫芦,三条带个对子；8-四条；9-同花顺；10-同花大顺
n1v = num(1,:); n1c = num(2,:);
%牌值             %花色
if length(unique(n1v))==5
    %% 单牌--------------------
    if length(unique(n1c)) >= 2 % 不是同花
        style = [1,sort(n1v,'descend')];
    else  %同花
        style = [6,sort(n1v,'descend')];
    end
    if n1v(2)-n1v(1)==1 && n1v(3)-n1v(2)==1 && n1v(4)-n1v(3)==1 && n1v(5)-n1v(4)==1
        %顺子
        if length(n1c) >= 2
            style = [5,sort(n1v,'descend')];
        else
            style = [9,sort(n1v,'descend')]; %同花顺
        end
    end
    if n1v == [2 3 4 5 14];
        % [A 1 2 3 4] 特例情况
        if length(n1c) >= 2
            style = [5,1,2,3,4,5];%顺子
        else
            style = [9,1,2,3,4,5]; %同花顺
        end
    end
elseif length(unique(n1v)) == 4
    %% 对子----------------
    un1v = unique(n1v);
    count = hist(n1v,un1v);
    for i = 1:4
        if count(i)==2
            break
        end
    end
    dv = un1v(i);
    un1v(un1v==dv)=[];
    if length(unique(n1c))>=2 % 不是同花
        style = [2,dv,dv,sort(un1v,'descend')];
    else
        style = [6,sort(n1v,'descend')];
    end    
elseif length(unique(n1v))==3
    %% 两对或者1个三条-----
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
        %% 两对
        dv1=un1v(c(1));
        dv2=un1v(c(2));
        dv=[dv1,dv2];
        un1v(un1v==dv1)=[]; un1v(un1v==dv2)=[];%取得只有1颗的牌值
        if length(unique(n1c))>=2 % 不是同花
            style = [3,max(dv),max(dv),min(dv),min(dv),un1v];
        else
            style = [6,sort(n1v,'descend')];
        end
        
    else
        %% 三条
        for i = 1:3
            if count(i)==3 %三条
                break
            end
        end
        un1v = unique(n1v);
        dv = un1v(i);
        un1v(un1v==dv)=[];
        
        if length(unique(n1c))>=2 % 不是同花
            style = [4,dv,dv,dv,sort(un1v,'descend')];
        else
            style = [6,sort(n1v,'descend')];
        end
    end    
elseif length(unique(n1v))==2
    %% 葫芦 或者 四条
    un1v = unique(n1v);
    count = hist(n1v,un1v);
    dv1 = un1v(1);
    dv2 = un1v(2);
    if count(1)==2
        style = [7,dv2,dv2,dv2,dv1,dv1]; %葫芦
    elseif count(1) ==3
        style = [7,dv1,dv1,dv1,dv2,dv2];
    elseif count(1)==1
        style = [8,dv2,dv2,dv2,dv2,dv1]; %四条
    else
        style = [8,dv1,dv1,dv1,dv1,dv2];
    end
end
end