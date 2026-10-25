CREATE DATABASE IF NOT EXISTS db_quantum_finance
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE db_quantum_finance;

CREATE  TABLE tb_cliente ( 
	id_cliente INT NOT NULL AUTO_INCREMENT,
	cd_cpf_cliente VARCHAR(11) NOT NULL,
	nm_primeiro_cliente  VARCHAR(100) NOT NULL,
	nm_segundo_cliente VARCHAR(100),
	nm_ultimo_cliente VARCHAR(100) NOT NULL,	
	dt_nascimento_cliente DATE NOT NULL,
	ds_situacao_civil_cliente VARCHAR(20) NOT NULL,
	ds_sexo_cliente VARCHAR(20) NOT NULL,
	ds_profissao_cliente VARCHAR(100) NOT NULL,
	vl_renda_bruta_cliente DECIMAL(15,2) NOT NULL,
	ds_endereco_avenida_rua_cliente VARCHAR(175) NOT NULL,
	ds_endereco_casa_apto_numero_cliente VARCHAR(20) NOT NULL,
	ds_endereco_apto_andar_cliente VARCHAR(20),
	cd_endereco_cep_cliente VARCHAR(8) NOT NULL,
	ds_endereco_bairro_cliente VARCHAR(100) NOT NULL,
	ds_endereco_cidade_cliente VARCHAR(175) NOT NULL,
	ds_endereco_estado_cliente VARCHAR(100) NOT NULL,
	ds_endereco_pais_cliente VARCHAR(100) NOT NULL,
	cd_ddi_telefone_fixo_cliente VARCHAR(4),
	cd_ddd_telefone_fixo_cliente VARCHAR(3),
	cd_telefone_fixo_cliente VARCHAR(15),
	cd_ddi_telefone_movel_cliente VARCHAR(4) NOT NULL,
	cd_ddd_telefone_movel_cliente VARCHAR(3) NOT NULL,
	cd_telefone_movel_cliente VARCHAR(15) NOT NULL,
	ds_email_cliente VARCHAR(50) NOT NULL,
	dt_registro_cliente DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	ds_segmento_cliente  VARCHAR(30) NOT NULL,
	ds_situacao_cliente VARCHAR(7) NOT NULL,

	CONSTRAINT chk_cpf_cliente CHECK (
		cd_cpf_cliente REGEXP '^[0-9]{11}$'
	),
	CONSTRAINT chk_cep_numero CHECK (
		cd_endereco_cep_cliente REGEXP '^[0-9]{8}$'
	),
	CONSTRAINT chk_ddi_fixo_numero CHECK (
		cd_ddi_telefone_fixo_cliente IS NULL OR cd_ddi_telefone_fixo_cliente REGEXP '^[0-9]{1,4}$'
	),
	CONSTRAINT chk_ddd_fixo_numero CHECK (
		cd_ddd_telefone_fixo_cliente IS NULL OR cd_ddd_telefone_fixo_cliente REGEXP '^[0-9]{1,3}$'
	),
	CONSTRAINT chk_telefone_fixo_numero CHECK (
		cd_telefone_fixo_cliente IS NULL OR cd_telefone_fixo_cliente REGEXP '^[0-9]{1,15}$'
	),
	
	CONSTRAINT chk_ddi_movel_numero CHECK (
		cd_ddi_telefone_movel_cliente REGEXP '^[0-9]{1,4}$'
	),
	CONSTRAINT chk_ddd_movel_numero CHECK (
		cd_ddd_telefone_movel_cliente REGEXP '^[0-9]{1,3}$'
	),
	CONSTRAINT chk_telefone_movel_numero CHECK (
		cd_telefone_movel_cliente REGEXP '^[0-9]{1,15}$'
	),
	
	CONSTRAINT pk_id_cliente PRIMARY KEY (id_cliente),
	CONSTRAINT uq_cpf_cliente UNIQUE (cd_cpf_cliente),
	CONSTRAINT uq_email_cliente UNIQUE (ds_email_cliente)
 ) ENGINE = InnoDB;
 
CREATE  TABLE tb_conta ( 
    id_conta INT NOT NULL AUTO_INCREMENT,
    ds_tipo_conta VARCHAR(20) NOT NULL,
    vl_saldo_conta DECIMAL(15,2) NOT NULL,  
    dt_registro_conta DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ds_situacao_conta VARCHAR(7) NOT NULL,
    id_cliente INT NOT NULL,
    
    CONSTRAINT chk_saldo_conta CHECK (
        vl_saldo_conta >= 0
    ),
    
    CONSTRAINT chk_situacao_conta CHECK (
        ds_situacao_conta IN ('ATIVA', 'INATIVA', 'BLOQUEADA')
    ),
    
    CONSTRAINT pk_id_conta PRIMARY KEY (id_conta),
    CONSTRAINT uq_id_cliente UNIQUE (id_cliente),
    CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES tb_cliente(id_cliente) 
    ON UPDATE CASCADE 
) ENGINE = InnoDB;

CREATE TABLE tb_investimento(
    id_investimento INT NOT NULL AUTO_INCREMENT,
    nm_investimento VARCHAR(109) NOT NULL,
    vl_investimento DECIMAL(15,2) NOT NULL,
    dt_registro_investimento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_produto INT NOT NULL,
    
    CONSTRAINT pk_id_investimento PRIMARY KEY (id_investimento),
    CONSTRAINT fk_id_produto FOREIGN KEY (id_produto) REFERENCES tb_produto(id_produto)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE tb_transacao(
    id_transacao INT NOT NULL AUTO_INCREMENT,
    dt_registro_transacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    vl_transacao DECIMAL(15,2) NOT NULL,
    id_investimento INT NOT NULL,
    
    CONSTRAINT pk_id_transacao PRIMARY KEY (id_transacao),
    CONSTRAINT fk_id_investimento FOREIGN KEY (id_investimento) REFERENCES tb_investimento(id_investimento)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB;

COMMIT;