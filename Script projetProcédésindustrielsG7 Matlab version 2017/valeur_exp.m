function [gme , gamma1 , gamma2 ] = valeur_exp( x1,y1,T,p,A1,A2,B1,B2,C1,C2)
    %cet fonction a pour but de calculer les valeurs expérimentales
    %de Gme , Gamma1 et Gamma2
    %taille de l'échentillon expérimental
    taille=length(T);
    for i=1:taille
        %calcul de pression saturante de composent 1
        psat1(i)=exp ( (A1-B1/(C1+T(i))) );
        %calcul de pression saturante de composent 2
        psat2(i)=exp ( (A2-B2/(C2+T(i))) );
        %calcul de coefficion d'activité de composent 1
        gamma1(i)=( y1(i)*p ) / ( x1(i)*psat1(i) );
        %calcul de coefficion d'activité de composent 2
        gamma2(i)= ( (1-y1(i))*p ) / ( (1-x1(i))*psat2(i) );
        %calcul de l'entalphie d'excée molaire 
        gme(i)=x1(i)*log( gamma1(i) )+(1-x1(i))*log( gamma2(i) );
    end
end