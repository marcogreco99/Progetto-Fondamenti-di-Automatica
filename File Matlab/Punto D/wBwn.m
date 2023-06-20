function wBwn = wBwn( delta )
% calcola il rapporto banda passante/pulsazione naturale corrispondente 
% ad un determinato smorzamento (delta > 0.38)

wBwn=sqrt(1-2*delta^2+sqrt((1-2*delta^2)^2+1));

end
