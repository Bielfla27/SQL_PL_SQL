SET SERVEROUTPUT ON 
DECLARE 
    v1 NUMBER(11,2) := 500;
    v2 NUMBER(11,2) := 400; 
    vMedia NUMBER(11,2);
BEGIN
    vMedia := (v1 + v2 ) / 2; 
    DBMS_OUTPUT.PUT_LINE('Media = ' || vMedia);
end;
