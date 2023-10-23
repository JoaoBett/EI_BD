/*Exercicio 1*/
SELECT  v.id AS VENDA_ID, 
        TO_CHAR(data, 'YYYY-MM-DD (Day)') AS DATA
FROM venda v
WHERE data > (SELECT MIN(data) FROM venda);

/*Exercicio 2*/
SELECT  v.id AS VENDA_ID, 
        TO_CHAR(data, 'YYYY-MM-DD (Day)') AS DATA
FROM venda v
WHERE data NOT IN (SELECT MIN(data) FROM venda)
AND data NOT IN (SELECT MAX(data) FROM venda);

/*Exercicio 3*/
SELECT lv.venda_id AS ID,
       TO_CHAR(lv.data, 'DD-MON-YYYY HH24:MI:SS') AS DATA,
       lv.desconto_unit_euros AS DESCONTO_UNIT_EUROS
FROM linha_venda lv
WHERE lv.desconto_unit_euros = (SELECT MAX(desconto_unit_euros) FROM linha_venda);

/*Exercicio 4*/
SELECT  lj.id AS ID,
        lj.cod AS COD,
        lj.nome AS NOME,
        lj.concelho_id as CONCELHO_ID,
        TO_CHAR(lj.data_abertura, 'DD-MON-YYYY HH24:MI:SS') AS DATA_ABERTURA
FROM loja lj
    FULL JOIN venda v ON lj.id = v.loja_id
WHERE v.loja_id IS NULL
ORDER BY v.loja_id ASC;


/*Exercicio 5*/
SELECT p.id AS PRODUTO_ID,
      p.nome AS PRODUTO_NOME,
      p.categoria_id AS CATEGORIA_ID
FROM produto p
WHERE (p.preco_unit_atual, p.categoria_id) IN (SELECT MIN(preco_unit_atual), categoria_id
                                              FROM produto 
                                              GROUP BY categoria_id)
ORDER BY p.categoria_id;

/*Exercicio 7*/
SELECT  p.id AS PRODUTO_ID,
        p.nome AS PRODUTO_NOME,
        p.preco_unit_atual AS PRECO_UNIT_ATUAL
FROM produto p
WHERE p.preco_unit_atual IN (SELECT produto.preco_unit_atual
                             FROM produto
                             ORDER BY produto.preco_unit_atual DESC
                             FETCH FIRST 3 ROWS ONLY);
                             
/*Exercicio 8*/
SELECT c.id, c.nome, agrupa.total
FROM categoria c
JOIN (
  SELECT categoria_id, COUNT(nome) AS total
  FROM PRODUTO
  GROUP BY categoria_id
) agrupa ON c.id = agrupa.categoria_id
ORDER BY agrupa.total DESC
FETCH FIRST 3 ROWS ONLY;

