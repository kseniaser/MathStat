clc
clear
g = 0.95;
T = norminv((1+g)/2)
n = 10^4;
x = exprnd(3,n,1);
y = 3*x.^3;
int = mean(y)
d = T*std(y)/sqrt(n)
I = [int-d,int+d]

function fun = f(x)
  fun = (x.^3)*exp(-x/3);
endfunction

format long
I = quad("f",0,inf)

n = 10^6;
x = exprnd(3,n,1);
y = 3*x.^3;
int = mean(y)
d = T*std(y)/sqrt(n)
I = [int-d,int+d]

function fun = f(x)
  fun = (x.^3)*exp(-x/3);
endfunction

format long
I = quad("f",0,inf)