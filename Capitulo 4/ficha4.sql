/*Exercicio 1*/
/*A*/
SELECT cliente.nome AS CLIENTE_NOME,
       TRUNC(MONTHS_BETWEEN(SYSDATE, data_nasc)/12)  AS IDADE
FROM cliente;

/*B*/
SELECT cliente.nome AS CLIENTE_NOME,
       NVL(TRUNC(MONTHS_BETWEEN(SYSDATE, data_nasc)/12),-1)  AS IDADE
FROM cliente;

/*C*/
CREATE OR REPLACE FUNCTION AGE(date1 IN DATE, date2 IN DATE)
RETURN NUMBER
IS
    age NUMBER;
BEGIN
    age :=TRUNC(MONTHS_BETWEEN(date1, date2)/12);
    RETURN age;
END AGE;


/*D*/
SELECT COUNT(*) AS TOTAL_COMPRAS_40
FROM cliente
WHERE AGE(SYSDATE, cliente.data_nasc)> 40;

/*E*/
SELECT loja.nome AS NOME_LOJA,
       AGE(SYSDATE, data_abertura) AS IDADE_LOJA
FROM loja
WHERE AGE(SYSDATE, data_abertura) > 25;

/*Exercicio 2*/
/*A*/
SELECT  venda.id AS VENDA_ID,
        SUM((linha_venda.preco_unit_venda * linha_venda.unidades)) AS TOTAL_PAGO
FROM venda
    JOIN linha_venda ON venda.id = linha_venda.venda_id
GROUP BY venda.id;

/*B*/
CREATE OR REPLACE FUNCTION COST(vendaID INT) 
RETURN DECIMAL
IS
   total DECIMAL;
BEGIN
  SELECT COALESCE(SUM(preco_unit_venda), -1) INTO total
  FROM LINHA_VENDA
  JOIN venda ON linha_venda.venda_id = venda.id
  WHERE venda.id = vendaID;

  RETURN total;
END;


SELECT
  id AS venda_id,
  COST(id) AS total_pago
FROM venda
ORDER BY 2 DESC;

/*C*/