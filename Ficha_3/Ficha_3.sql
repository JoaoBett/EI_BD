/*Exercicio 1*/
/*A*/
SELECT nome as produto_nome, categoria_id as produto_cat_id
FROM produto
WHERE iva = 23
ORDER BY nome ASC;

/*B*/
SELECT  produto.nome as produto_nome,
        produto.categoria_id as produto_cat_id,
        produto.categoria_id as categoria_id,
        categoria.nome as categoria_nome
FROM produto
    JOIN categoria ON produto.categoria_id = categoria.id
WHERE produto.iva = 23
ORDER BY produto.nome ASC;

/*Exercicio 2*/
/*A*/
SELECT id as loja_id, nome as loja_nome, concelho_id as loja_concelho_id
FROM loja
WHERE nome = 'online';

/*B*/
SELECT  loja.id as loja_id,
        loja.nome as loja_nome, 
        loja.concelho_id as loja_concelho_id,
        concelho.nome as concelho_nome
FROM loja
    JOIN concelho ON loja.concelho_id = concelho.id
WHERE loja.nome = 'online';

/*C*/
SELECT  loja.id as loja_id,
        loja.nome as loja_nome, 
        loja.concelho_id as loja_concelho_id,
        concelho.nome as concelho_nome,
        distrito.nome as distrito_nome
FROM loja
    JOIN concelho ON loja.concelho_id = concelho.id
    JOIN distrito ON concelho.distrito_id = distrito.id
WHERE loja.nome = 'online';

/*Exercicio 3*/
SELECT  produto.categoria_id as produto_id,
        produto.nome as produto_nome,
        categoria.nome as categoria_nome
FROM produto
        JOIN categoria ON produto.categoria_id = categoria.id
WHERE categoria.nome = 'PERIFÉRICOS' OR categoria.nome = 'ARMAZENAMENTO';

/*Exercicio 4*/

SELECT  venda.id as id,
        loja.nome as loja_nome,
        produto.id as produto_id,
        produto.nome as produto_nome,
        linha_venda.unidades as unidades
FROM venda
        JOIN loja ON venda.loja_id = loja.id
        JOIN linha_venda ON venda.id = linha_venda.venda_id
        JOIN produto ON linha_venda.produto_id = produto.id 
WHERE venda.data = '21.07.01' AND loja.nome = 'Modelo Eiras';

/*Exercicio 5*/
/*A*/
SELECT venda.id, to_char(data, 'YYYY/"June"')
FROM venda
WHERE to_char(data, 'YYYY.MM') = '2021.06';

/*B*/
SELECT venda.id, to_char(venda.data, 'YYYY/"June"'),linha_venda.produto_id
FROM venda
    JOIN linha_venda ON venda.id = linha_venda.venda_id
WHERE to_char(venda.data, 'YYYY.MM') = '2021.06';

/*C*/
SELECT venda.id, to_char(venda.data, 'YYYY/"June"'),linha_venda.produto_id
FROM venda
    LEFT JOIN linha_venda ON venda.id = linha_venda.venda_id
WHERE to_char(venda.data, 'YYYY.MM') = '2021.06';

/*Exercicio 6*/
SELECT  categoria.nome as catg_nome,
        produto.nome as prod_nome
FROM categoria
    JOIN produto ON categoria.categoria_pai_id = produto.categoria_id
WHERE categoria.id = 5 OR categoria.id = 7 OR categoria.id = 18;

/*Exercicio 7*/
/*A*/
SELECT concelho.nome as concelho_nome
FROM concelho;

/*B*/
SELECT concelho.nome as concelho_nome
FROM concelho
    JOIN loja ON concelho.id = loja.concelho_id
WHERE concelho.id = loja.concelho_id;

/*C*/
SELECT concelho.nome as concelho_nome
FROM concelho
MINUS
SELECT concelho.nome as concelho_nome
FROM concelho
    JOIN loja ON concelho.id = loja.concelho_id
WHERE concelho.id = loja.concelho_id;

/*Exercicio 8*/
SELECT produto.id as produto_id
FROM produto
    JOIN linha_venda ON produto.id = linha_venda.produto_id
WHERE linha_venda.data = '21.06.30' AND linha_venda.data = '21.07.01';

/*Exercicio 9*/
SELECT  CONCAT('[D]', UPPER(distrito.nome)) as regioes
FROM distrito
UNION
SELECT  CONCAT('[d]', LOWER(concelho.nome)) as regioes
FROM concelho; 