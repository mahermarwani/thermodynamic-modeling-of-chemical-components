function [x1_Aztp,T_Aztp]= Azeotrope(p,taux,alpha,A1,A2,B1,B2,C1,C2)
%cet fonction a pour but de d�terminer la position de l'Az�otrope(fraction
%molaire) et sa temp�rature d'�quilibre
    
    %calcul de l'Az�otrope
    x1_Aztp=fzero(@(t)calcul_y1(p,t,taux,alpha,A1,A2,B1,B2,C1,C2 )-t ,0.2); 
    if(x1_Aztp<0) 
        x1_Aztp=685286; 
    end
    
    %calcule de temp�rature
    [T_Aztp,~ ]=calcul_T_y1(p,x1_Aztp,taux,alpha,A1,A2,B1,B2,C1,C2 );

end