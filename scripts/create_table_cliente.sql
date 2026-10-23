CREATE  TABLE tb_cliente ( 
	id_cliente INT NOT NULL AUTO_INCREMENT,
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
	ds_endereco_cep_cliente VARCHAR(8) NOT NULL,
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

	CONSTRAINT chk_cep_numero CHECK (
		ds_endereco_cep_cliente IS NULL OR ds_endereco_cep_cliente REGEXP '^[0-9]{8}$'
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
		cd_ddi_telefone_movel_cliente IS NULL OR cd_ddi_telefone_movel_cliente REGEXP '^[0-9]{1,4}$'
	),
	CONSTRAINT chk_ddd_movel_numero CHECK (
		cd_ddd_telefone_movel_cliente IS NULL OR cd_ddd_telefone_movel_cliente REGEXP '^[0-9]{1,3}$'
	),
	CONSTRAINT chk_telefone_movel_numero CHECK (
		cd_telefone_movel_cliente IS NULL OR cd_telefone_movel_cliente REGEXP '^[0-9]{1,15}$'
	),
	
	CONSTRAINT pk_id_cliente PRIMARY KEY (id_cliente),
	CONSTRAINT uq_email_cliente UNIQUE (ds_email_cliente)
 );
 
 COMMIT;