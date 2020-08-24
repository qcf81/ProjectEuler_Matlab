clc, clear, close
tic
count = 0;
seq =zeros(100,8);
for i = 0:1:200
    if mod(i,2)==0
        fprintf('iteration i = %d\n',i)
    end
    for j = 0:100
        if i+2*j>200
            break
        end
        for k = 0:40
            if i+2*j+5*k>200
                break
            end
            for l = 0:20
                if i+2*j+5*k+10*l>200
                    break
                end
                for m = 0:10
                    if i+2*j+5*k+10*l+20*m>200
                        break
                    end
                    for n = 0:4
                        if i+2*j+5*k+10*l+20*m+50*n>200
                            break
                        end
                        for p = 0:2
                            if i+2*j+5*k+10*l+20*m+50*n+100*p>200
                                break
                            end
                            for h = 0:1
                                sum = i+2*j+5*k+10*l+20*m+50*n+100*p+200*h;
                                
                                if sum == 200
                                    count = count+1;
                                    seq(count,:) = [i,j,k,l,m,n,p,h];
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
toc
fprintf('There are %d ways can make 2 pounds\n', count)