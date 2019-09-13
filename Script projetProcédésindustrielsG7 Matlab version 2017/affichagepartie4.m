function[ ]=affichagepartie4(t,x_anal ,Yeq1, Teq,p)
    if(t==1)
        figure;
        plot( x_anal , Teq);
        hold on  
        plot(Yeq1,Teq);
       legend('courbe de bulle','courbe de rosée');
        xlabel('x1,y1'); 
        ylabel("T en k ");
        title("Diagramme Binaire pour P="+string(p)+"mmHg");
    elseif(t==2)
        figure;
        plot( x_anal , x_anal);
        hold on  
        plot(x_anal,Yeq1);
        legend('x1','y1 cal');
        xlabel('x1');ylabel("y1");
        title("Positionnement de l'azeotrope pour P="+string(p)+"mmHg");
    end      
end    