clc
clear
a = 1; s = 3;
g=0.95; n = 10^6;
x=sort(normrnd(a,s,n,1));
m=ceil(n^(1/3));
h=(max(x)-min(x))/m;
i=min(x):h:max(x)-h;
fn=hist(x,m)/(n*h);
[a1,b1]=stairs(i,fn);
c=min(x):0.01:max(x);
f=normpdf(c,a,s);
figure(2)
plot(a1,b1,c,f,c,0)