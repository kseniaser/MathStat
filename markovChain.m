clc
clear
n=5;
p=0.4;
q=1-p;
d=zeros(n+1,1);
d(1)=q;
d(n+1)=p;
P=diag(d);
d=ones(1,n);
d(1)=1;
d(n)=1;
P = P + diag(d*q,-1) ;
d(1)=1;
d(n)=1;
P= P+diag(d*p,1);
initial_number = randi(n + 1)
P0=[0,0,0,0,0,0];
P0(initial_number) = 1;
printf("практические значения \n")
Pe2=P^500;
Pe3=Pe2(end,:)

#theoretical
f=q/p;
t=1:1:n+1;
pp(t)=f.^(t-1)*(1-f)/(1-f.^(n+1));
printf("теоретические значения \n")
fliplr(pp)

#matrix method
b=zeros(n+2,1);
b(1)=1;
I=eye(n+1);
p=(P-I)';
p=[ones(1,columns(p));p];
printf("значения, найденные с помощью матричного метода \n")
(linsolve(p,b))'

j=3;
vector(1)=j;
for i=1:100
  u=rand(1,1);
    if ( u<0.6 && j>1)
      j=j-1;
    elseif (j<n)
      j=j+1;
    endif
  vector(i)=j;
 endfor
t=1:1:i;
#plot(t,vector,'-*-');

for t=1:50
  f1(t,:)=P0*P^(t-1);
endfor
t=1:1:50;
plot(t,f1,'-*-');