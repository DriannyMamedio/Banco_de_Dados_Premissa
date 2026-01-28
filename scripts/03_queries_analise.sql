-- 1. Relatório de Fornecedores por Loja
-- Lista todas as lojas e seus respectivos fornecedores
SELECT 
    Loja.cnpj, 
    Loja.nome AS nome_loja, 
    Fornecedores.cnpj AS cnpj_fornecedor, 
    Fornecedores.nome AS nome_fornecedor 
FROM Loja 
JOIN Loja_Fornecedor ON Loja.cnpj = Loja_Fornecedor.cnpj_loja 
JOIN Fornecedores ON Loja_Fornecedor.cnpj_fornecedor = Fornecedores.cnpj;

-- 2. Equipe de Vendas
-- Mostra qual vendedor trabalha em qual loja
SELECT 
    Vendedor.cod_identificacao, 
    Vendedor.nome AS nome_vendedor, 
    Loja.nome AS nome_loja 
FROM Vendedor 
JOIN Loja ON Vendedor.cnpj_loja = Loja.cnpj;

-- 3. Detalhes de Compras com Fornecedor
-- Exibe os dados da mercadoria comprada junto com o nome do fornecedor
SELECT 
    Mercadorias_Compradas.codigo, 
    Mercadorias_Compradas.nome AS nome_mercadoria, 
    Mercadorias_Compradas.data_compra, 
    Mercadorias_Compradas.quantidade, 
    Mercadorias_Compradas.unidade, 
    Mercadorias_Compradas.preco_unitario, 
    Fornecedores.cnpj, 
    Fornecedores.nome AS nome_fornecedores 
FROM Mercadorias_Compradas 
JOIN Fornecedores ON Mercadorias_Compradas.id_fornecedor = Fornecedores.cnpj;

-- 4. Inventário por Loja
-- Relaciona as mercadorias disponíveis em cada loja
SELECT 
    Loja.CNPJ AS cnpj_loja, 
    Loja.nome AS nome_loja, 
    Mercadorias_Compradas.codigo AS codigo_mercadoria, 
    Mercadorias_Compradas.nome AS nome_mercadoria, 
    Mercadorias_Compradas.data_compra, 
    Mercadorias_Compradas.quantidade, 
    Mercadorias_Compradas.unidade, 
    Mercadorias_Compradas.preco_unitario 
FROM Loja 
JOIN Mercadorias_Compradas ON Loja.CNPJ = Mercadorias_Compradas.id_loja;

-- 5. Rastreabilidade (Compra vs Venda)
-- Compara os dados de entrada (compra) com os de saída (venda)
SELECT 
    Mercadorias_Compradas.codigo AS codigo_mercadoria_comprada, 
    Mercadorias_Compradas.nome AS nome_mercadoria_comprada, 
    Mercadorias_Compradas.data_compra, 
    Mercadorias_Compradas.quantidade AS quantidade_comprada, 
    Mercadorias_Compradas.preco_unitario AS preco_unitario_compra, 
    Mercadoria_vendida.codigo AS codigo_mercadoria_vendida, 
    Mercadoria_vendida.data_venda, 
    Mercadoria_vendida.quantidade AS quantidade_vendida, 
    Mercadoria_vendida.preco_unitario AS preco_unitario_venda 
FROM Mercadorias_Compradas 
JOIN Mercadoria_vendida ON Mercadorias_Compradas.codigo = Mercadoria_vendida.codigo_comprada;

-- 6. Produtividade dos Vendedores
-- Mostra quais vendas foram realizadas por cada vendedor
SELECT 
    Vendedor.cod_identificacao AS codigo_vendedor, 
    Vendedor.nome AS nome_vendedor, 
    Vendedor.CPF AS cpf_vendedor, 
    Vendedor.endereco AS endereco_vendedor, 
    Vendedor.data_admissao, 
    Vendedor.data_desligamento, 
    Venda.id_venda, 
    Venda.CPF_cliente, 
    Venda.quantidade_vendida, 
    Venda.data_venda 
FROM Vendedor 
JOIN Venda ON Vendedor.cod_identificacao = Venda.codigo_vendedor;

-- 7. Histórico de Compras por Cliente
-- Lista o que cada cliente comprou
SELECT 
    Cliente.CPF AS cpf_cliente, 
    Cliente.nome AS nome_cliente, 
    Cliente.endereco AS endereco_cliente, 
    Cliente.data_nascimento, 
    Cliente.data_cadastro, 
    Cliente.profissao, 
    Cliente.tel, 
    Venda.id_venda, 
    Venda.codigo_vendedor, 
    Venda.quantidade_vendida, 
    Venda.data_venda 
FROM Cliente 
JOIN Venda ON Cliente.CPF = Venda.CPF_cliente;

-- 8. Relatório Detalhado de Saída
-- Detalhes da venda, produto e cliente
SELECT 
    Mercadoria_vendida.codigo AS codigo_mercadoria_vendida, 
    Mercadoria_vendida.nome AS nome_mercadoria_vendida, 
    Mercadoria_vendida.quantidade AS quantidade_vendida, 
    Mercadoria_vendida.preco_unitario AS preco_unitario_vendido, 
    Venda.id_venda, 
    Venda.data_venda, 
    Cliente.nome AS nome_cliente 
FROM Mercadoria_vendida 
JOIN Venda ON Mercadoria_vendida.cod_venda = Venda.id_venda 
JOIN Cliente ON Venda.CPF_cliente = Cliente.CPF;
