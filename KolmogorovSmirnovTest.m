clc
clear
a = 1; s = 3;
n = 1000;
x = a-3*s:0.05:a+3*s;
X=sort(normrnd(a,s,n,1));
F=normcdf(x,a,s);
g=0.95;
T = 1.36;
y=1/n:1/n:1;
[a,b]=stairs(X,y);
b1=max(0,b-T/sqrt(n));
b2=min(1,b+T/sqrt(n));
figure(3);
plot(a,b,x,F,a,b1,a,b2),grid;


a = 1; s = 3;
n = 1000;
X=sort(normrnd(a,s,n,1));
Ks=0.46;
T = 1.36;
a0=mean(X);
s0=std(X);
i=(1:n)';
m=100;

for q=0.05:0.05:0.3
  t1=0;
  t2=0;
  t3=0;
  t4=0;
  for t = 1:m
  
    X1=sort(normrnd(a0,s0,n,1));
    a0=mean(X1);
    s0=std(X1);
    FF=normcdf(X1,a0,s0);
    FF1=normcdf(X1,a0+q,s0);
  
    dn=sqrt(n)*max(max(abs(FF-i/n), abs(FF-(i-1)/n)));
    if dn>=T t1=t1+1;
    endif

    dn1=sqrt(n)*max(max(abs(FF1-i/n), abs(FF1-(i-1)/n)));
    if dn1<T t2=t2+1;
    endif
  
    wn2=1/(12*n)+sum((FF-(2*i-1)/(2*n)).^2);
    if wn2>=Ks^2 t3=t3+1;
    endif

    wn21=1/(12*n)+sum((FF1-(2*i-1)/(2*n)).^2);
    if wn21<Ks^2 t4=t4+1;
    endif

endfor
  printf("Изменение параметра для выявления ошибки второго рода на ");
  q
  printf("Критерий Колмагорова: ошибка 1 и 2 рода\n");
  g1=t1/m
  g2=t2/m
  printf("Критерий Смирнов: ошибка 1 и 2 рода\n");
  g3=t3/m
  g4=t4/m
  printf("\n");
endfor