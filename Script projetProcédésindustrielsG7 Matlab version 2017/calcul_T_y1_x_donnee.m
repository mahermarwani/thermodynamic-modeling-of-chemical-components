function[ ]=calcul_T_y1_x_donnee(p,taux,alpha,A1,A2,B1,B2,C1,C2)     
     fraction = input('donner x1 (compris entre 0 et 1): ');  
     [Tres,Y1res]=calcul_T_y1(p,fraction,taux,alpha,A1,A2,B1,B2,C1,C2);
     fprintf("fraction molaire %f => température : %f k et fraction molaire y1 :%f \n",fraction,Tres,Y1res);
end     