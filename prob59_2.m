clc, clear, close

key = 'god';
fid = fopen('C:\Users\Administrator\Desktop\ÊÕ¼¯Matlabº¯Êý\ProjectEuler\p059_cipher.txt','r');
ss = textscan(fid,'%d','Delimiter',',');
fclose(fid);
num = ss{1,1};
ss = dc(num,key);
disp(sum(ss))