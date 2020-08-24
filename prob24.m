clc, clear, close
tic
list = 0:9;

permutation=perms(list);
pp = sortrows(permutation);
disp(['The millionth lexicographic permutation of the digits is ',num2str(pp(1e6,:))])
% fprintf('The millionth lexicographic permutation of the digits is %d\n',pp(1e6,:))
toc