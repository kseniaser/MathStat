clc
clear
a = 1; s = 3;
g=0.95; n = 10^4;
mistake1=0;
for tt = 1:1000
  x=sort(normrnd(a,s,n,1));
  m=ceil(n^(1/3));
  h=(max(x)-min(x))/m;
  a0=mean(x);
  s0=std(x);
  t=min(x):h:max(x)-h;
  t1=min(x)+h:h:max(x);
  ni=hist(x,m);
  p=normcdf(t1,a0,s0)-normcdf(t,a0,s0);
  d=sum(((ni-p*n).^2)./(p*n));
  quant=chi2inv(g,m-3)
  if d>=quant
    mistake1=mistake1+1;
  endif
endfor
ans = mistake1/tt;
printf("ошибка первого рода при n = %d составляет %f \n",n,ans)
