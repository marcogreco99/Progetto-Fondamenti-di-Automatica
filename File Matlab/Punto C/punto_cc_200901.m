close; close all;

s = zpk('s');
G = 1/(3*(s+1/2));
C = 2.2/(s*(s+1));
L = series(C,G);