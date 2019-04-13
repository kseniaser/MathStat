clc
clear
xmin = -3.3;
xmax = 5.5;
n = 300;
c1 = 2.2;
c2 = 1.5;
s = 3.7;
d = (xmax - xmin)/(n - 1);
X = (xmin:d:xmax)';
P2 = c1 + c2*X;
ksi = normrnd(0, s, n, 1);
display('исходные коэфициенты')
theta = [c2, c1]
Yreal = P2;
Ynoise = Yreal + ksi;
display('коэфициенты апроксимирующего полинома')
an = polyfit(X,Ynoise,1)
Ypoly = polyval(an,X);
X2 = [ones(n,1), X];
thetastar = ((X2'*X2)^(-1))*(X2')*Ynoise;
display('коэфициенты, полученные матричным методом')
theta1=flip(thetastar')
Ymatrixx = X2*thetastar;
Xn=mean(X);
Yn=mean(Ynoise);
K=(Xn'*Yn)-(X'*Ynoise)./n;
Sn2 = Xn'*Xn-(X'*X)./n;
theta2 = K/Sn2;
theta1 = Yn-theta2*Xn;
display('коэфициенты, полученные с помощью ковариации')
th = [theta2 , theta1]
Ymatrix = X2*flip(th)';
plot(X,Ynoise,X,Yreal,X,Ymatrix,'o',X,Ypoly,'*',X,Ymatrixx, '--')
display('проверка ортогональности вектора')
r = Ymatrix-Ynoise;
r'*Ymatrix
display('оценка уровня шумов')
sn=sqrt(r'*r/(n-2));
sp=[s , sn]
