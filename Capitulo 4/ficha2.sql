/*Exercicio 1*/
CREATE TABLE tablea_A(
id number,
a_minha_data date,
constraint ck_data check(a_minha_data<=SYSDATE));

CREATE OR REPLACE TRIGGER biu_CLIENTE_DTANASC
BEFORE INSERT OR UPDATE OF DTANASC ON cliente
FOR EACH ROW
BEGIN
    IF :NEW.DTANASC>SYSDATE THEN
RAISE_APPLICATION_ERROR(-20002, 'A data de nascimento não pode ser futura!');
/*
-20002
NUMERO DO ERRO QUE E ATRIBUIDO PELO PROGRAMADOR
-20999, -20000
*/
    END IF;
END;

/*EXERCICIO 2*/

INSERT INTO cliente(nome, concelho_id, dtanasc)
VALUES ('Future Girl', 603, SYDATE+1);

CREATE OR REPLACE TRIGGER biu_venda_loja_id
BEFORE INSERT OR UPDATE OF loja_id ON venda
FOR EACH ROW
DECLARE
    V_LOJA_ID VENDA.LOJA_ID%TYPE;
BEGIN
    
    SELECT ID INTO V_LOJA_ID FROM loja WHERE nome='online';

    IF (:new.loja_id!=V_LOJA_ID AND TO_CHAR(:NEW.data, 'D')=1) THEN
    RAISE_APPLICATION_ERROR(-20003, 'Só é permitido que lojas onlines vendam ao domingo');
    END IF;
END;

/*EXERCICIO 3*/
CREATE OR REPLACE TRIGGER tg_linha_venda_preco
BEFORE INSERT ON linha_venda
FOR EACH ROW
DECLARE
V_PRECO_ATUAL produto.preco_unit_atual%TYPE;
BEGIN

SELECT preco_unit_atual INTO V_PRECO_ATUAL
FROM produto
WHERE ID=:NEW.PRODUTO_ID;

:NEW.PRECO_UNIT_VENDA :=V_PRECO_ATUAL;

END;

/*EXERCICIO 4*/





