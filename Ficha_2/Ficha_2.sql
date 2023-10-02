
/*Exercicio 1*/
SELECT nome, preco_unit_atual
FROM produto
WHERE preco_unit_atual > 9.99
ORDER BY preco_unit_atual ASC;

/*Exercicio 2*/
SELECT nome, id
FROM produto
WHERE marca IS NULL;

/*Exercicio 3*/
SELECT nome || '(' || marca || ')'  as PRODUTOS_COM_MARCA
FROM produto
WHERE marca IS NOT NULL;

/*Exercicio 4*/
SELECT nome as CATEGORIA_1
FROM categoria
WHERE categoria_pai_id = 1 OR id = 1
ORDER BY id ASC;

/*Exercicio 5*/
SELECT nome, preco_unit_atual AS preco_sem_iva, preco_unit_atual * iva /100 + preco_unit_atual AS preco_com_iva
FROM produto
WHERE categoria_id = 6 OR categoria_id = 20
ORDER BY preco_unit_atual ASC;

/*Exercicio 6*/
SELECT nome || '-' || '>' || preco_unit_atual || '�' AS produto_preco, marca 
FROM produto
WHERE marca != 'QINGSTON' or marca IS NULL;

/*Exercicio 7*/
SELECT cod ,TO_CHAR(data_abertura,'YYYY')
FROM loja
ORDER BY data_abertura DESC;

/*Exercicio 8*/
SELECT UPPER(nome), ROUND(preco_unit_atual,1) as preco_arredondado
FROM produto
WHERE categoria_id = 7 or categoria_id = 18
ORDER BY preco_unit_atual ASC;

/*Exercicio 9*/
/*A*/
SELECT id, LOWER(nome), categoria_pai_id AS cat_pai
FROM categoria
ORDER BY id ASC;

/*B*/
SELECT id,lower(nome),
CASE WHEN to_char(categoria_pai_id) IS NULL THEN 'n\a' ELSE to_char(categoria_pai_id) END
FROM categoria;

/*Exercicio 10*/
SELECT cod, TO_CHAR(data_abertura,'YYYY')
FROM loja
WHERE TO_CHAR(data_abertura,'YYYY') > 1999 AND nome != 'online';

/*Exercicio 11*/
SELECT nome, preco_unit_atual, round(preco_unit_atual * iva/100,2) as valor_do_iva_por_unidade
FROM produto
WHERE nome LIKE '%ma%'
ORDER BY preco_unit_atual ASC;


/*Exercicio 12*/
/*A*/
SELECT nome, TRUNC(SYSDATE - data_abertura) as dias_vida
from loja
WHERE nome LIKE '%Contente%';

/*B*/
SELECT nome, TRUNC(MONTHS_BETWEEN(SYSDATE,data_abertura)) as meses_vida
from loja
WHERE nome LIKE '%Contente%';

/*C*/
SELECT nome, TRUNC(MONTHS_BETWEEN(SYSDATE,data_abertura) / 12) as meses_vida
from loja
WHERE nome LIKE '%Contente%';

/*Exercicio 13*/
SELECT venda_id, id, produto_id, (preco_unit_venda - COALESCE(desconto_unit_euros, 0)) * unidades AS valor_pago
FROM linha_venda
WHERE venda_id = 1459;

/*Exercicio 14*/
SELECT id, nome, iva, 
    CASE
        WHEN iva < 12 THEN 'reduzida'
        WHEN iva = 12 THEN 'intermedia'
        WHEN iva = 23 THEN 'normal'
        ELSE 'outro'
    END AS TAXA_IVA
FROM produto
WHERE preco_unit_atual < 15
ORDER BY iva ASC;