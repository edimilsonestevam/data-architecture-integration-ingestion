CREATE TABLE tb_produto_renda_fixa(
    id_produto_renda_fixa INT NOT NULL AUTO_INCREMENT,
    nm_produto_renda_fixa VARCHAR(100) NOT NULL,
    ds_produto_renda_fixa VARCHAR(255),
    ds_situacao_produto_renda_fixa VARCHAR(10) NOT NULL,
    vl_produto_renda_fixa DECIMAL(15,2) NOT NULL,
    vl_taxa_produto_renda_fixa DECIMAL(5,2) NOT NULL,
    ds_periodicidade_taxa_produto_renda_fixa VARCHAR(20) NOT NULL,
    dt_registro_produto_renda_fixa DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT chk_produto_renda_fixa CHECK(
        vl_produto_renda_fixa >= 0
    ),
    CONSTRAINT chk_taxa_produto_renda_fixa CHECK(
        vl_taxa_produto_renda_fixa BETWEEN 000.00 AND 100.00
    ),
    CONSTRAINT chk_periodicidade_taxa_produto_renda_fixa CHECK(
        ds_periodicidade_taxa_produto_renda_fixa IN ('DIARIA', 'SEMANAL', 'MENSAL', 'ANUAL')
    ), 
    CONSTRAINT chk_situacao_produto_renda_fixa CHECK(
        ds_situacao_produto_renda_fixa IN ('ATIVO', 'INATIVO', 'SUSPENSO')
    ),
    
    CONSTRAINT pk_id_produto_renda_fixa PRIMARY KEY (id_produto_renda_fixa),
    CONSTRAINT uq_nm_produto_renda_fixa UNIQUE (nm_produto_renda_fixa)
);

COMMIT;