clc, clear, close

[fid, errmsg] = fopen('C:\Users\Administrator\Desktop\ÊÕ¼¯Matlabº¯Êý\projectEuler\p022_names.txt','r');

aa=textscan(fid,'%s','Delimiter',',');
name=aa{1};
fclose(fid);
% clear aa;
name = strrep(name, '"','');
sortName = sortrows(name);

num(1,length(name))=0;
count=0;
for ii = 1:length(sortName)
    num(ii)=0;
    
    for j =1:length(sortName{ii})
        if abs(sortName{ii}(j))>=65 && abs(sortName{ii}(j))<=122                       
            num(ii)=num(ii)+abs(sortName{ii}(j))-64;
        else
            num(ii)=num(ii)+abs(sortName{ii}(j))-96;           
        end
    end
    count=count+num(ii)*ii;
end

fprintf('The total of all the name socres is %d\n',count)
disp(['The answer is ',num2str(count)])


    
