clc, clear, close

inside = 1:9;
n = 1:10;

seqin = nchoosek(inside,5);

for i = 1:length(seqin)
    seq1 = seqin(i,:); % ÄÚÈ¦Êý
    seq2 = n;
    seq2(ismember(seq2,seq1))=[];
    
    stop  =1 ;
end
