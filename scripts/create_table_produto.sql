CREATE TABLE tb_produto(
    id_produto INT NOT NULL AUTO_INCREMENT,
    nm_produto VARCHAR(100) NOT NULL,
    ds_produto VARCHAR(255),
    ds_situacao_produto VARCHAR(10) NOT NULL,
    vl_produto DECIMAL(15,2) NOT NULL,
    vl_taxa_produto DECIMAL(5,2) NOT NULL,
    ds_periodicidade_taxa_produto VARCHAR(20) NOT NULL,
    dt_registro_produto DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT chk_produto CHECK(
        vl_produto >= 0
    ),
    CONSTRAINT chk_taxa_produto CHECK(
        vl_taxa_produto >= 000.00 AND
        vl_taxa_produto <= 100.00
    ),
    CONSTRAINT chk_periodicidade_taxa_produto CHECK(
        ds_periodicidade_taxa_produto IN ('DIARIA', 'SEMANAL', 'MENSAL', 'ANUAL')
    ), 
    CONSTRAINT chk_situacao_produto CHECK(
        ds_situacao_produto IN ('ATIVO', 'INATIVO', 'SUSPENSO')
    ),
    
    CONSTRAINT pk_id_produto PRIMARY KEY (id_produto),
    CONSTRAINT uq_nm_produto UNIQUE (nm_produto)
);

COMMIT;