-- 1. Criação do banco de dados (se não existir)
create database sistema_supermercado;
use sistema_supermercado;
/*criando a tabela cliente*/
CREATE TABLE IF NOT EXISTS CLIENTE (
    CPF VARCHAR(14) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Telefone VARCHAR(15),
    Email VARCHAR(100),
    Endereco VARCHAR(200)
); 
/*criando a tabela produto*/
CREATE TABLE IF NOT EXISTS PRODUTO (
    Cod_barras VARCHAR(20) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Categoria VARCHAR(50),
    Preco DECIMAL(10,2) NOT NULL,
    Qtd_estoque INT,
    Validade DATE
);
/*criando a tabela colaborador*/
CREATE TABLE IF NOT EXISTS COLABORADOR (
    CPF VARCHAR(14) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Cargo VARCHAR(50),
    Salario DECIMAL(10,2),
    Data_admissao DATE,
    Telefone VARCHAR(15)
);

/*crianda a tabela de vendas*/
CREATE TABLE IF NOT EXISTS VENDA (
    Id_venda INT AUTO_INCREMENT PRIMARY KEY,
    CPF_cliente VARCHAR(14),
    CPF_colaborador VARCHAR(14) NOT NULL,
    Data DATETIME DEFAULT CURRENT_TIMESTAMP,
    Valor_total DECIMAL(10,2),
    Forma_pagamento VARCHAR(20),
    FOREIGN KEY (CPF_cliente) REFERENCES CLIENTE(CPF),
    FOREIGN KEY (CPF_colaborador) REFERENCES COLABORADOR(CPF)
);
/*criar tabela itens_venda*/
CREATE TABLE IF NOT EXISTS ITENS_VENDA (
    Id_item INT AUTO_INCREMENT PRIMARY KEY,
    Id_venda INT NOT NULL,
    Cod_barras VARCHAR(20) NOT NULL,
    Quantidade INT,
    Subtotal DECIMAL(10,2),
    FOREIGN KEY (Id_venda) REFERENCES VENDA(Id_venda),
    FOREIGN KEY (Cod_barras) REFERENCES PRODUTO(Cod_barras)
); 

/*inserindo dados pessoais dos colaboradores*/

INSERT INTO colaborador (CPF, Nome, Cargo, Salario, Data_admissao, Telefone)
VALUES ('123.456.789-09', 'João Silva', 'Gerente', 4500.00, '2020-05-15', '(11) 94485-9968');

INSERT INTO colaborador (CPF, Nome, Cargo, Salario, Data_admissao, Telefone)
VALUES ('587.758.788-09', 'Luiz Henrique', 'caixa', 1.500, '2020-05-15', '(11) 99945-9449');
INSERT INTO colaborador (CPF, Nome, Cargo, Salario, Data_admissao, Telefone)
VALUES ('378.786.722-10', 'Francisco José Dos Santos', 'Coordenador', 3500.00, '2020-05-15', '(11) 95348-7845');
select * from colaborador;
/* cadastrando clientes*/
INSERT INTO CLIENTE (CPF, Nome) 
VALUES ('987.654.321-00', 'Maria Souza');
INSERT INTO CLIENTE (CPF, Nome,Telefone,Email,Endereco) 
VALUES ('987.654.458-00', 'Pedro Lopes','11-998758-7859','franco.jose.santos@gmail.com','Rua Padre Luiz Miguel,458');
select * from cliente

UPDATE CLIENTE
SET 
    Telefone = '(11) 98888-7777',
    Email = 'maria.souza@email.com',
    Endereco = 'Rua das Flores, 123 - São Paulo/SP'
WHERE CPF = '987.654.321-00';