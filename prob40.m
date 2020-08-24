clc, clear, close
tic
fraction = '';
parfor i = 0:185185
    fraction = [fraction, num2str(i)];
%     len = length(fraction);
% %     if rem(len,1e4)==0
% %         fprintf('len= %d\n',len)
% %     end
%     if len > 1e6
%         disp('true')
%         mark =i;
%         break
%     end
end

value =1;
for i =0:6
    value = value*str2double(fraction(1*10^i+1));
end  
fprintf('the value of the expression is %d\n',value)
toc