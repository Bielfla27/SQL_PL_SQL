set SERVEROUTPUT ON 
ACCEPT v_nota_dig PROMPT 'Digite sua nota: '

declare 
    v_nota integer;
    begin
        v_nota := &v_nota_dig;
        
        case v_nota
             WHEN 10 THEN DBMS_OUTPUT.put_line('NOTA EXCELENTE');
             WHEN 9 THEN DBMS_OUTPUT.put_line('FOI BOA');
             WHEN 8 THEN DBMS_OUTPUT.put_line('DEU PRO GASTO');
             WHEN 7 THEN DBMS_OUTPUT.put_line('APUSU MAIS PASSOU');
             WHEN 6 THEN DBMS_OUTPUT.put_line('REPROVOU');
             ELSE DBMS_OUTPUT.put_line('SEM CLASSIFICAÇÃO');
        end case;
    end;