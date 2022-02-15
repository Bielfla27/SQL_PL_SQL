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