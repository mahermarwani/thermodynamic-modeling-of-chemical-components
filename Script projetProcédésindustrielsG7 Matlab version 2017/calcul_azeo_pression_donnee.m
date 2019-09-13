function[ ]=calcul_azeo_pression_donnee(x_anal,taux,alpha,A1,A2,B1,B2,C1,C2)
    %cet fonction calcul la valeur d'azeotrope à partir d'un pression que
    %vous avez donneé et retourne sa fraction molaire s'il existe
    p= input('donner pression en mmHg pour tester : ');
    [Teq,Yeq1]=calcul_T_y1(p,x_anal,taux,alpha,A1,A2,B1,B2,C1,C2);
    [x1_Aztp,T_Aztp]= Azeotrope(p,taux,alpha,A1,A2,B1,B2,C1,C2);
    fprintf("affichage de Diagramme Binaire pour P="+string(p)+"mmHg\n");affichagepartie4(1,x_anal ,Yeq1, Teq,p);
    fprintf("affichage de courbe de x1 et y1 en fonction de x1\n");affichagepartie4(2,x_anal ,Yeq1, Teq,p);
    if(x1_Aztp<0.999999 && x1_Aztp>0.00001)
        fprintf("fraction molaire de l'Azéotrope :%f=> température :%f en kelvin pour une pression :%fmmHg\n",x1_Aztp,T_Aztp,p);
    else
        fprintf(" pas d'Azéotrope\n");
    end
end     