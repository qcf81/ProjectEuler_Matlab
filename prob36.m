clc, clear, close
tic

limit = 1e6;
numSeq = zeros(limit,1);

parfor i = 1:limit
    %     %mark the iteration
    %     if mod(i,1e4)==0
    %         fprintf('iteration i = %d\n',i)
    %     end
    numDecimal = i;
    strDecimal = num2str(numDecimal);
    strBinary = dec2bin(numDecimal);
    
    % Judge palindromic
    if strcmp(strDecimal,strDecimal(end:-1:1)) && strcmp(strBinary,strBinary(end:-1:1))
        numSeq(i) = i;
    end
end

numSeq(numSeq==0)=[];
fprintf('the sum of all double-base palindromes less than 1e6 is %d\n',sum(numSeq))
toc