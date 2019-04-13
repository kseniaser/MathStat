clc
clear
xmin = -3.3;
xmax = 2.5;
n = 150;
a1 = 2.2;
a2 = -3.2;
a3 = 4.5;
s = 3.7;
d = (xmax - xmin)/(n - 1);
X = (xmin:d:xmax)';
P3 = a1 + a2*X + a3 * X.^2;
X2 = [ones(n,1), X, X.^2];
ksi = normrnd(0, s, n, 1);
display('исходные коэфициенты')
theta = [a3, a2, a1]
Yreal = P3;
Ynoise = Yreal + ksi;
display('коэфициенты апроксимирующего полинома')
an = polyfit(X,Ynoise,2)
Ypoly = polyval(an,X);
thetastar = ((X2'*X2)^(-1))*(X2')*Ynoise;
display('коэфициенты, полученные матричным методом')
theta1=flip(thetastar')
Ymatrix = X2*thetastar;
plot(X,Yreal,X,Ymatrix,'o',X,Ypoly,'*',X,Ynoise, '*--')
display('проверка ортогональности вектора')
r = Ymatrix-Ynoise;
(r)'*(Ymatrix)
display('оценка уровня шумов')
sn=sqrt(r'*r/(n-3));
sp=[s , sn]
