clc, clear, close
tic
% the code of letter 'a' is 97, letter 'A' is 65;
% define a to 1, code -96; define A to 1, code -64
limit = 1e2;
seqTriangle = zeros(limit,1);

for n = 1:limit
    seqTriangle(n) = 0.5*n*(n+1);
end

[fid,errsmg] = fopen('C:\Users\Administrator\Desktop\ÊÕ¼¯Matlabº¯Êý\ProjectEuler\p042_words.txt','r');
aa = textscan(fid,'%s','Delimiter',','); 
fclose(fid);
words = aa{1,1};
words = strrep(words,'"',''); % delete the symbol "
count = 0;
[m,p] = size(words);
for i = 1:m
    word = words{i,1};
    value = 0;
    for j = 1:length(word)
        value = value+double(word(j))-64;        
    end % end of j   
    
    if ismember(value,seqTriangle)
        count = count+1;
        mark{count,1} = word;
        mark{count,2} = value;
    end 
end % end of iteration i
fprintf('There are %d triangle words\n',count)
toc