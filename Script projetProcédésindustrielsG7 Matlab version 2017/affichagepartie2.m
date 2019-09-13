function[ ]=affichagepartie2(t , x_anal , x1 , g , gme , gamma1_anal , gamma1 , gamma2 ,gamma2_anal,p)
%l'objective de cet fonction est d'afficher les courbes de partie 2
    if(t==1)
        %affichage de l'enthalpie libre d'excés
        figure;
        plot( x_anal , g);
        hold on  
        scatter( x1, gme,'filled' );
        legend('Gm/RT (NRTL)','Gm/RT (exp)');
        xlabel(' x1');ylabel("Gm/RT");
        title("Comparaison entre les valeurs experimentales et celles obtenues avec le modèle NRTL de l'enthalpie libre d'excéspour pour P="+string(p)+"mmHg");   
    elseif(t==2)
        %affichage de coefficients d'activités de Chloroforme
        figure;
        plot( x_anal , gamma1_anal);
        hold on  
        scatter( x1, gamma1,'filled' );
        legend('gamma1(NRTL)','gamma1(exp)');
        xlabel('x1');ylabel("gamma1 ");
        title("Comparaison entre les valeurs experimentales et celles obtenues avec le modèle NRTL de coefficients d'activités de Chloroforme pour P="+string(p)+"mmHg");     
    elseif(t==3)
        %affichage de coefficients d'activités de l'Acétate d'éthyle
        figure;
        plot( x_anal , gamma2_anal);
        hold on  
        scatter( x1, gamma2,'filled' );
        legend('gamma2(NRTL)','gamma2(exp)');
        xlabel('x1');ylabel("gamma2");
        title("Comparaison entre les valeurs experimentales et celles obtenues avec le modèle NRTL de coefficients d'activités de l'Acétate d'éthylepour P="+string(p)+"mmHg");  
    end
end    