﻿clc
clear

steps = 60;
h = 0.07;                                   % дискретизация

n = 10;                                     % мест в очереди
m = 2;                                      % приборов
la = 4;                                     % интенсивность заявок 
mu = 3;                                     % интенсивность обработки
gamma = 2;                                  % интенсивность усталости в очереди
delta = 0;  # (-)                           % интенсивность усталости в системе
                                            % Усталость - leave без обработки
La = la * ones(1, m+n);
Mu = mu * [cumsum(ones(1, m)), m * ones(1, n)] + ...
     gamma * [zeros(1, m), cumsum(ones(1, n))] + ...
     delta * cumsum(ones(1, m+n));

De = [La, 0] + [0, Mu];                     % главная диагональ
L = diag(La, 1) - diag(De) + diag(Mu, -1)  % инфинитозимальная матрица
P = expm(h * L);                            % матрица переходов
                                            % (см ДУ Колмогорова)
frac = [1, La ./ Mu];
k = cumprod(frac);
p0 = 1 / sum(k);
p_th = k .* p0;                             % теор. вер-ти состояний системы

p_0 = zeros(1, m+n+1);                      % начальные вероятности
p_0(1) = 1;                                 % в момент t_0 -> [1000..0]
P_n(1, :) = p_0;

for step = 1:steps
    P_n = [P_n; P_n(step, :)*P];
end
P_n = [P_n; p_th];                          % вер-ти состояний in real time(RT)
P_q = sum(P_n(:, m+2 : m+n+1), 2);

x = [0:steps, steps+2];
figure(1)
plot(x, P_n, x, P_q, 'k-');

E_q = P_n * [zeros(1, m), 0 : n]';          % Е(кол-во заявок в очереди) RT
E_Q = P_n * [0 : m+n]';                     % Е(кол-во заявок в системе) RT
figure(2)
plot(x, E_Q, x, E_q);

% Ниже - теор. данные для системы в стационарном режиме
P_n(end, :)'                                % теор. вер-ти состояний системы
p_q = sum(p_th(m+2 : m+n+1))                % вер-ть очереди
E_Q_th = E_Q(end)                           % Е(кол-во заявок в очереди)
E_q_th = E_q(end)                           % Е(кол-во заявок в системе)
E_W = E_q_th / la                           % E(время в очереди)
E_T = E_Q_th / la                           % E(время в системе)
E_a = sum(p_th(1 : m+1) .* [0 : m])         % E(занятые приборы) 
