function y=RandomPermutation(A)


if nargin<1,
    A = [ 2, 1, 5, 3];

end
[r,c]=size(A);
b=reshape(A,r*c,1);          % convert to column vector
x=randperm(r*c);             % make integer permutation of similar array as key
w=[b,x'];                    % combine matrix and key
d=sortrows(w,2);             % sort according to key
y=reshape(d(:,1),r,c);  