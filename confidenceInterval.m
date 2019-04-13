clc
clear
a=1;
b=4;
t=2;
s=3;
n=10^4;
m=10^2;
 #F0=unifcdf(t,a,b);
 F0=normcdf(t,a,s)
 #X=unifrnd(a,b,n,m);
 X=normrnd(a,s,n,m);
g=0.95;
T=norminv((g+1)/2);
Fn=mean(X<t);
l=0;
for i = 1:m
  dn(i)=T*sqrt(Fn(i)*(1-Fn(i))/n);
  Fnp(i) = Fn(i) + dn(i);
  Fnm(i)=Fn(i)-dn(i);
  l = l+(Fnp(i) < F0)+(Fnm(i) > F0);
endfor
r=l
x=1:1:m;
plot(x,Fnm,'*:');
hold all;
plot(x,Fnp,'*:');
hold all;
x1 = 1:0.5:m;
plot(x1,F0,'*:');
hold all;