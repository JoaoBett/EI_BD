/*Exercicio 1*/
/*A*/
SELECT count(nome) as total_categorias
FROM categoria;

/*B*/
SELECT count(categoria_pai_id) as total_categoria_pai
FROM categoria
WHERE categoria_pai_id IS NOT NULL;

/*C*/
SELECT 
    COUNT() - SUM(CASE WHEN categoria_pai_id IS NULL THEN 1 ELSE 0 END) as TOTAL_CATEGORIAS_COM_PAI
FROM categoria;

/*D*/
SELECT 
    COUNT() - SUM(CASE WHEN categoria_pai_id IS NULL THEN 0 ELSE 1 END) as TOTAL_CATEGORIAS_COM_PAI
FROM categoria;

/*Exercicio 2*/
SELECT  COUNT(produto.iva) as total_produtos_iva23,
        AVG(produto.preco_unit_atual) as preco_medio
FROM 
    produto
WHERE 
    produto.iva = 23; 

/*Exercicio 3*/
SELECT (data_abertura) as primeira_venda
FROM loja;

/*Exercicio 4*/
/*B*/
SELECT  categoria.nome as categoria_nome,
        count(produto.categoria_id) as total_produtos
FROM categoria
        JOIN produto ON categoria.categoria_pai_id = produto.categoria_id;

/*Exercicio 5*/
/*A*/
SELECT TO_CHAR(data, 'YYYY-MM') AS Mês, COUNT() AS Total_Vendas
FROM venda
GROUP BY TO_CHAR(data, 'YYYY-MM')
ORDER BY TO_CHAR(data, 'YYYY-MM');

/*B*/
SELECT
  TO_CHAR(data, 'YYYY-MM') AS Mes,
  loja_id,
  COUNT() AS TotalVendas
FROM 
    venda
GROUP BY TO_CHAR(data, 'YYYY-MM'), loja_id
ORDER BY TO_CHAR(data, 'YYYY-MM'),loja_id;

/*Exercicio 6*/
SELECT  LOWER(concelho.nome) AS concelho_nome,
        COUNT(loja.id) AS total_lojas
FROM concelho
    JOIN loja ON concelho.id = loja.concelho_id
GROUP BY LOWER(concelho.nome);


/*Exercicio 7*/
/*A*/
SELECT  categoria.nome, 
        COUNT(produto.categoria_id) AS TotalProdutos
FROM produto 
    INNER JOIN categoria ON produto.categoria_id = categoria.id
GROUP BY categoria.nome
HAVING COUNT(produto.categoria_id) >= 2;

/*B*/
SELECT  categoria.nome,COUNT(produto.categoria_id), 
        MAX(produto.preco_unit_atual) AS PrecoMaisCaro
FROM produto 
    INNER JOIN categoria  ON produto.categoria_id = categoria.id
GROUP BY categoria.nome
HAVING MAX(produto.preco_unit_atual) < 20 AND COUNT(produto.categoria_id) >= 2;

/*Exercicio 8*/
SELECT venda.id AS venda_id,
       SUM(linha_venda.unidades) AS total_unidades,
       SUM(linha_venda.unidades * linha_venda.preco_unit_venda - linha_venda.desconto_unit_euros) AS total_pago
FROM venda
    JOIN linha_venda ON venda.id = linha_venda.venda_id
GROUP BY venda.id;

