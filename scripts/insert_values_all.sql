
USE db_quantum_finance;

START TRANSACTION;

-- =====================================================
-- 1. CLIENTES
-- =====================================================

INSERT INTO tb_cliente (
    id_cliente, cd_cpf_cliente, nm_primeiro_cliente,
    nm_segundo_cliente, nm_ultimo_cliente,
    dt_nascimento_cliente, ds_situacao_civil_cliente,
    ds_sexo_cliente, ds_profissao_cliente,
    vl_renda_bruta_cliente,
    ds_endereco_avenida_rua_cliente,
    cd_endereco_numero_casa_predio_cliente,
    cd_endereco_numero_andar_cliente,
    cd_endereco_numero_apto_cliente,
    cd_endereco_cep_cliente,
    ds_endereco_bairro_cliente, ds_endereco_cidade_cliente,
    ds_endereco_estado_cliente, ds_endereco_pais_cliente,
    cd_ddi_telefone_fixo_cliente, cd_ddd_telefone_fixo_cliente,
    cd_telefone_fixo_cliente,
    cd_ddi_telefone_movel_cliente, cd_ddd_telefone_movel_cliente,
    cd_telefone_movel_cliente, ds_email_cliente,
    ds_segmento_cliente, ds_situacao_cliente
) VALUES
(
    1, '12345678901', 'Edimilson', 'Estevam', 'Cruz',
    '1983-05-12', 'SOLTEIRO', 'MASCULINO', 'ENGENHEIRO DE SOFTWARE',
    12500.00, 'Avenida Paulista', '1000', '10', '101',
    '01310100', 'Bela Vista', 'Sao Paulo', 'SP', 'Brasil',
    '55', '11', '30001234',
    '55', '11', '991234567', 'edimilson@example.com',
    'PREMIUM', 'ATIVO'
),
(
    2, '23456789012', 'Mariana', 'Silva', 'Oliveira',
    '1990-08-20', 'CASADO', 'FEMININO', 'ANALISTA FINANCEIRA',
    8500.00, 'Rua das Flores', '250', '3', '32',
    '80020000', 'Centro', 'Curitiba', 'PR', 'Brasil',
    NULL, NULL, NULL,
    '55', '41', '992345678', 'mariana@example.com',
    'VAREJO', 'ATIVO'
),
(
    3, '34567890123', 'Rafael', NULL, 'Santos',
    '1988-11-03', 'SOLTEIRO', 'MASCULINO', 'CONTADOR',
    9800.00, 'Avenida Brasil', '750', NULL, NULL,
    '30140000', 'Funcionarios', 'Belo Horizonte', 'MG', 'Brasil',
    '55', '31', '32001234',
    '55', '31', '993456789', 'rafael@example.com',
    'PREMIUM', 'ATIVO'
);

-- =====================================================
-- 2. AGENCIAS
-- =====================================================

INSERT INTO tb_agencia (
    id_agencia, nm_agencia,
    ds_endereco_avenida_rua_agencia,
    ds_endereco_numero_predio_agencia,
    cd_endereco_cep_agencia,
    ds_endereco_bairro_agencia,
    ds_endereco_cidade_agencia,
    ds_endereco_estado_agencia,
    ds_endereco_pais_agencia,
    cd_ddi_telefone_fixo_agencia,
    cd_ddd_telefone_fixo_agencia,
    cd_telefone_fixo_agencia,
    ds_situacao_agencia, ds_agencia
) VALUES
(
    1, 'Agencia Paulista',
    'Avenida Paulista', '1500', '01310100',
    'Bela Vista', 'Sao Paulo', 'SP', 'Brasil',
    '55', '11', '31001234', 'ATIVA',
    'Agencia principal de Sao Paulo'
),
(
    2, 'Agencia Curitiba Centro',
    'Rua das Flores', '300', '80020000',
    'Centro', 'Curitiba', 'PR', 'Brasil',
    '55', '41', '32001234', 'ATIVA',
    'Agencia da regiao central de Curitiba'
);

-- =====================================================
-- 3. PRODUTOS
-- =====================================================

INSERT INTO tb_produto (
    id_produto, nm_produto, ds_produto,
    ds_situacao_produto, vl_produto,
    vl_taxa_produto, ds_periodicidade_taxa_produto
) VALUES
(
    1, 'CDB Quantum 2027',
    'Certificado de deposito bancario com vencimento em 2027',
    'ATIVO', 1000.00, 10.00, 'ANUAL'
),
(
    2, 'Tesouro Prefixado 2028',
    'Produto de renda fixa prefixada',
    'ATIVO', 1000.00, 12.50, 'ANUAL'
),
(
    3, 'Poupanca Quantum',
    'Produto de poupanca tradicional',
    'ATIVO', 100.00, 0.50, 'MENSAL'
),
(
    4, 'CDB Liquidez Diaria',
    'CDB com possibilidade de resgate conforme suas condicoes',
    'ATIVO', 500.00, 0.90, 'MENSAL'
);

-- =====================================================
-- 4. ESPECIALIZACOES DOS PRODUTOS
-- =====================================================

INSERT INTO tb_produto_renda_fixa (id_produto)
VALUES (1), (2), (4);

INSERT INTO tb_produto_poupanca (id_produto)
VALUES (3);

-- =====================================================
-- 5. CONTAS
-- =====================================================

INSERT INTO tb_conta (
    id_conta, ds_tipo_conta, vl_conta,
    ds_situacao_conta, id_cliente, id_agencia_conta
) VALUES
(1, 'CORRENTE', 4500.00, 'ATIVA', 1, 1),
(2, 'CORRENTE', 8000.00, 'ATIVA', 2, 1),
(3, 'POUPANCA', 2500.00, 'ATIVA', 3, 2),
(4, 'INVESTIMENTO', 600.00, 'ATIVA', 1, 2);

-- =====================================================
-- 6. MOVIMENTACOES
-- =====================================================

INSERT INTO tb_movimentacao (
    id_movimentacao, ds_tipo_movimentacao,
    ds_situacao_movimentacao, ds_movimentacao,
    vl_movimentacao, id_conta
) VALUES
(
    1, 'DEBITO', 'CONCLUIDA',
    'Aplicacao no CDB Quantum 2027',
    1000.00, 1
),
(
    2, 'DEBITO', 'CONCLUIDA',
    'Aplicacao no Tesouro Prefixado 2028',
    2000.00, 2
),
(
    3, 'DEBITO', 'CONCLUIDA',
    'Deposito inicial em produto de poupanca',
    500.00, 3
),
(
    4, 'CREDITO', 'CONCLUIDA',
    'Credito recebido por transferencia',
    250.00, 1
),
(
    5, 'DEBITO', 'PENDENTE',
    'Pagamento pendente para teste',
    100.00, 4
);

-- =====================================================
-- 7. INVESTIMENTOS
-- =====================================================

INSERT INTO tb_investimento (
    id_investimento, nm_investimento,
    vl_aplicado_investimento,
    vl_rendimento_investimento,
    vl_total_investimento,
    dt_vencimento_investimento,
    id_produto, id_conta
) VALUES
(
    1, 'Investimento CDB 2027',
    1000.00, 50.00, 1050.00,
    '2027-12-31', 1, 1
),
(
    2, 'Investimento Tesouro 2028',
    2000.00, 100.00, 2100.00,
    '2028-12-31', 2, 2
),
(
    3, 'Investimento Poupanca',
    500.00, 5.00, 505.00,
    '2027-10-26', 3, 3
);

-- =====================================================
-- 8. TRANSACOES
-- =====================================================

INSERT INTO tb_transacao (
    id_transacao, ds_tipo_transacao,
    ds_situacao_transacao, ds_descricao_transacao,
    vl_transacao, id_investimento, id_movimentacao
) VALUES
(
    1, 'APLICACAO', 'CONCLUIDA',
    'Aplicacao inicial em CDB',
    1000.00, 1, 1
),
(
    2, 'APLICACAO', 'CONCLUIDA',
    'Aplicacao inicial em Tesouro Prefixado',
    2000.00, 2, 2
),
(
    3, 'APLICACAO', 'CONCLUIDA',
    'Aplicacao inicial em poupanca',
    500.00, 3, 3
);

COMMIT;
