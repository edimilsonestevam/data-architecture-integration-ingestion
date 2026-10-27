USE quantum_finance;

-- =====================================================
-- TRANSACAO 1
-- Data: 27/10/2026
-- Mes: outubro de 2026
-- =====================================================

INSERT INTO transacoes_conta_dia (
    conta_id,
    dia_bucket,
    data_hora,
    transacao_id,
    modalidade,
    tipo_transacao,
    situacao,
    valor,
    descricao
) VALUES (
    'CONTA001',
    '2026-10-27',
    '2026-10-27 10:30:00',
    now(),
    'PIX',
    'CREDITO',
    'CONCLUIDA',
    1500.00,
    'Recebimento de transferencia'
);

INSERT INTO transacoes_conta_mes (
    conta_id,
    mes_bucket,
    data_hora,
    transacao_id,
    modalidade,
    tipo_transacao,
    situacao,
    valor,
    descricao
) VALUES (
    'CONTA001',
    '2026-10-01',
    '2026-10-27 10:30:00',
    now(),
    'PIX',
    'CREDITO',
    'CONCLUIDA',
    1500.00,
    'Recebimento de transferencia'
);

-- =====================================================
-- TRANSACAO 2
-- Data: 27/10/2026
-- Mes: outubro de 2026
-- =====================================================

INSERT INTO transacoes_conta_dia (
    conta_id, dia_bucket, data_hora, transacao_id,
    modalidade, tipo_transacao, situacao, valor, descricao
) VALUES (
    'CONTA001', '2026-10-27', '2026-10-27 11:15:00',
    now(), 'CARTAO', 'DEBITO', 'CONCLUIDA',
    250.00, 'Compra no supermercado'
);

INSERT INTO transacoes_conta_mes (
    conta_id, mes_bucket, data_hora, transacao_id,
    modalidade, tipo_transacao, situacao, valor, descricao
) VALUES (
    'CONTA001', '2026-10-01', '2026-10-27 11:15:00',
    now(), 'CARTAO', 'DEBITO', 'CONCLUIDA',
    250.00, 'Compra no supermercado'
);

-- =====================================================
-- TRANSACAO 3
-- Data: 27/10/2026
-- Mes: outubro de 2026
-- =====================================================

INSERT INTO transacoes_conta_dia (
    conta_id, dia_bucket, data_hora, transacao_id,
    modalidade, tipo_transacao, situacao, valor, descricao
) VALUES (
    'CONTA002', '2026-10-27', '2026-10-27 12:00:00',
    now(), 'TED', 'CREDITO', 'CONCLUIDA',
    3200.00, 'Recebimento de salario'
);

INSERT INTO transacoes_conta_mes (
    conta_id, mes_bucket, data_hora, transacao_id,
    modalidade, tipo_transacao, situacao, valor, descricao
) VALUES (
    'CONTA002', '2026-10-01', '2026-10-27 12:00:00',
    now(), 'TED', 'CREDITO', 'CONCLUIDA',
    3200.00, 'Recebimento de salario'
);