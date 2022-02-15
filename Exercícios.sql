desc atendime;
desc paciente;
desc convenio;
desc cidade;
desc prestador;
desc aviso_cirurgia; 

--) Fazer uma pesquisa que retorne o código de atendimento e a data de atendimento e a data de alta. 
--Tabelas: atendime. 

select CD_ATENDIMENTO , DT_ATENDIMENTO, DT_ALTA
from atendime;


--Fazer um Select que traga o código de atendimento, nome do paciente, nome do 
--convênio e somente dos atendimentos do 02/05/2016. 
--Tabelas: atendime, paciente e convenio. 

select ATENDIME.CD_ATENDIMENTO, PACIENTE.NM_PACIENTE , CONVENIO.NM_CONVENIO
FROM ATENDIME, PACIENTE, CONVENIO
WHERE atendime.cd_paciente = paciente.cd_paciente
AND atendime.cd_convenio = convenio.cd_convenio
AND atendime.dt_atendimento = '02/05/2016';

-- Criar uma pesquisa que informe o nome do paciente, o código do paciente, o nome da cidade da cidade 
--em que o paciente reside, e o código de atendimento do paciente. 
--Tabelas: atendime, cidade e paciente

select paciente.nm_paciente, paciente.cd_paciente, cidade.nm_cidade, atendime.cd_atendimento
from atendime, paciente , cidade
WHERE atendime.cd_paciente = paciente.cd_paciente;

-- Fazer um Select dos pacientes internados durante o mês de agosto de 2016, com idade 
--maior ou igual a 50 anos. Dica: o resultado terá 20 retornos (linhas). 

select atendime.cd_atendimento, atendime.tp_atendimento,paciente.dt_nascimento, atendime.dt_atendimento , paciente.nm_paciente, paciente.cd_paciente
from atendime , paciente
where atendime.cd_paciente = paciente.cd_paciente 
and atendime.tp_atendimento = 'I'
and atendime.dt_atendimento BETWEEN To_Date('01/08/2016', 'DD/MM/YYYY')
                                AND To_Date('31/08/2016', 'DD/MM/YYYY')
AND Trunc((SYSDATE - paciente.dt_nascimento)/365) >= 50;

--Total de atendimento do mês de janeiro de 2018, separados por tipo de atendimento

select tp_atendimento ,count(atendime.tp_atendimento) 
from atendime 
where dt_atendimento BETWEEN To_Date('01/01/2018', 'DD/MM/YYYY')
                         AND To_Date('31/01/2018', 'DD/MM/YYYY')
GROUP BY  tp_atendimento;

SELECT atendime.tp_atendimento
, Count(atendime.cd_atendimento) nro_de_atendimentos
FROM atendime
WHERE To_Char(atendime.dt_atendimento, 'mm/yyyy') = '01/2018'
GROUP BY atendime.tp_atendimento;

--Prestador com mais cirurgias em 2017. 
--Tabelas: atendime, aviso_cirurgia e prestador. 

SELECT nm_prestador
, nro_de_cirurgias
from
      (
      SELECT prestador.nm_prestador
      , Count(*) nro_de_cirurgias
      FROM atendime
      , aviso_cirurgia 
      , prestador
      where atendime.cd_atendimento = aviso_cirurgia.cd_atendimento 
      AND prestador.cd_prestador = atendime.cd_prestador
      AND To_Char(atendime.dt_atendimento, 'yyyy') = '2017'
      GROUP BY prestador.nm_prestador
      ORDER BY 2 desc
      )
WHERE ROWNUM <= 1;  -- pega a primeira linha 

-- retornar as 10 cirurgias mais realizadas em 2017

SELECT ds_cirurgia
, NRO_CIRURGIAS
FROM (
    SELECT CIRURGIA.ds_cirurgia
    , Count(*) NRO_CIRURGIAS
    FROM AVISO_CIRURGIA
    , CIRURGIA_AVISO
    , CIRURGIA
    WHERE CIRURGIA.CD_CIRURGIA = CIRURGIA_AVISO.CD_CIRURGIA
    AND  AVISO_CIRURGIA.cd_aviso_cirurgia =  CIRURGIA_AVISO.cd_aviso_cirurgia
    AND  To_Char(AVISO_CIRURGIA.dt_realizacao, 'yyyy') = '2017'
    AND  AVISO_CIRURGIA.dt_realizacao IS NOT NULL
    GROUP BY CIRURGIA.ds_cirurgia
    ORDER BY Count(*) DESC          
     )
WHERE ROWNUM <= 10;


