-- eliminar a tabela caso exista
    DROP TABLE cliente CASCADE CONSTRAINTS;
    -- CRIAR A TABELA CLIENTE
    CREATE TABLE cliente(
    id NUMBER(10)   GENERATED AS IDENTITY (START WITH 1 INCREMENT BY 1),
    nif             CHAR(9),
    nome            VARCHAR2(50) NOT NULL,
    data_nasc       DATE,
    data_adesao     DATE DEFAULT SYSDATE NOT NULL,
    genero          CHAR(1) DEFAULT 'F',
    concelho_id     NUMBER(5) NOT NULL,
    CONSTRAINT pk_cliente_id PRIMARY KEY(id),
    CONSTRAINT fk_cliente_concelho FOREIGN KEY(concelho_id) REFERENCES concelho(id),
    CONSTRAINT ck_cliente_genero CHECK(genero IN ('F','M','O')),
    CONSTRAINT uq_cliente_nif UNIQUE(nif),
    CONSTRAINT ck_cliente_nome CHECK (REGEXP_LIKE(nome,'^[A-Z]')),
    CONSTRAINT ck_cliente_nif CHECK(REGEXP_LIKE(nif,'^(2|5)\d{8}'))
    );
    
    -- 4.b)
    -- CRIAR CLIENTES
    INSERT INTO cliente(nif,nome, data_nasc, concelho_id)
    VALUES('220101000','Maria Gargalhada', TO_DATE('1980-10-12','yyyy-mm-dd'),'0603');
    INSERT INTO cliente(nif,nome, concelho_id)
    VALUES('500102212','Facebook, Lda', '1312');
    INSERT INTO cliente(nif,nome, genero,concelho_id)
    VALUES('500102253','Anónimo', 'O',(SELECT ID FROM CONCELHO WHERE UPPER(nome)='PORTO'));
    
    -- 4.c)
    -- ELIMINAR A COLUNA CASO EXISTA(CLIENTE_ID)
    ALTER TABLE venda DROP COLUMN cliente_id;
    -- CRIAR A COLUNA 
    ALTER TABLE  venda ADD (cliente_id NUMBER(10));
    
    -- 4.d)
    -- ATUALIZAR A COLUNA CLIENTE_ID DA TABELA VENDA
    UPDATE venda 
    SET    cliente_id=(SELECT id FROM cliente WHERE UPPER(nome)='MARIA GARGALHADA')
    WHERE  ID IN (1450, 1451, 1460);
    UPDATE venda 
    SET    cliente_id=(SELECT id FROM cliente WHERE UPPER(nome)='FACEBOOK, LDA' FETCH FIRST 1 ROWS ONLY)
    WHERE  ID IN (1457, 1459);
    UPDATE venda 
    SET    cliente_id=(SELECT id FROM cliente WHERE UPPER(nome)='ANÓNIMO')
    WHERE  cliente_id IS NULL;
    
    -- 4.f) REGRA DE INTEGRIDADE REFERENCIAL
    -- ADICIONAR UMA RESTRIÇÃO DE CHAVE ESTRANGEIRA (ESTABELECER A INTEGRIDADE REFERENCIAL)
    ALTER TABLE venda ADD 
    (CONSTRAINT fk_venda_cliente_id 
    FOREIGN KEY(cliente_id) REFERENCES cliente(id));
    
    -- 5.b) REGRA DE PREENCHIMENTO OBRIGATÓRIO
    -- MODIFICAR A COLUNA cliente_id: a coluna passa a ser de preenchimento obrigatório
    -- NÃO PODEM EXISTIR VENDAS SEM QUE UM CLIENTE SEJA ASSOCIADO 
    ALTER TABLE venda MODIFY cliente_id NUMBER(10) NOT NULL;

