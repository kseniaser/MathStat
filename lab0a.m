clc
clear
g = 0.95;
T = norminv((1+g)/2)
n = 10^4;
k = 5;
x = rand(n,k);
y = 2.5.^x;
res = sum(y');
v = mean(res<8.2)
d = std(res<8.2)*T/sqrt(n)
I = [v-d,v+d]
n = 10^6;
k = 5;
x = rand(n,k);
y = 2.5.^x;
res = sum(y');
v = mean(res<8.2)
d = std(res<8.2)*T/sqrt(n)
I = [v-d,v+d]