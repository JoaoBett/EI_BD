/*Exercicio 1*/
SELECT LOWER(concelho.nome)
FROM concelho
WHERE concelho.distrito_id = 10;

/*Exercicio 2*/
SELECT linha_venda.venda_id AS id_da_venda,
       linha_venda.preco_unit_venda AS PRECO_UNIT_VENDA
FROM linha_venda
WHERE linha_venda.produto_id = 1060;

/*Exercicio 3*/
SELECT produto.nome AS NOME,
       produto.marca AS MARCA,
       produto.preco_unit_atual AS PRECO_UNIT_ATUAL
FROM produto
WHERE produto.categoria_id IN (3, 7) AND preco_unit_atual > 1.5
ORDER BY produto.preco_unit_atual;
