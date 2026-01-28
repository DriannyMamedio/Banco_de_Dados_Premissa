-- Inserindo LOJAS
INSERT INTO Loja (CNPJ, gerente_geral, nome, endereco) VALUES 
('00625701425612', 'Paulo Junqueira', 'Oliveira Ferragens', 'Rua São Francisco, Bairro Av Getúlio Vargas, 205, Riberao preto, SP'), 
('12345678901234', 'Carla Mendes', 'Constrular', 'Av Brasil, 1001, Centro, Uberaba, MG'), 
('98765432109876', 'Roberto Lima', 'Casa & Obra', 'Rua das Palmeiras, 88, Bairro Industrial, Uberlândia, MG');

-- Inserindo FORNECEDORES
INSERT INTO Fornecedores (CNPJ, nome, endereco, ramo_atividade, tel) VALUES 
('00014825978452', 'Metais Ferragens', 'Rua Indaia, 53, Copacabana, Catalao, GO', 'atacadista de ferragens', 32334455), 
('00782415696453', 'Giro', 'Av Deodoro da Fonseca, 4000, Liberdade, Araxa, MG', 'atacadista de ferragens', 98887766), 
('00552876149524', 'KFH', 'Av Presidente Prudente, 874, Jardim Versailles, Araguari, MG', 'atacadista e varejista de ferragens', 91234557);

-- Inserindo VENDEDORES
INSERT INTO Vendedor (cod_identificacao, nome, CPF, endereco, data_admissao, data_desligamento, cnpj_loja) VALUES 
('A0122', 'Anderson Almeida', '01139645217', 'rua americano, brasil, Uberlandia, MG', '2007-09-25', NULL, '00625701425612'), 
('M7821', 'Mauricio Lima', '75163428491', 'rua da crista, guarani, Uberaba, MG', '2021-04-07', NULL, '12345678901234'), 
('J6513', 'Joao Victor', '03912874186', 'rua antonio gazeta, Imperio, Riberao Preto, SP', '2018-03-16', NULL, '98765432109876');

-- Inserindo MERCADORIAS COMPRADAS (Estoque Inicial)
INSERT INTO Mercadorias_Compradas (codigo, id_fornecedor, nome, data_compra, quantidade, unidade, preco_unitario, id_loja) VALUES 
('PM0102', '00014825978452', 'porca', '2024-01-13', 100, 'CX', 0.50, '00625701425612'), 
('PM0103', '00014825978452', 'parafuso', '2024-04-27', 200, 'CX', 0.90, '00625701425612'), 
('CG7485', '00782415696453', 'chave de fenda', '2024-02-14', 60, 'DZ', 10.00, '12345678901234'), 
('AG7182', '00782415696453', 'alicate', '2024-08-06', 48, 'DZ', 12.00, '12345678901234'), 
('MK4516', '00552876149524', 'martelo', '2025-02-25', 72, 'DZ', 15.00, '98765432109876'), 
('PK4156', '00552876149524', 'prego', '2025-01-18', 200, 'CX', 0.60, '98765432109876');

-- Inserindo CLIENTES
INSERT INTO Cliente (CPF, nome, endereco, data_nascimento, data_cadastro, profissao, tel) VALUES 
('01425878941', 'Antonio Fagundes', 'rua dos amentes, 104, Divinópolis, MG', '1965-04-15', '2017-06-26', 'carpinteiro', 98414652), 
('32178974126', 'Americo da Silva', 'rua flamingo, 14, Uberlândia, MG', '1975-10-07', '2023-07-12', 'analista de crédito', 9914263), 
('98415675324', 'Maria Rocha', 'rua 13 de março, centro, Catalão, GO', '1999-12-28', '2024-05-19', 'faturista', 99153247);

-- Inserindo VENDAS
INSERT INTO Venda (id_venda, CPF_cliente, codigo_vendedor, quantidade_vendida, data_venda) VALUES 
('AF001', '01425878941', 'A0122', 10, '2025-04-04'), 
('AS4123', '32178974126', 'M7821', 5, '2024-12-23'), 
('MR2634', '98415675324', 'J6513', 8, '2024-09-25'), 
('AF7485', '01425878941', 'M7821', 5, '2025-01-05'), 
('MR3614', '98415675324', 'A0122', 15, '2024-08-31');

-- Inserindo DETALHES DAS VENDAS (Itens Vendidos)
INSERT INTO mercadoria_vendida (codigo, codigo_comprada, cod_venda, nome, quantidade, data_venda, unidade, preco_unitario) VALUES 
('AQ12', 'PM0102', 'AF001', 'porca', 5, '2025-04-04', 'UN', 0.80), 
('AZ78', 'CG7485', 'AF001', 'chave de fenda', 5, '2025-04-04', 'UN', 15.00), 
('QW36', 'PK4156', 'AS4123', 'prego', 5, '2024-12-23', 'UN', 0.90), 
('JH1328', 'PM0103', 'MR2634', 'parafuso', 8, '2024-09-25', 'UN', 1.20), 
('UG67', 'PK4156', 'AF7485', 'prego', 5, '2025-01-05', 'UN', 0.90), 
('LP56', 'PK4156', 'MR3614', 'prego', 5, '2024-08-31', 'UN', 0.90), 
('LP18', 'MK4516', 'MR3614', 'martelo', 1, '2024-08-31', 'UN', 23.00), 
('SD87', 'PM0103', 'MR3614', 'parafuso', 9, '2024-08-31', 'UN', 1.20);

-- Vinculando LOJA com FORNECEDOR
INSERT INTO loja_fornecedor(cnpj_loja, cnpj_fornecedor) VALUES 
('00625701425612', '00014825978452'), 
('00625701425612', '00782415696453'), 
('12345678901234', '00552876149524'), 
('98765432109876', '00782415696453');
