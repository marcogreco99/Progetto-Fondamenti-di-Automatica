close; close all;

s = zpk('s');
G = 1/(3*(s+1/2));
C = 1/(s*(s+1));
L = series(C,G);
T = feedback(L,1);
S = 1-T;
bode(T);
hold on
bode(S);