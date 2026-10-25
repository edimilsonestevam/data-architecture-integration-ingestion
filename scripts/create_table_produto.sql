CREATE TABLE tb_produto(
    id_produto INT NOT NULL AUTO_INCREMENT,
    nm_produto VARCHAR(100) NOT NULL,
    ds_produto VARCHAR(255),
    ds_situacao_produto VARCHAR(10) NOT NULL,
    vl_preco_produto DECIMAL(15,2) NOT NULL,
    vl_taxa_produto DECIMAL(15,2) NOT NULL,
    dt_registro_produto DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT chk_preco_produto CHECK(
        vl_preco_produto >= 0
    ),
    CONSTRAINT chk_taxa_produto CHECK(
        vl_taxa_produto >= 0
    ), 
    CONSTRAINT chk_situacao_produto CHECK(
        ds_situacao_produto IN ('ATIVO', 'INATIVO', 'BLOQUEADO')
    ),
    
    CONSTRAINT pk_id_produto PRIMARY KEY (id_produto),
    CONSTRAINT uq_nm_produto UNIQUE (nm_produto)
)

COMMIT;