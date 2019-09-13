function[ ]=affichagepartie3(t , x_anal , Teq, x1, T, Yeq1, y1,ecart_T,ecart_y1,p)
    if(t==1)
        %affichage le r�sultat trouv� de Temp�rature T
        figure;
        plot( x_anal , Teq);
        hold on  
        scatter( x1, T,'filled' );
        legend('Tcal','Texp');
        xlabel(' x1');ylabel("Temp�rature ( en K) ");
        title("Comparaison entre la temp�rature exp�rimentale et la temp�rature calcul�e pour P="+string(p)+"mmHg");
        annotation('textbox',[.2 .5 .3 .3],'String',"�cart type : " + string(ecart_T ),'FitBoxToText','on');
    elseif(t==2)
        %affichage le r�sultat trouv� de fraction molaire y1
        figure;
        plot( x_anal , Yeq1);
        hold on  
        scatter( x1, y1,'filled' );
        legend('courbe analytic','valeurs exp�rimentaux');
        xlabel(' x1');ylabel(" y1 ");
        title("comparaison entre la composition molaire exp�rimentale et calcul�e pour P="+string(p)+"mmHg");
        annotation('textbox',[.2 .5 .3 .3],'String',"�cart type : " + string( ecart_y1 ),'FitBoxToText','on');
    end
end    