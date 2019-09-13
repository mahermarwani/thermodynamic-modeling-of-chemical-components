function [x1_Aztp,T_Aztp]= Azeotrope(p,taux,alpha,A1,A2,B1,B2,C1,C2)
%cet fonction a pour but de déterminer la position de l'Azéotrope(fraction
%molaire) et sa température d'équilibre
    
    %calcul de l'Azéotrope
    x1_Aztp=fzero(@(t)calcul_y1(p,t,taux,alpha,A1,A2,B1,B2,C1,C2 )-t ,0.2); 
    if(x1_Aztp<0) 
        x1_Aztp=685286; 
    end
    
    %calcule de température
    [T_Aztp,~ ]=calcul_T_y1(p,x1_Aztp,taux,alpha,A1,A2,B1,B2,C1,C2 );

end