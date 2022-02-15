set SERVEROUTPUT ON
declare 
--declarando as váriaveis 
viDfunc hr.employees.employee_id%TYPE;
vNome hr.employees.first_name%TYPE;
vSalary hr.employees.salary%TYPE;
--declaração de cursores
Cursor cs_salario_top_10 is 
    SELECT a.employee_id, a.first_name, a.salary
    from hr.employees a
    ORDER BY a.salary desc;
BEGIN
--Posso usar "IF NOT cs_top_10%ISOPEN THEN  para abrir o cursor somente se não estiver aberto
--abre o cursor 
open cs_salario_top_10;
FOR i IN 1..10 LOOP
    fetch cs_salario_top_10 into viDfunc, vNome, vSalary;
    --Pegando os dados pelo curso e inserindo nas variaves 
    DBMS_OUTPUT.PUT_LINE (i|| ' - ' ||viDfunc|| ' - ' || vNome|| ' - ' ||vSalary);
END LOOP;
close cs_salario_top_10;
end; 


DECLARE 
cursor cs_func(pMenor NUMBER, pMaior NUMBER) is
        SELECT a.EMPLOYEE_ID, a.FIRST_NAME, a.SALARY
        FROM HR.EMPLOYEES a 
        WHERE a.SALARY BETWEEN pMenor and pMaior
        ORDER BY a.SALARY desc; 
BEGIN
    DBMS_OUTPUT.PUT_LINE ('Funcionarios com média entre 1000 e 9999');
    for rFunc in cs_func(1000,9999) LOOP
        DBMS_OUTPUT.PUT_LINE (rFunc.EMPLOYEE_ID|| ' - ' ||rFunc.FIRST_NAME|| ' - ' ||rFunc.SALARY);
    END LOOP;
     DBMS_OUTPUT.PUT_LINE ('Funcionarios com média entre 10000 e 19999');
    for rFunc in cs_func(10000,19999) LOOP
        DBMS_OUTPUT.PUT_LINE (rFunc.EMPLOYEE_ID|| ' - ' ||rFunc.FIRST_NAME|| ' - ' ||rFunc.SALARY);
    END LOOP;
END;













