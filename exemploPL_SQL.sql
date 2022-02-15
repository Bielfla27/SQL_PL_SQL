SET SERVEROUTPUT ON
DECLARE 

v_tot_sal NUMBER(10,2);
v_depto NUMBER;
v_qtd int; 

BEGIN 
v_depto := 100;
select sum(A.salary) , count(*) qtd
    INTO v_tot_sal, v_qtd
    from hr.employees A WHERE a.department_id = v_depto;
    
    DBMS_OUTPUT.PUT_LINE('TOTAL DE SALARIO DEPTO '||v_depto|| ' É ' ||v_tot_sal);
    DBMS_OUTPUT.PUT_LINE('TOTAL DE COLABORADORES '||v_qtd);
    DBMS_OUTPUT.PUT_LINE('MEDIA DE SALARIO '||round(v_tot_sal/v_qtd,2));

end;