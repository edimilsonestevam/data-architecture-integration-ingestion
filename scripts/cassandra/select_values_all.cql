-- =====================================================
-- Consulta 1 — Últimas transações de uma conta
-- =====================================================

SELECT *
FROM transacoes_conta_dia
WHERE conta_id = 'CONTA-1001'
  AND dia_bucket = '2026-10-26'
LIMIT 20;

-- =====================================================
-- Consulta 2 — Transações de uma conta em determinado mês
-- =====================================================

SELECT *
FROM transacoes_conta_mes
WHERE conta_id = 'CONTA-1001'
  AND mes_bucket = '2026-10-01';
  
-- =====================================================
-- Consulta 3 — Total transacionado por modalidade em um dia
-- =====================================================

SELECT total_valor, quantidade
FROM totais_modalidade_dia_bucket
WHERE dia = '2026-10-26'
  AND modalidade = 'PIX'
  AND shard_id = 0;