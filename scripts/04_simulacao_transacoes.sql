-- ===================================================
-- SIMULAÇÃO DE OPERAÇÕES DA LOJA (CRUD)
-- ===================================================

-- ---------------------------------------------------
-- 1. REPOSIÇÃO DE ESTOQUE (Novas Compras)
-- Chegada de novos produtos para abril/2025
-- ---------------------------------------------------
INSERT INTO Mercadorias_Compradas (codigo, id_fornecedor, nome, data_compra, quantidade, unidade, preco_unitario, id_loja) VALUES 
('PD9001', '00014825978452', 'arruela', '2025-04-01', 300, 'CX', 0.30, '00625701425612'), 
('CH2010', '00782415696453', 'chave inglesa', '2025-04-03', 50, 'UN', 22.00, '12345678901234'), 
('AL4550', '00552876149524', 'alavanca', '2025-04-05', 40, 'UN', 35.00, '98765432109876'), 
('TR7894', '00552876149524', 'trena 5m', '2025-04-06', 80, 'UN', 9.50, '98765432109876');

-- ---------------------------------------------------
-- 2. REGISTRO DE VENDAS (Fluxo de Saída)
-- Clientes comprando os novos itens
-- ---------------------------------------------------
INSERT INTO Venda (id_venda, CPF_cliente, codigo_vendedor, quantidade_vendida, data_venda) VALUES 
('V005', '01425878941', 'A0122', 150, '2025-04-20'), 
('V006', '32178974126', 'M7821', 40, '2025-04-25'), 
('V007', '98415675324', 'J6513', 40, '2025-05-01'),
('V008', '01425878941', 'A0122', 80, '2025-04-01'); 

INSERT INTO Mercadoria_Vendida (codigo, codigo_comprada, cod_venda, nome, quantidade, data_venda, unidade, preco_unitario) VALUES 
('PD9001-1', 'PD9001', 'V005', 'arruela', 150, '2025-04-20', 'CX', 0.30), 
('CH2010-1', 'CH2010', 'V006', 'chave inglesa', 40, '2025-04-25', 'UN', 22.00), 
('AL4550-1', 'AL4550', 'V007', 'alavanca', 40, '2025-05-01', 'UN', 35.00), 
('TR7894-1', 'TR7894', 'V008', 'trena 5m', 80, '2025-04-01', 'UN', 9.50);

-- ---------------------------------------------------
-- 3. ATUALIZAÇÃO DE ESTOQUE (Baixa)
-- Deduzindo os itens vendidos do estoque principal
-- ---------------------------------------------------
UPDATE Mercadorias_Compradas SET quantidade = quantidade - 150 WHERE codigo = 'PD9001';
UPDATE Mercadorias_Compradas SET quantidade = quantidade - 40 WHERE codigo = 'CH2010';
UPDATE Mercadorias_Compradas SET quantidade = quantidade - 40 WHERE codigo = 'AL4550';
UPDATE Mercadorias_Compradas SET quantidade = quantidade - 80 WHERE codigo = 'TR7894';

-- ---------------------------------------------------
-- 4. CORREÇÃO DE DADOS (Alterações)
-- Ajustes de preços e nomes incorretos
-- ---------------------------------------------------
-- Corrigindo nome e preço da arruela
UPDATE Mercadorias_Compradas
SET nome = 'arruelas', preco_unitario = 0.40
WHERE codigo = 'PD9001'; 

-- Atualizando preço do martelo
UPDATE Mercadorias_Compradas
SET nome = 'martelos', preco_unitario = 14.99
WHERE codigo = 'MK4516';

-- Corrigindo data de compra e preço do alicate
UPDATE Mercadorias_Compradas
SET data_compra = '2025-05-05', preco_unitario = 11.99
WHERE codigo = 'AG7182';

-- ---------------------------------------------------
-- 5. LIMPEZA DE DADOS (Remoções)
-- Removendo itens descontinuados ou erros de cadastro
-- ---------------------------------------------------
-- Primeiro removemos da tabela de vendas (dependência)
DELETE FROM mercadoria_vendida WHERE codigo_comprada = 'CH2010';
DELETE FROM mercadoria_vendida WHERE codigo_comprada = 'AL4550';

-- Depois removemos do estoque principal
DELETE FROM Mercadorias_Compradas WHERE codigo = 'CH2010';
DELETE FROM Mercadorias_Compradas WHERE codigo =  'AL4550';
