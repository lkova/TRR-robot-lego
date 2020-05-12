function z = flash(broj_crv, broj_pla, cm_crvene, cm_plave)
    q1_tren=get_param('main/q1_tren', 'RuntimeObject');
    q2_tren=get_param('main/q2_tren', 'RuntimeObject');
    q3_tren=get_param('main/q3_tren', 'RuntimeObject');

    spremnik_pla_q2=50;
    spremnik_pla_q3=250;

    spremnik_crv_q2=310;
    spremnik_crv_q3=100;

    brojac_pla=0;
    brojac_crv=0;

    stop_time=1.5;
    rezolucija=0.01;
    referenca=100;

    [cm_crvene, cm_plave] = sorting (broj_pla, broj_crv, cm_crvene, cm_plave);




    for i=1:(broj_crv+broj_pla)

        if ((broj_pla~=0) && ((mod(i,2))==1) && (brojac_pla<broj_pla)) || (broj_crv==0) || (brojac_crv>=broj_crv)

                brojac_pla=brojac_pla+1;

                x=cm_plave(brojac_pla).xos;
                y=cm_plave(brojac_pla).yos;

                %prilagodjenje za kutne tocke
                udaljenost=sqrt(x^2+y^2);
                if (udaljenost>22.4)
                    x=18.3;
                    y=sign(y)*12.9;
                end;

                [q2_inv, q3_inv] = inverse(x,y);

                q2_trenutacni=q2_tren.InputPort(1).Data;
                q3_trenutacni=q3_tren.InputPort(1).Data;

                [q2, q3] = decision(q2_trenutacni, q3_trenutacni, q2_inv, q3_inv, 0);

                %do plavog predmeta

                if (i==1)
                    set_param('main/q2','Value',num2str(320));
                    pause(0.1);
                end;

                set_param('main/q3','Value',num2str(q3));
                pause(0.2);
                set_param('main/q2','Value',num2str(q2));


                %set_param('main/q2','Value',num2str(q2));
                %set_param('main/q3','Value',num2str(q3));
                q2_reg = q2-q2_tren.InputPort(1).Data;
                q3_reg = q3-q3_tren.InputPort(1).Data;

                %velike promjene
                while (abs(q2_reg)>2) || (abs(q3_reg)>3)
                    pause(rezolucija);
                    q2_reg = q2-q2_tren.InputPort(1).Data;
                    q3_reg = q3-q3_tren.InputPort(1).Data;
                    if (abs(q2_reg) + abs(q3_reg)<referenca)
                        set_param('main/q1','Value',num2str(1));
                    %elseif (abs(q2_reg)<10) && (abs(q3_reg)<20)
                     %   set_param('main/q1','Value',num2str(0.7));    
                    end;
                end;
                set_param('main/q1','Value',num2str(1));

                %q1_reg= q1-q1_tren.InputPort(1).Data;

                pause(0.2);

                %vjerojatno treba maknuti
                %while abs(q1_reg)>0.2
                 %   pause(0.1);
                  %  q1_reg = q1-q1_tren.InputPort(1).Data;
                %end;

                % dizanje alata s predmetom
                q1 = 3;
                set_param('main/q1','Value',num2str(q1));
                pause(0.2);
                %q1_reg = q1-q1_tren.InputPort(1).Data;
                %while abs(q1_reg)>0.2
                 %   pause(0.1);
                  %  q1_reg = q1-q1_tren.InputPort(1).Data;
                %end;

                %U SPREMNIK PLAVIH
                set_param('main/q2','Value',num2str(spremnik_pla_q2));
                set_param('main/q3','Value',num2str(spremnik_pla_q3));

                while (abs(q2_reg)>2) || (abs(q3_reg)>3)
                    pause(rezolucija);
                    q2_reg = q2-q2_tren.InputPort(1).Data;
                    q3_reg = q3-q3_tren.InputPort(1).Data;
                    if (abs(q2_reg) + abs(q3_reg)<referenca)
                        set_param('main/q1','Value',num2str(1));
                   % elseif (abs(q2_reg)<10) && (abs(q3_reg)<20)
                    %    set_param('main/q1','Value',num2str(0.7));    
                    end;    
                end;

                set_param('main/q1','Value',num2str(1));
                %pause(0.1);

                %vjerojatno treba maknuti
                %while abs(q1_reg)>0.2
                 %   pause(0.1);
                  %  q1_reg = q1-q1_tren.InputPort(1).Data;
                %end;

                %predmet u spremniku plavih
                pause(stop_time);

                q1 = 3;
                q1_reg= q1-q1_tren.InputPort(1).Data;
                set_param('main/q1','Value',num2str(q1));
                while abs(q1_reg)>0.2
                    pause(0.1);
                    q1_reg = q1-q1_tren.InputPort(1).Data;
                end;

        else 

            brojac_crv=brojac_crv+1;

            x=cm_crvene(brojac_crv).xos;
            y=cm_crvene(brojac_crv).yos;

            %prilagodjenje za kutne tocke
            udaljenost=sqrt(x^2+y^2);
            if (udaljenost>22.4)
                x=18.3;
                y=sign(y)*12.9;
            end;

            [q2_inv, q3_inv] = inverse(x,y);

            q2_trenutacni=q2_tren.InputPort(1).Data;
            q3_trenutacni=q3_tren.InputPort(1).Data;

            [q2, q3] = decision(q2_trenutacni, q3_trenutacni, q2_inv, q3_inv, 0);

            if (i==1)
                    set_param('main/q2','Value',num2str(320));
                    pause(0.1);
                end;

                set_param('main/q3','Value',num2str(q3));
                pause(0.2);
                set_param('main/q2','Value',num2str(q2));


                %set_param('main/q2','Value',num2str(q2));
                %set_param('main/q3','Value',num2str(q3));
                q2_reg = q2-q2_tren.InputPort(1).Data;
                q3_reg = q3-q3_tren.InputPort(1).Data;

                %velike promjene
                while (abs(q2_reg)>2) || (abs(q3_reg)>3)
                    pause(rezolucija);
                    q2_reg = q2-q2_tren.InputPort(1).Data;
                    q3_reg = q3-q3_tren.InputPort(1).Data;
                    if (abs(q2_reg) + abs(q3_reg)<referenca)
                        set_param('main/q1','Value',num2str(1));
                    %elseif (abs(q2_reg)<10) && (abs(q3_reg)<20)
                     %   set_param('main/q1','Value',num2str(0.7));    
                    end;
                end;

                set_param('main/q1','Value',num2str(1));

                %q1_reg= q1-q1_tren.InputPort(1).Data;

                pause(0.2);

                %vjerojatno treba maknuti
                %while abs(q1_reg)>0.2
                 %   pause(0.1);
                  %  q1_reg = q1-q1_tren.InputPort(1).Data;
                %end;

                % dizanje alata s predmetom
                q1 = 3;
                set_param('main/q1','Value',num2str(q1));
                pause(0.2);
                %q1_reg = q1-q1_tren.InputPort(1).Data;
                %while abs(q1_reg)>0.2
                 %   pause(0.1);
                  %  q1_reg = q1-q1_tren.InputPort(1).Data;
                %end;

                %U SPREMNIK crvenih
                set_param('main/q2','Value',num2str(spremnik_crv_q2));
                set_param('main/q3','Value',num2str(spremnik_crv_q3));

                while (abs(q2_reg)>2) || (abs(q3_reg)>3)
                    pause(rezolucija);
                    q2_reg = q2-q2_tren.InputPort(1).Data;
                    q3_reg = q3-q3_tren.InputPort(1).Data;
                    if (abs(q2_reg) + abs(q3_reg)<referenca-20)
                        set_param('main/q1','Value',num2str(1));
                   % elseif (abs(q2_reg)<10) && (abs(q3_reg)<20)
                    %    set_param('main/q1','Value',num2str(0.7));    
                    end;    
                end;

                set_param('main/q1','Value',num2str(1));
                %pause(0.1);

                %vjerojatno treba maknuti
                %while abs(q1_reg)>0.2
                 %   pause(0.1);
                  %  q1_reg = q1-q1_tren.InputPort(1).Data;
                %end;

                %predmet u spremniku crvenih
                pause(stop_time);

                q1 = 3;
                q1_reg= q1-q1_tren.InputPort(1).Data;
                set_param('main/q1','Value',num2str(q1));
                while abs(q1_reg)>0.2
                    pause(0.1);
                    q1_reg = q1-q1_tren.InputPort(1).Data;
                end;

        end;
        display('gotov');
    end
end




    
    
    