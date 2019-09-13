function [Teq,Yeq1]=calcul_T_y1(P,x1,taux,alpha,A1,A2,B1,B2,C1,C2 )
%le but de cet fonction est de calculer la ou les valeurs de fraction
%molaire y1 et temp�rature d'�quilible � partir d'une ou des fraction
%molaires donn�es x1
    [ ~  , gamma1 , gamma2 ] = valeur_anal( x1,taux(1),taux(2),alpha );
%Valeur initial de la Temperature T0
    Teb1=B1/(A1-log10(P))-C1;
    Teb2=B2/(A2-log10(P))-C2;
    T0=(Teb1+Teb2)/2;
%taille de l'�chentillon
    Teq = zeros( 1,length(x1) );
for i=1:length(x1)  
    %calcul de temp�rature d'�quilibre
    Teq(i)=fzero(@(T)x1(i)*gamma1(i)*exp(A1-B1/(T+C1))+(1-x1(i) )*gamma2(i)*exp(A2-B2/(T+C2))-P,T0);
    %calcul Pressions saturantes a partir de l'�quation d'Antoine   
    p1(i)=exp(A1-B1/(Teq(i)+C1));
    p2(i)=exp(A2-B2/(Teq(i)+C2));
    %Calcul de la fraction molaire de y1
    Yeq1(i)=x1(i)*gamma1(i)*p1(i)/ P;  
end


end