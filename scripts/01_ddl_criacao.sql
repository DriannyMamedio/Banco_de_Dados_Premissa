-- Criação da Tabela LOJA
CREATE TABLE Loja (
    CNPJ character varying(14), 
    gerente_geral character varying(100), 
    nome character varying(100), 
    endereco character varying(255), 
    PRIMARY KEY(CNPJ)
);

-- Criação da Tabela FORNECEDORES
CREATE TABLE Fornecedores (
    CNPJ character varying(14), 
    nome character varying(100), 
    endereco character varying(255), 
    ramo_atividade character varying(50), 
    id_loja character varying(14), 
    tel integer, 
    PRIMARY KEY(CNPJ)
);

-- Criação da Tabela VENDEDOR
CREATE TABLE Vendedor (
    cod_identificacao character varying(10), 
    nome character varying(100), 
    CPF character varying(11) UNIQUE, 
    endereco character varying(255), 
    data_admissao date, 
    data_desligamento date, 
    cnpj_loja character varying(14), 
    PRIMARY KEY(cod_identificacao), 
    FOREIGN KEY (cnpj_loja) REFERENCES Loja(cnpj)
);

-- Criação da Tabela MERCADORIAS COMPRADAS
CREATE TABLE Mercadorias_Compradas (
    codigo character varying(20), 
    id_fornecedor character varying(14), 
    nome character varying(100), 
    data_compra date, 
    quantidade integer, 
    unidade character varying(20), 
    preco_unitario numeric(10,2), 
    id_loja character varying(14), 
    PRIMARY KEY (codigo), 
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(CNPJ), 
    FOREIGN KEY (id_loja) REFERENCES Loja(CNPJ)
);

-- Criação da Tabela CLIENTE
CREATE TABLE Cliente (
    CPF character varying(11),
    nome character varying(100), 
    endereco character varying(255), 
    data_nascimento date, 
    data_cadastro date, 
    profissao character varying(50), 
    tel integer, 
    PRIMARY KEY(CPF)
);

-- Criação da Tabela VENDA
CREATE TABLE Venda (
    id_venda character varying(20), 
    CPF_cliente character varying(11), 
    codigo_vendedor character varying(10), 
    quantidade_vendida integer, 
    data_venda date, 
    PRIMARY KEY(id_venda), 
    FOREIGN KEY (CPF_cliente) REFERENCES Cliente(CPF), 
    FOREIGN KEY (codigo_vendedor) REFERENCES Vendedor(cod_identificacao)
);

-- Criação da Tabela MERCADORIA VENDIDA
CREATE TABLE Mercadoria_vendida (
    codigo character varying(20), 
    codigo_comprada character varying(20), 
    cod_venda character varying(20), 
    nome character varying(100), 
    quantidade integer, 
    data_venda date, 
    unidade character varying(20), 
    preco_unitario numeric(10,2), 
    PRIMARY KEY(codigo), 
    FOREIGN KEY (codigo_comprada)REFERENCES Mercadorias_Compradas(codigo), 
    FOREIGN KEY (cod_venda) REFERENCES Venda(id_venda)
);

-- Tabela Associativa LOJA_FORNECEDOR
CREATE TABLE loja_fornecedor(
    cnpj_loja character varying(14), 
    cnpj_fornecedor character varying(14), 
    PRIMARY KEY(cnpj_loja, cnpj_fornecedor), 
    FOREIGN KEY(cnpj_loja) REFERENCES Loja(cnpj), 
    FOREIGN KEY(cnpj_fornecedor) REFERENCES Fornecedores(CNPJ)
);
