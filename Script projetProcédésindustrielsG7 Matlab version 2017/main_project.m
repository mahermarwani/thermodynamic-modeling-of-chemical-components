%% Projet Procédés industriels
%le démarche du travail est dans le console, veuillez le suivre
%
%

%% Initialisation
close all; clc

%% Load Data
x1=[0.071 0.11 0.14 0.174 0.223 0.259 0.301 0.365 0.448 0.504 0.528 0.581 0.65 0.704 0.751 0.79 0.856 0.922];
y1=[0.064 0.102 0.134 0.171 0.227 0.27 0.323 0.408 0.522 0.596 0.628 0.7 0.78 0.839 0.879 0.91 0.95 0.978];
T=[350.5 350.6 350.7 350.8 350.8 350.5 350.3 349.8 349 348.1 347.7 346.5 344.8 343.4 341.9 340.7 338.6 336.7];
p=760;
%Les parametres de léquation dAntoine
    A1=15.9732;B1=2696.79;C1=-46.16;
    A2=16.15;B2=2790.50;C2=-57.15;


%% ==================== Partie1 et Partie 2 ====================
affichagepartie1(1,x1,y1,T,p,A1,A2,B1,B2,C1,C2);pause;
%Minimisation de la fonction Objective
    %position initiale des paramétres ajustables
    t12_init=-1;t21_init=-1;alpha=0.3;
    %calcul de solution optimal en utilison fminsearch
    [taux,fval] = fminsearch( @(x)Objectif(x1,y1,T,p,x,alpha,A1,A2,B1,B2,C1,C2) , [t12_init,t21_init]);
    fprintf('aprés la Minimisation de la fonction Objective,en aboutie aux valeurs taux12 =%f et taux21=%f\n',taux(1),taux(2));
%calcule des gamma1,gamma2 et gme (expérimentaux et analytiques )  
    x_anal=linspace(0,1,100);    
    [gme , gamma1 , gamma2 ] = valeur_exp( x1,y1,T,p,A1,A2,B1,B2,C1,C2 );
    [ g , gamma1_anal , gamma2_anal ] = valeur_anal( x_anal,taux(1),taux(2),alpha);
%affichage des résultats obtenus
    fprintf('tapez entrer pour afficher les courbes aprés lajustement\n');
    fprintf('affichage de courbe de lenthalpie libre molaire dexcès aprés lajustement\n');
        affichagepartie2(1 , x_anal , x1 , g , gme , gamma1_anal , gamma1 , gamma2 ,gamma2_anal,p)
    fprintf('affichage de courbe de coefficients dactivités du Chloroforme aprés lajustement\n');
        affichagepartie2(2 , x_anal , x1 , g , gme , gamma1_anal , gamma1 , gamma2 ,gamma2_anal,p)
    fprintf('affichage de courbe de coefficients dactivités de lAcétate déthyle aprés lajustement\n');
        affichagepartie2(3 , x_anal , x1 , g , gme , gamma1_anal , gamma1 , gamma2 ,gamma2_anal,p)
pause; close all
%% ==================== Partie3 ====================
fprintf('Partie 3 : \n\n');
%calcul des température à partir des valeurs expérimentals
    [Teq,Yeq1]=calcul_T_y1(p,x1,taux,alpha,A1,A2,B1,B2,C1,C2 );
    
%calcul lécart type ( lerreur)
    ecart_T=(1/length(x1) )*norm(Teq-T,2);
    fprintf('lécart type entre T_exp et T_anal :'+string(  ecart_T ) +'\n' );
    ecart_y1=(1/length(x1) )*norm(y1-Yeq1,2);
    fprintf('lécart type entre y1_exp et y1_anal :'+string(  ecart_y1 ) +'\n' );
%affichage de résultat final
    [Teq,Yeq1]=calcul_T_y1(p,x_anal,taux,alpha,A1,A2,B1,B2,C1,C2 );
    fprintf('affichage de courbe de température aprés lajustement\n');
        affichagepartie3(1 , x_anal , Teq, x1, T, Yeq1, y1,ecart_T,ecart_y1,p);
    fprintf('affichage de courbe de fraction molaire y1 aprés lajustement\n');
        affichagepartie3(2 , x_anal , Teq, x1, T, Yeq1, y1,ecart_T,ecart_y1,p);
    pause;close all
fprintf('vous pouvez la valeur T et y1 à partir de x1 que vous pouvez lentrer ( voir code )\n \n');
%calcul des T et y1 à partir de valeur x1 donnée 
    %placer ce commentaire dans le console pour calculer T et y1 à partir
    %de x1 donner de votre part
    %calcul_T_y1_x_donnee(p,taux,alpha,A1,A2,B1,B2,C1,C2)
%% ==================== Partie4 ====================
fprintf('Partie 4 : \n');
%calcule du fraction molaire de lAzéotrope à pression 760mmHg  
    fprintf('calcule du fraction molaire de lAzéotrope à pression 760mmHg\n');
    [Teq,Yeq1]=calcul_T_y1(p,x_anal,taux,alpha,A1,A2,B1,B2,C1,C2);
    fprintf('affichage de Diagramme Binaire pour P='+string(p)+'mmHg\n');affichagepartie4(1,x_anal ,Yeq1, Teq,p);
    fprintf('affichage de courbe de x1 et y1 en fonction de x1\n');affichagepartie4(2,x_anal ,Yeq1, Teq,p);
    [x1_Aztp,T_Aztp]= Azeotrope(p,taux,alpha,A1,A2,B1,B2,C1,C2);
    fprintf('fraction molaire de lAzéotrope :%f=> température :%f en kelvin pour une pression :%fmmHg\n\n',x1_Aztp,T_Aztp,p);
    
%calcule du fraction molaire de lAzéotrope à pression 3800mmHg 
    pause;fprintf('calcule du fraction molaire de lAzéotrope à pression 3800mmHg\n');
    close all
    p=3800;
    [Teq,Yeq1]=calcul_T_y1(p,x_anal,taux,alpha,A1,A2,B1,B2,C1,C2);
    fprintf('affichage de Diagramme Binaire pour P='+string(p)+'mmHg\n');affichagepartie4(1,x_anal ,Yeq1, Teq,p);
    fprintf('affichage de courbe de x1 et y1 en fonction de x1\n');affichagepartie4(2,x_anal ,Yeq1, Teq,p);
    [x1_Aztp,T_Aztp]= Azeotrope(p,taux,alpha,A1,A2,B1,B2,C1,C2);
    fprintf('fraction molaire de lAzéotrope :%f=> température :%f en kelvin pour une pression :%fmmHg\n\n',x1_Aztp,T_Aztp,p);
%donner la pression que vous voulez sil existe 
fprintf('vous pouvez tester par un pression que vous pouvez lentrer ( voir code )\n\n');
%placer ce commentaire dans le console pour calculer la position dAzéotrope
%sil existe à partir dun changement de pression
    %calcul_azeo_pression_donnee(x_anal,taux,alpha,A1,A2,B1,B2,C1,C2)
fprintf('fin du projet\n');

    
