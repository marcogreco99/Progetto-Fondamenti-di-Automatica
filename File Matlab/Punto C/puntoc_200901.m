close; close all;

s = zpk('s');
G = 1/(3*(s+1/2));


R = 5;
ingresso =10;
epsilon = 0.5;

