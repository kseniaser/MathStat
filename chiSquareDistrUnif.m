clc
clear
a = 1; s = 3;
g=0.95; n = 10^4;
mistake1=0;
for tt = 1:1000
  x=sort(unifrnd(a,s,n,1));
  m=ceil(n^(1/3));
  h=(max(x)-min(x))/m;
  t=x(1):h:x(end)-h;
  t1=x(1)+h:h:x(end);
  ni=hist(x,m);
  p=unifcdf(t1,x(1),x(end))-unifcdf(t,x(1),x(end));
  d=sum(((ni-p*n).^2)./(p*n));
  quant=chi2inv(g,m-3);
if d>=quant
    mistake1=mistake1+1;
  endif
endfor
ans = mistake1/tt;
printf("равномерное распределение\n")
printf("ошибка первого рода при n = %d составляет %f \n",n,ans)
