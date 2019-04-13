clc
clear

m = 100;
A = 2; s = 3;
u = 1; b = 8;
d = b - A; M = (A + b)/2;
n = 10^2;

    for j = 1 : m
        X(:, 1) = sort(normrnd(A, s, n, 1));
        X(:, 2) = sort(A + exprnd(u, n, 1) - exprnd(u, n, 1));
        X(:, 3) = sort(unifrnd(M - d/2, M + d/2, n, 1));
        a(j, 1, :) = mean(X);
        a(j, 2, :) = median(X);
        a(j, 3, :) = (min(X) + max(X)) / 2;
    end    
     
#norm
t(1, 1) = s / sqrt(n);
t(2, 1) = s * sqrt(pi/(2*n));
    t(3, 1) = s * sqrt(0.4/log(n)); 
    #lapl
    t(1, 2) = u * sqrt(2/n);
    t(2, 2) = u / sqrt(n);
    t(3, 2) = u * 0.9;   
    #unif
    t(1, 3) = d / sqrt(12*n);
    t(2, 3) = d / sqrt(4*n);
    t(3, 3) = d / (sqrt(2)*n);

r = squeeze(std(a))';
t = t';

printf("n = %d \n",n)
printf('\n дисперсия практической ОМП \n\n')
disp("norm"),disp(r(1,:)), disp("lapl"),disp(r(2,:)), disp("unif"),disp(r(3,:))
printf('\n дисперсия теоретической ОМП \n\n')
disp("norm"),disp(t(1,:)), disp("lapl"),disp(t(2,:)), disp("unif"),disp(t(3,:))

n=10^4; X=[];

    for j = 1 : m
        X(:, 1) = sort(normrnd(A, s, n, 1));
        X(:, 2) = sort(A + exprnd(u, n, 1) - exprnd(u, n, 1));
        X(:, 3) = sort(unifrnd(M - d/2, M + d/2, n, 1));        
        a(j, 1, :) = mean(X);
        a(j, 2, :) = median(X);
        a(j, 3, :) = (min(X) + max(X)) / 2;
    end    
 
    #norm
    t(1, 1) = s / sqrt(n);
    t(2, 1) = s * sqrt(pi/(2*n));
    t(3, 1) = s * sqrt(0.4/log(n));    
    #lapl
    t(1, 2) = u * sqrt(2/n);
    t(2, 2) = u / sqrt(n);
    t(3, 2) = u * 0.9;    
    #unif
    t(1, 3) = d / sqrt(12*n);
    t(2, 3) = d / sqrt(4*n);
    t(3, 3) = d / (sqrt(2)*n);

r = squeeze(std(a))';
t = t';

printf("\n n = %d \n",n)
printf('\n дисперсия практической ОМП \n\n')
disp("norm"),disp(r(1,:)), disp("lapl"),disp(r(2,:)), disp("unif"),disp(r(3,:))
printf('\n дисперсия теоретической ОМП \n\n')
disp("norm"),disp(t(1,:)), disp("lapl"),disp(t(2,:)), disp("unif"),disp(t(3,:)) 