CREATE TABLE tb_agencia(
    id_agencia INT NOT NULL AUTO_INCREMENT,
    nm_agencia VARCHAR(100) NOT NULL,
    ds_agencia VARCHAR(255),
    ds_situacao_agencia VARCHAR(10) NOT NULL,
    dt_registro_agencia DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT chk_situacao_agencia CHECK(
        ds_situacao_agencia IN ('ATIVA', 'INATIVA', 'SUSPENSA')
    ),
    
    CONSTRAINT pk_id_agencia PRIMARY KEY (id_agencia),
    CONSTRAINT uq_nm_agencia UNIQUE (nm_agencia)
) ENGINE = InnoDB;

COMMIT;