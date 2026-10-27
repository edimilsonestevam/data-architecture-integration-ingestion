
USE db_quantum_finance;

SET SESSION cte_max_recursion_depth = 5000;

INSERT INTO tb_cliente (
    id_cliente,
    cd_cpf_cliente,
    nm_primeiro_cliente,
    nm_segundo_cliente,
    nm_ultimo_cliente,
    dt_nascimento_cliente,
    ds_situacao_civil_cliente,
    ds_sexo_cliente,
    ds_profissao_cliente,
    vl_renda_bruta_cliente,
    ds_endereco_avenida_rua_cliente,
    cd_endereco_numero_casa_predio_cliente,
    cd_endereco_numero_andar_cliente,
    cd_endereco_numero_apto_cliente,
    cd_endereco_cep_cliente,
    ds_endereco_bairro_cliente,
    ds_endereco_cidade_cliente,
    ds_endereco_estado_cliente,
    ds_endereco_pais_cliente,
    cd_ddi_telefone_fixo_cliente,
    cd_ddd_telefone_fixo_cliente,
    cd_telefone_fixo_cliente,
    cd_ddi_telefone_movel_cliente,
    cd_ddd_telefone_movel_cliente,
    cd_telefone_movel_cliente,
    ds_email_cliente,
    ds_segmento_cliente,
    ds_situacao_cliente
)
WITH RECURSIVE numeros AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM numeros
    WHERE n < 5000
)
SELECT
    n,
    LPAD(n, 11, '0'),
    CONCAT('Cliente', n),
    NULL,
    CONCAT('Sobrenome', n),
    '1990-01-01',
    'SOLTEIRO',
    'MASCULINO',
    'ANALISTA',
    3000.00 + n,
    'Rua de Teste',
    CAST(n AS CHAR),
    '1',
    CAST(n AS CHAR),
    LPAD(1000000 + n, 8, '0'),
    'Centro',
    'Sao Paulo',
    'SP',
    'Brasil',
    '55',
    '11',
    LPAD(20000000 + n, 8, '0'),
    '55',
    '11',
    LPAD(900000000 + n, 9, '0'),
    CONCAT('cliente', n, '@example.com'),
    'VAREJO',
    'ATIVO'
FROM numeros;

COMMIT;