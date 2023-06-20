clear; close all;
s = zpk('s');
G = (s+2)/(s*(s+1/2)^2);
C = 1;

L = series (C, G);
margin(L);

smorz_critico = smorz_S(0.25);

% ricavo la pulsazione naturale critica

ts = 70;
pulsazione_n_critica = 3/(smorz_critico*ts);

% posso ricavarmi la pulsazione di banda passante critica considerando
% la funzione wBwn che determina il rapporto tra la pulsazione di 
% banda passante stessa e la pulsazione naturale critica:

wB_critica = pulsazione_n_critica*wBwn(smorz_critico);

wc_scelto = 3;
[modulo, fase] = bode(L,wc_scelto);

m=1/modulo;
theta = 50-(180-abs(fase));

% disegno la rete anticipatrice :


[tauz, taup] = generica(wc_scelto,m,theta);

% definisco la f.d.t della rete anticipatrice
Cd = (1+s*tauz)/(1+s*taup);
%stadio ad anticipo

% mi definisco la nuova funzione d'anello
Lhat = series(series(C,G),Cd);

% mi calcolo il margine della nuova funzione d'anello

hold on
margin(Lhat)

T = feedback(Lhat,1);
close all
step(T)

pzmap(T);
dcgain(T)
Tmed = 7.986/(s^2 + 3.619*s + 7.986);
dcgain(T)
step(T,Tmed);
legend