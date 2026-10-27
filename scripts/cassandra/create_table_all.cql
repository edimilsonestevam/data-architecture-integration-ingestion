
-- =====================================================
-- QUANTUM FINANCE - MODELO DISTRIBUIDO CASSANDRA
-- =====================================================

CREATE KEYSPACE IF NOT EXISTS quantum_finance
WITH replication = {
    'class': 'NetworkTopologyStrategy',
    'datacenter1': 3
};

USE quantum_finance;

-- =====================================================
-- TABELA 1: ULTIMAS TRANSACOES POR CONTA E DIA
-- Bucket temporal: dia
-- Partition key: (conta_id, dia_bucket)
-- Clustering: data_hora DESC, transacao_id DESC
-- =====================================================

CREATE TABLE IF NOT EXISTS transacoes_conta_dia (
    conta_id        text,
    dia_bucket      date,
    data_hora       timestamp,
    transacao_id    timeuuid,
    modalidade      text,
    tipo_transacao  text,
    situacao        text,
    valor           decimal,
    descricao       text,

    PRIMARY KEY (
        (conta_id, dia_bucket),
        data_hora,
        transacao_id
    )
)
WITH CLUSTERING ORDER BY (
    data_hora DESC,
    transacao_id DESC
);

-- =====================================================
-- TABELA 2: TRANSACOES POR CONTA E MES
-- Bucket temporal: mes (primeiro dia do mes)
-- Partition key: (conta_id, mes_bucket)
-- Clustering: data_hora DESC, transacao_id DESC
-- =====================================================

CREATE TABLE IF NOT EXISTS transacoes_conta_mes (
    conta_id        text,
    mes_bucket      date,
    data_hora       timestamp,
    transacao_id    timeuuid,
    modalidade      text,
    tipo_transacao  text,
    situacao        text,
    valor           decimal,
    descricao       text,

    PRIMARY KEY (
        (conta_id, mes_bucket),
        data_hora,
        transacao_id
    )
)
WITH CLUSTERING ORDER BY (
    data_hora DESC,
    transacao_id DESC
);

-- =====================================================
-- TABELA 3: TOTAL POR MODALIDADE, DIA E SHARD
-- Partition key: (dia, modalidade, shard_id)
-- Uma linha por dia, modalidade e shard.
-- Os totais sao mantidos por processo de agregacao.
-- =====================================================

CREATE TABLE IF NOT EXISTS totais_modalidade_dia_bucket (
    dia             date,
    modalidade      text,
    shard_id        smallint,
    total_valor     decimal,
    quantidade      bigint,
    atualizado_em   timestamp,

    PRIMARY KEY ((dia, modalidade, shard_id))
);

-- =====================================================
-- TABELA 4: OBT PARA ANALISE TEMPORAL (OPCIONAL)
-- Permite totais por dia OU mes e modalidade.
-- periodo_inicio: data do dia ou primeiro dia do mes.
-- Cada periodo/modalidade e distribuido por shards.
-- =====================================================

CREATE TABLE IF NOT EXISTS obt_transacoes_tempo (
    periodo_tipo    text,
    periodo_inicio  date,
    modalidade      text,
    shard_id        smallint,
    total_valor     decimal,
    quantidade      bigint,
    atualizado_em   timestamp,

    PRIMARY KEY (
        (periodo_tipo, periodo_inicio, modalidade, shard_id)
    )
);