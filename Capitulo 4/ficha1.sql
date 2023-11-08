CREATE TABLE CLIENTES(
id NUMBER(9),
nome VARCHAR(50) NOT NULL,
nif NUMBER(9),
datanascimento DATE,
dataadesao DATE NOT NULL,
genero CHAR(1),
concelho_id NUMBER(4) NOT NULL);