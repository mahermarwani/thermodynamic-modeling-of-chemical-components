function [ gme , gamma1 , gamma2 ] = valeur_anal( x1,t12,t21,alpha)
    %cet fonction a pour but de calculer les valeurs analytiques des
    %Gme ,Gamma1 et Gamma2 à partir des paramétres ajustables
    G12=exp(-alpha*t12); G21=exp(-alpha*t21);
    for i=1:length(x1)
        %calcul de l'entalphie d'excée molaire 
        gme(i)=x1(i)*(1-x1(i))*( (t21*G21)/( x1(i)+(1-x1(i))*G21 ) + (t12*G12)/(1-x1(i)+x1(i)*G12) );
        %calcul de coefficion d'activité de composent 1
        gamma1(i)=exp((1-x1(i))^2*(t21*(G21/(x1(i)+(1-x1(i))*G21))^2+(t12*G12)/(1-x1(i)+x1(i)*G12)^2));
        %calcul de coefficion d'activité de composent 2
        gamma2(i)=exp(x1(i)^2*(t12*(G12/(1-x1(i)+x1(i)*G12))^2+(t21*G21)/(x1(i)+(1-x1(i))*G21)^2));
    end
end

