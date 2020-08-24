clc, clear, close
tic
ft = @(n) n.*(n+1)./2;
fp = @(n) n.*(3.*n-1)./2;
fh = @(n) n.*(2.*n-1);

limit = 1e5;
seqt = ft(1:limit);
seqp = fp(1:limit);
seqh = fh(1:limit);

for i=2:1e5
    vt = ft(i);
    if ismember(vt,seqp) && ismember(vt,seqh)
        mark=vt;
        fprintf('%d\n',vt)
        if vt~=40755
            break
        end
    end
end
toc