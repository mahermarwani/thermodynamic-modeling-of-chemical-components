function[ ]=affichagepartie1(t,x1,y1,T,p,A1,A2,B1,B2,C1,C2)
    %l'objective de cet fonction est d'afficher les courbes de partie 1
    %calcule de Gme , Gamma1 et Gamma2 expérimentales
    [gme , gamma1 , gamma2 ] = valeur_exp( x1,y1,T,p,A1,A2,B1,B2,C1,C2);
    if(t==1)
        %affichage de Diagramme binaire
        figure;
        scatter( x1, T,'filled' );
        hold on  
        scatter( y1, T,'filled' );
        legend('courbe de bulle','courbe de rosée');
        xlabel('x1,y1'); 
        ylabel("T en k ");
        title("Diagramme Binaire pour P="+string(p)+"mmHg");
    elseif(t==2)
        %affichage L'enthalpie libre d'excés en fonction de la fraction molaire liquide du Chloroforme
        figure;
        scatter( x1, gme,'filled' );
        xlabel(' x1');ylabel("Gm/RT");
        title("L'enthalpie libre d'excés la fraction molaire liquide du Chloroforme pour P="+string(p)+"mmHg");
    elseif(t==3)
        %affichage de coefficion d'activité du Chloroforme en fonction de la fraction molaire liquide du Chloroforme
        figure;
        scatter( x1, gamma1,'filled' );
        xlabel(' x1');ylabel("gamma1 ");
        title("coefficion d'activité du Chloroforme en fonction de la fraction molaire liquide du Chloroforme pour P="+string(p)+"mmHg");
    elseif(t==4)
        %affichage de coefficion d'activité de acétate d'éthyle en fonction de la fraction molaire liquide du Chloroforme
        figure;
        scatter( x1, gamma2,'filled' );
        xlabel(' x1');ylabel("gamma2 ");
        title("coefficion d'activité de acétate d'éthyle en fonction de la fraction molaire liquide du Chloroforme pour P="+string(p)+"mmHg");
    end
end    
        
        
        
