function z = find_objects(broj_crv, broj_pla, cm_crvene, cm_plave)
    q1_tren=get_param('main/q1_tren', 'RuntimeObject');
    q2_tren=get_param('main/q2_tren', 'RuntimeObject');
    q3_tren=get_param('main/q3_tren', 'RuntimeObject');
    %q1 sa 2 na 3
    for i=1:broj_crv
        x=cm_crvene(i).xos;
        y=cm_crvene(i).yos;

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
            pause(0.3);
        end;
        set_param('main/q3','Value',num2str(q3));
        pause(0.2);
        set_param('main/q2','Value',num2str(q2));

        q2_reg = q2-q2_tren.InputPort(1).Data;
        q3_reg = q3-q3_tren.InputPort(1).Data;

        while (abs(q2_reg)>2) || (abs(q3_reg)>3)
            pause(0.5);
            q2_reg = q2-q2_tren.InputPort(1).Data;
            q3_reg = q3-q3_tren.InputPort(1).Data;
        end;

        q1=0.3;
        set_param('main/q1','Value',num2str(q1));
        q1_reg= q1-q1_tren.InputPort(1).Data;

        while abs(q1_reg)>0.2
            pause(0.5);
            q1_reg = q1-q1_tren.InputPort(1).Data;
        end;

        q1 = 3;
        set_param('main/q1','Value',num2str(q1));
        q1_reg = q1-q1_tren.InputPort(1).Data;
        while abs(q1_reg)>0.2
            pause(0.5);
            q1_reg = q1-q1_tren.InputPort(1).Data;
        end;

        %OVO JE  SPREMNIK CRVENIH
        q2 = 310;
        q3 = 100;
        set_param('main/q2','Value',num2str(q2));
        set_param('main/q3','Value',num2str(q3));

        while (abs(q2_reg)>2) || (abs(q3_reg)>3)
            pause(0.5);
            q2_reg = q2-q2_tren.InputPort(1).Data;
            q3_reg = q3-q3_tren.InputPort(1).Data;
        end;
        q1 = 0.3;
        set_param('main/q1','Value',num2str(q1));
        while abs(q1_reg)>0.2
            pause(0.5);
            q1_reg = q1-q1_tren.InputPort(1).Data;
        end;
        pause(1);
        q1 = 3;
        set_param('main/q1','Value',num2str(q1));
        while abs(q1_reg)>0.2
            pause(0.5);
            q1_reg = q1-q1_tren.InputPort(1).Data;
        end;

    end;


    for i=1:broj_pla
        x=cm_plave(i).xos;
        y=cm_plave(i).yos;
        
        udaljenost=sqrt(x^2+y^2);
        if (udaljenost>22.4)
            x=18.3;
            y=sign(y)*12.9;
        end;


        [q2_inv, q3_inv] = inverse(x,y);

        q2_trenutacni=q2_tren.InputPort(1).Data;
        q3_trenutacni=q3_tren.InputPort(1).Data;

        [q2, q3] = decision(q2_trenutacni, q3_trenutacni, q2_inv, q3_inv, 0);

        set_param('main/q2','Value',num2str(q2));
        set_param('main/q3','Value',num2str(q3));


        q2_reg = q2-q2_tren.InputPort(1).Data;
        q3_reg = q3-q3_tren.InputPort(1).Data;

        while (abs(q2_reg)>2) || (abs(q3_reg)>3)
            pause(0.5);
            q2_reg = q2-q2_tren.InputPort(1).Data;
            q3_reg = q3-q3_tren.InputPort(1).Data;
        end;

        q1=0.3;
        set_param('main/q1','Value',num2str(q1));
        q1_reg= q1-q1_tren.InputPort(1).Data;

        while abs(q1_reg)>0.2
            pause(0.5);
            q1_reg = q1-q1_tren.InputPort(1).Data;
        end;

        q1 = 3;
        set_param('main/q1','Value',num2str(q1));
        q1_reg = q1-q1_tren.InputPort(1).Data;
        while abs(q1_reg)>0.2
            pause(0.5);
            q1_reg = q1-q1_tren.InputPort(1).Data;
        end;

        %OVO JE SPREMNIK PLAVIH
        q2 = 50;
        q3 = 250;
        set_param('main/q2','Value',num2str(q2));
        set_param('main/q3','Value',num2str(q3));

        while (abs(q2_reg)>2) || (abs(q3_reg)>3)
            pause(0.5);
            q2_reg = q2-q2_tren.InputPort(1).Data;
            q3_reg = q3-q3_tren.InputPort(1).Data;
        end;
        q1 = 0.3;
        set_param('main/q1','Value',num2str(q1));
        while abs(q1_reg)>0.2
            pause(0.5);
            q1_reg = q1-q1_tren.InputPort(1).Data;
        end;
        pause(1);
        q1 = 3;
        set_param('main/q1','Value',num2str(q1));
        while abs(q1_reg)>0.2
            pause(0.5);
            q1_reg = q1-q1_tren.InputPort(1).Data;
        end;
    end;
end

    
    
    