--Criando função media ponderada

CREATE OR REPLACE FUNCTION FN_mediaPond( nota1 in number,
                                         peso1 in number,
                                         nota2 in number, 
                                         peso2 in number)                             
return number

is 
media_pond number;

BEGIN
    media_pond:= (nota1*peso1+nota2*peso2)/(peso1+peso2);
    return media_pond;
END;

--retornando valor da função 
select ROUND(FN_mediaPond(5,5,10,1)) from sys.dual;


--CRIANDO FUNÇÃO QUE RETORNA NOME
CREATE OR REPLACE FUNCTION fnNome(p_id in number)
    return varchar IS
    v_nome varchar(20);
Begin
    SELECT a.FIRST_NAME
    INTO v_nome
    FROM hr.EMPLOYEES a 
    WHERE a.EMPLOYEE_ID = p_id;
    
    return v_nome;
end;

--chamadno a função nome
select fnNome(101) From dual;


CREATE OR REPLACE FUNCTION fnAumento(p_pct in number, p_id_func in number)
    RETURN NUMBER IS
    v_Sal_novo number(20);
BEGIN
    select ((a.salary/100)*p_pct) + a.salary
    into v_Sal_novo
    From hr.employees a
    where a.employee_id = p_id_func;
    
    return v_sal_novo;
end;

--testando a função
SELECT a.first_name , a.salary sal_antigo, fnAumento(10,a.employee_id) sal_novo
FROM hr.employees a;