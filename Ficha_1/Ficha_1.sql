/*SELECT COL_NAME, COL2_NAME....
FROM TABLE_NAME
ORDER BY nome DESC;
*/

SELECT nome
FROM distrito
ORDER BY nome ASC;

SELECT nome
FROM distrito
ORDER BY nome DESC;

/*-----Exercicios----------*/
//Exercicio1/2
SELECT nome,marca
FROM produto
ORDER BY nome ASC;

//Exericicio3
SELECT *
FROM loja
ORDER BY data_abertura DESC;

//Exercicio4
SELECT nome, categoria_id, preco_unit_atual
FROM produto
ORDER BY preco_unit_atual DESC;

//Exercicio5
UPDATE marca
SET marca = 'KINGSTON'
WHERE marca = 'QINGSTON';

//Exercicio6
CREATE TABLE ratos(
    categoria_id int,
    nome varchar(255),
    marca varchar(255),
    preco_unit_atual varchar(255),
    iva int 
);

//Exercico7
INSERT INTO ratos (categoria_id,nome,marca,preco_unit_atual,iva) VALUES('2005', 'Rato SCULPT MOBILE FLAME RED', 'Microsoft', '26.56', '23');

//Exercicio8
DELETE 
FROM produto
WHERE nome = 'LIXO';