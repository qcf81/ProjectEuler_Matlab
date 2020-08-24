clc, clear, close
tic
f3 = @(n) n.*(n+1)./2; f4 = @(n) n.^2; f5 = @(n) n.*(3.*n-1)./2;
f6 = @(n) n.*(2.*n-1); f7 = @(n) n.*(5.*n-3)./2; f8 = @(n) n.*(3.*n-2);

seqT = zeros(1e4,1);seqS = zeros(1e4,1);seqP = zeros(1e4,1);
seqH6 = zeros(1e4,1);seqH7 = zeros(1e4,1);seqO = zeros(1e4,1);
for i = 1:1e4
    seqT(i) = f3(i);
    seqS(i) = f4(i);
    seqP(i) = f5(i);
    seqH6(i) = f6(i);
    seqH7(i) = f7(i);
    seqO(i) = f8(i);
end
seqT(seqT<1e3)=[];seqT(seqT>9999)=[];
% define the Triangle with 4 digit numbers
seqS(seqS<1e3)=[];seqS(seqS>9999)=[];
% define the Square with 4 digit numbers
seqP(seqP<1e3)=[];seqP(seqP>9999)=[];
% define the Pentagonal with 4 digit numbers
seqH6(seqH6<1e3)=[];seqH6(seqH6>9999)=[];
seqH7(seqH7<1e3)=[];seqH7(seqH7>9999)=[];
seqO(seqO<1e3)=[];seqO(seqO>9999)=[];

seq3 = seqT; seq3(:,2) = 3;
seq4 = seqS; seq4(:,2) = 4;
seq5 = seqP; seq5(:,2) = 5;
seq6 = seqH6; seq6(:,2) = 6;
seq7 = seqH7; seq7(:,2) = 7;
seq8 = seqO; seq8(:,2) =8;
seq = [seq3;seq4;seq5;seq6;seq7;seq8;];

for i = 1:length(seq3)
    % 从三角形数开始选
%     disp(i)
    flagt =0;
    n1 = seq3(i,1);
    
    ss2 = seq;
    ss2(ss2(:,2)==3,:)=[];   
    % 去掉三角形数
    s1 = num2str(n1);
    for j = 1:length(ss2)
        n2 = ss2(j,1);
       
        s2 = num2str(n2);
        if strcmp(s1(3:4),s2(1:2))
            ss3 = ss2;
            ss3(ss3(:,2)==ss3(j,2),:)=[];            
            for k = 1:length(ss3)
                n3 = ss3(k,1);
                
                s3 = num2str(n3);
                if strcmp(s2(3:4),s3(1:2))
                    ss4 = ss3;
                    ss4(ss4(:,2)==ss4(k,2),:)=[];
                    for m = 1:length(ss4)
                        n4 = ss4(m,1);
                        
                        s4 = num2str(n4);
                        if strcmp(s3(3:4),s4(1:2))
                            ss5 = ss4;
                            ss5(ss5(:,2)==ss5(m,2),:)=[];
                            for n = 1:length(ss5)
                                n5 = ss5(n,1);
                                
                                s5 = num2str(n5);
                                if strcmp(s4(3:4),s5(1:2))
                                    ss6 =ss5;
                                    ss6(ss6(:,2)==ss6(n,2),:)=[];
                                    for p = 1:length(ss6)
                                        n6 = ss6(p,1);
                                        s6 = num2str(n6);
                                        if strcmp(s5(3:4),s6(1:2))
                                            if strcmp(s6(3:4),s1(1:2))
                                                flagt =1;
                                                mark = [seq3(i,:);ss2(j,:);ss3(k,:);ss4(m,:);ss5(n,:);ss6(p,:);];
                                                
                                                break
                                            end
                                        end
                                        if flagt ==1
                                        break
                                        end
                                    end % for p
                                end
                                if flagt==1
                                break
                                end
                            end %for n
                        end
                        if flagt==1
                        break
                        end
                    end % for m
                end
                if flagt==1
                break
                end
            end % for k
        end
        if flagt==1
        break
        end
    end % for j
    if flagt ==1
        break
    end
end % for i

disp(sum(mark(:,1)))                   
toc
