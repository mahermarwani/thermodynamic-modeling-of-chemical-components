function [ err ] = Objectif( x1,y1,T,p,taux,alpha,A1,A2,B1,B2,C1,C2)
%cet fonction a pour but de calculer l'erreur entre les valeurs
%exp�rimentals et analytiques en utilison des param�tres donn�es
%calcul des valeurs exp�rimentales
    [gme , gamma1 , gamma2 ] = valeur_exp( x1,y1,T,p,A1,A2,B1,B2,C1,C2);
%calcul des valeurs analytiques � partir des param�tres donn�es    
    [ g , g1 , g2 ] = valeur_anal( x1, taux(1) , taux(2) , alpha) ;
%Calcul l'erreur entre les valeurs exp�rimentales et analytiques    
    err=1/3 *( norm( g-gme , 2) +0.5*norm( g1-gamma1 , 2)+0.2* norm( g2-gamma2 , 2) );    
end

