%Implemetance GameOfLife
%bunka-max 8 sousedi
% 2-3 zije
% <2 umre
% 3 ozije
%4 zemre
%bunka obsahuje 1-zije
%bunka obsahuje 0-nezije

%pocet max radku
%pocet max sloupcu
N=100;
%max cas
T=1000;
% vychozi prazdna matice s max n
M = zeros(N,N);
%nastaveni pocatecniho stavu M- Seminko

%R-Pentomino
%S=[0 0 0 0 0;0 0 1 1 0;0 0 1 1 0;0 0 1 0 0; 0 1 0 0 0];
%die hard
%S=[0 0 0 0 0 0 1 0;1 1 0 0 0 0 0 0;0 1 0 0 0 1 1 1];
%S=[0 0 1;1 0 1;0 1 1;0 1 0];
%glider
%S=[1 1 0; 0 1 1;1 0 0];
%toad
%S=[0 1 1 1 0;0 0 1 1 1];
%acorn
S=[0 1 0 0 0 0 0; 0 0 0 1 0 0 0;1 1 0 0 1 1 1];
%S=[0 0 1 1 1;1 1 1 0 0];
%S=[1 1];
Mr=50;%radek M
Mc=50;%sloupec M
%velikost matice S
[Sr,Sc]=size(S);
%na dane souradnice M dosadi hodnoty matice S
M(Mr:Mr+Sr-1, Mc:Mc+Sc-1)=S;
%zobrazim matici do grafu
plot=pcolor(M);
colormap(gray(2))
%odstrani gridlines
shading flat
gText = sprintf("generace: "+0);
coor = [0.1 0.1 0.1 0.1]; % souradnice gText ve Figure
ha = annotation('textbox',coor,'string',gText);
ha.HorizontalAlignment = 'center';
ha.BackgroundColor = [1 1 1]; % barva

drawnow();
pause(3)
%projde matici po bunkach
%ziska jejich okoli
%spocita jejich hodnoty
%provede pravidla hry
%zobrazi matici aktualizovanou po kazkem case

%prochazi cas po jednotlivych generacich
for g=1 : T
    %projde matici po jednotlivych sloupcich a radcich
    %okraje matice M nechava prazdne- N-1
    %docasna matice pro ulozeni zmen v dane generaci
    tempM=M;
    for r=2:N-1
        for c =2:N-1
            %aktualni bunka
            cell=M(r,c);
            %neighbours
            ng= M(r-1,c-1)+M(r-1,c)+M(r-1,c+1)+M(r,c-1)+M(r,c+1)+M(r+1,c-1)+M(r+1,c)+M(r+1,c+1);
            %pravidla
            if cell==1
                if ng==2 || ng==3
                    tempM(r,c)=1;
                elseif ng<2
                    tempM(r,c)=0;
                elseif ng>3
                    tempM(r,c)=0;
                end
            elseif cell==0
                if ng==3
                    tempM(r,c)=1;
                end
            end



        end
        
    end           
    %aktualizuje M o novou generaci
     M=tempM;
%aktualizuje plot o novou generaci
set(plot,'CData',M)   
%text zaznamenavajici index aktualni generace
gText = sprintf("generace: "+g);
coo = [0.1 0.1 0.1 0.1]; 
ha = annotation('textbox',coo,'string',gText);
ha.HorizontalAlignment = 'center';
ha.BackgroundColor = [1 1 1]; 
drawnow();
pause(0.1);
end