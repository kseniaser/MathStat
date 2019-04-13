clc
clear

steps = 60;
h = 0.04;                                   % дискретизация

n0 = 2;                                      % мест в очереди
m0 = 2;                                      % приборов
s = 6;                                       % источников
la = 3;                                      % интенсивность заявок 
mu = 6;                                      % интенсивность обработки

m = min(m0, s);
n = min(m0+n0, s) - m;

La = la * (s-(cumsum(ones(1, m+n))-1))
Mu = mu * [cumsum(ones(1, m)), m * ones(1, n)]

De = [La, 0] + [0, Mu]                      
L = diag(La, 1) - diag(De) + diag(Mu, -1)   
P = expm(h * L) ;                       

frac = [1, La ./ Mu];
k = cumprod(frac);
p0 = 1 / sum(k)
p_th = k .* p0;                             

p_0 = zeros(1, m+n+1);                      
p_0(1) = 1;                                  
P_n(1, :) = p_0;

for step = 1:steps
    P_n = [P_n; P_n(step, :)*P];
end
P_n = [P_n; p_th];


Q_t = P_n * [0 : m+n]';                   % Е(кол-во заявок в системе)
q_t = P_n * [zeros(1, m), 0 : n]';        % Е(кол-во заявок в очереди)
#figure(1)
#plot(x, Q_t, x, q_t)


Q_th = Q_t(end)
q_th = q_t(end)
