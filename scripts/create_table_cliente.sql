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
	id_endereco_cep_cliente INT(8) NOT NULL,
	ds_endereco_bairro_cliente VARCHAR(100) NOT NULL,
	ds_endereco_cidade_cliente VARCHAR(175) NOT NULL,
	ds_endereco_estado_cliente VARCHAR(100) NOT NULL,
	ds_endereco_pais_cliente VARCHAR(100) NOT NULL,
	id_ddi_telefone_fixo_cliente INT(3),
	id_ddd_telefone_fixo_cliente INT(3),
	id_telefone_fixo_cliente INT(9),
	id_ddi_telefone_movel_cliente INT(3) NOT NULL,
	id_ddd_telefone_movel_cliente INT(3) NOT NULL,
	id_telefone_movel_cliente INT(9) NOT NULL,
	ds_email_cliente VARCHAR(50) NOT NULL,
	dt_registro_cliente DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	ds_segmento_cliente  VARCHAR(30) NOT NULL,
	ds_situacao_cliente VARCHAR(7) NOT NULL,

	CONSTRAINT pk_id_cliente PRIMARY KEY (id_cliente),
	CONSTRAINT uq_email_cliente UNIQUE (ds_email_cliente)
 );
 
 COMMIT;