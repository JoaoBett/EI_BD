/*Exercicio 1*/
SELECT nome 
FROM concelho
WHERE distrito_id = 10;

/*Exercicio 2*/
SELECT UPPER(nome) AS produtos_entre_15_20
FROM produto
WHERE preco_unit_atual > 15 AND preco_unit_atual < 20
ORDER BY nome ASC;

/*Exercicio 3*/
SELECT id AS ID,
       TO_CHAR(data, 'Mon-YYYY, DD') AS DATA
FROM linha_venda
WHERE desconto_unit_euros IS NULL;

/*Exercicio 4*/
SELECT  produto_id AS produto_id,
        desconto_unit_euros AS desconto_julho
FROM linha_venda
WHERE TO_CHAR(data, 'MM') = '07' AND desconto_unit_euros IS NOT NULL;

/*Exercicio 5*/
SELECT  produto.nome AS NOME,
        produto.preco_unit_atual AS PRECO_SEM_IVA,
        produto.preco_unit_atual + (produto.iva * produto.preco_unit_atual/100) AS PRECO_COM_IVA,
        produto.iva * produto.preco_unit_atual/100 AS IVA_A_PAGAR
FROM produto
    JOIN categoria ON produto.categoria_id = categoria.id
WHERE produto.preco_unit_atual < 200 AND categoria.id = 6;

/*Exercicio 6*/
SELECT ROUND(MONTHS_BETWEEN(SYSDATE, data_abertura)/12,0) AS ANOS,
       MOD((MONTHS_BETWEEN(SYSDATE, data_abertura)/12,0))) AS MESES
FROM loja
WHERE nome = 'online';

SELECT 
  ROUND((MONTHS_BETWEEN(SYSDATE, data_abertura) / 12),0) AS ANOS,
  ROUND(MOD(MONTHS_BETWEEN(SYSDATE, data_abertura), 12),0) AS MESES
FROM loja
WHERE nome = 'online';

/*Exercicio 7*/

/*Exercicio 8*/
SELECT venda.id AS ID,
       TO_CHAR(data, 'Mon-YYYY, DD') AS DIA_DA_VENDA
FROM venda
WHERE TO_CHAR(data, 'MM') = '08';