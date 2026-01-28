-- ===================================================
-- RELATÓRIOS GERENCIAIS E VIEWS (Business Intelligence)
-- ===================================================

-- ---------------------------------------------------
-- 1. VIEW: Top Produtos (Mais Vendidos)
-- Identifica os campeões de venda para reposição prioritária
-- ---------------------------------------------------
CREATE VIEW Relatorio_Mais_Vendidas AS 
SELECT 
    Mercadoria_vendida.nome AS nome_mercadoria,
    SUM(Mercadoria_vendida.quantidade) AS total_vendido
FROM 
    Mercadoria_vendida
JOIN 
    Venda ON Mercadoria_vendida.cod_venda = Venda.id_venda
GROUP BY 
    Mercadoria_vendida.nome
ORDER BY 
    total_vendido DESC;

-- Executando a View
SELECT * FROM Relatorio_Mais_Vendidas;


-- ---------------------------------------------------
-- 2. VIEW: Produtos com Baixa Saída (Menos Vendidos)
-- Identifica produtos "encalhados" para possíveis promoções
-- ---------------------------------------------------
CREATE VIEW R_Menos_Vendidas AS
SELECT 
    Mercadoria_vendida.nome AS nome_mercadoria,
    SUM(Mercadoria_vendida.quantidade) AS total_vendido
FROM 
    Mercadoria_vendida
JOIN 
    Venda ON Mercadoria_vendida.cod_venda = Venda.id_venda
GROUP BY 
    Mercadoria_vendida.nome
ORDER BY 
    total_vendido ASC;

-- Executando a View
SELECT * FROM R_Menos_Vendidas;


-- ---------------------------------------------------
-- 3. ANÁLISE FINANCEIRA: Lucro vs Prejuízo
-- Calcula a margem real subtraindo o custo de compra do valor de venda
-- ---------------------------------------------------
SELECT 
    Mercadorias_Compradas.codigo AS codigo_mercadoria,
    Mercadorias_Compradas.nome AS nome_mercadoria,
    SUM(Mercadoria_Vendida.quantidade) AS total_vendido,
    
    -- Comparativo de Preços Unitários
    Mercadorias_Compradas.preco_unitario AS custo_unitario,
    Mercadoria_Vendida.preco_unitario AS preco_venda,
    
    -- Totais Financeiros
    SUM(Mercadoria_Vendida.quantidade) * Mercadoria_Vendida.preco_unitario AS receita_total,
    SUM(Mercadoria_Vendida.quantidade) * Mercadorias_Compradas.preco_unitario AS custo_total,
    
    -- Cálculo do Lucro Líquido
    (SUM(Mercadoria_Vendida.quantidade) * Mercadoria_Vendida.preco_unitario) - 
    (SUM(Mercadoria_Vendida.quantidade) * Mercadorias_Compradas.preco_unitario) AS lucro_prejuizo
FROM 
    Mercadorias_Compradas 
JOIN 
    Mercadoria_vendida ON Mercadorias_Compradas.codigo = Mercadoria_Vendida.codigo_comprada
GROUP BY 
    Mercadorias_Compradas.codigo, 
    Mercadorias_Compradas.nome, 
    Mercadorias_Compradas.preco_unitario, 
    Mercadoria_Vendida.preco_unitario;
