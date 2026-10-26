CREATE TABLE tb_agencia(
    id_agencia INT NOT NULL AUTO_INCREMENT,
    nm_agencia VARCHAR(100) NOT NULL,
    ds_endereco_avenida_rua_agencia VARCHAR(175) NOT NULL,
	ds_endereco_numero_predio_agencia VARCHAR(20) NOT NULL,
	cd_endereco_cep_agencia VARCHAR(8) NOT NULL,
	ds_endereco_bairro_agencia VARCHAR(100) NOT NULL,
	ds_endereco_cidade_agencia VARCHAR(175) NOT NULL,
	ds_endereco_estado_agencia VARCHAR(100) NOT NULL,
	ds_endereco_pais_agencia VARCHAR(100) NOT NULL,
	cd_ddi_telefone_fixo_agencia VARCHAR(4) NOT NULL,
	cd_ddd_telefone_fixo_agencia VARCHAR(3) NOT NULL,
	cd_telefone_fixo_agencia VARCHAR(15) NOT NULL,
    ds_situacao_agencia VARCHAR(10) NOT NULL,
    dt_registro_agencia DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ds_agencia VARCHAR(255),
    
    CONSTRAINT chk_cep_numero_agencia CHECK (
		cd_endereco_cep_agencia REGEXP '^[0-9]{8}$'
	),
    CONSTRAINT chk_ddi_telefone_fixo_agencia CHECK(
		cd_ddi_telefone_fixo_agencia REGEXP '^[0-9]{1,4}$'
	),
	CONSTRAINT chk_ddd_telefone_fixo_agencia CHECK(
		cd_ddd_telefone_fixo_agencia REGEXP '^[0-9]{1,3}$'
	),
	CONSTRAINT chk_telefone_fixo_agencia CHECK(
		cd_telefone_fixo_agencia REGEXP '^[0-9]{1,15}$'
	),	
	
    CONSTRAINT pk_id_agencia PRIMARY KEY (id_agencia),
    CONSTRAINT uq_nm_agencia UNIQUE (nm_agencia)
);

COMMIT;