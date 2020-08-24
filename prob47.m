function out=prob47()
tic
start = 644;%644  -134043
limit = 5e5;
seqout =zeros(limit,6);  %[num,ap,bp,cp,dp,flag,flag] or [num, ap,bp,cp,dp,ep,flag]
for n = start:limit
    if mod(n,1e4) ==0
        fprintf('iteration n = %d\n',n)
        toc
        tic
    end
    if ~isprime(n)
        seqout(n,:)=judge4equation(n);
        if seqout(n-3,1)~=0&&seqout(n-2,1)~=0&&seqout(n-1,1)~=0&&seqout(n,1)~=0
            break
        end
    end
end
seqout(seqout(:,1)==0,:)=[];
toc
fprintf('the result is %d\n',seqout(end-3,1))
out = seqout(end-3:end,:);
end


function  out=judge4equation(num) %判断每个自然数n能否分解为4个prime乘积
out =zeros(1,6);

a = primes(num/30);
for al = 1:length(a)
    ap = a(al);
    b = primes(min(num/(6*ap),ap));
    b(b==ap)=[];
    for bl = 1:length(b)
        bp = b(bl);
        c = primes(min(num/(2*ap*bp),bp));
        c(c==ap)=[];
        c(c==bp)=[];
        for cl =1:length(c)
            cp=c(cl);
            dp = num/(ap*bp*cp);
            ep = sqrt(dp);
            if dp ==fix(dp)
                if  ~ismember(dp,[ap,bp,cp]) &&isprime(dp)
                    flag = 0;
                    out =[num,ap,bp,cp,dp,flag];
                end
                if ep == fix(ep) && ~ismember(ep,[ap,bp,cp]) && isprime(ep)
%                     flag=1;
                    out = [num,ap,bp,cp,ep,ep];
                end
            end
        end
    end
end
end