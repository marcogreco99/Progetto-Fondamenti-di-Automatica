close; close all;

s = zpk('s');
G = 1/(3*(s+1/2));
C = 2.25/(s*(s+1));
L = series(C,G);

margin(L);
nyquist(L);
