function[ ]=affichagepartie3(t , x_anal , Teq, x1, T, Yeq1, y1,ecart_T,ecart_y1,p)
    if(t==1)
        %affichage le résultat trouvé de Température T
        figure;
        plot( x_anal , Teq);
        hold on  
        scatter( x1, T,'filled' );
        legend('Tcal','Texp');
        xlabel(' x1');ylabel("Température ( en K) ");
        title("Comparaison entre la température expérimentale et la température calculée pour P="+string(p)+"mmHg");
        annotation('textbox',[.2 .5 .3 .3],'String',"Écart type : " + string(ecart_T ),'FitBoxToText','on');
    elseif(t==2)
        %affichage le résultat trouvé de fraction molaire y1
        figure;
        plot( x_anal , Yeq1);
        hold on  
        scatter( x1, y1,'filled' );
        legend('courbe analytic','valeurs expérimentaux');
        xlabel(' x1');ylabel(" y1 ");
        title("comparaison entre la composition molaire expérimentale et calculée pour P="+string(p)+"mmHg");
        annotation('textbox',[.2 .5 .3 .3],'String',"Écart type : " + string( ecart_y1 ),'FitBoxToText','on');
    end
end    