CREATE TABLE tb_produto_poupanca(
    id_produto_poupanca INT NOT NULL AUTO_INCREMENT,
    nm_produto_poupanca VARCHAR(100) NOT NULL,
    vl_produto_poupanca DECIMAL(15,2) NOT NULL,
    dt_registro_produto_poupanca DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ds_situacao_produto_poupanca VARCHAR(10) NOT NULL,
    
    CONSTRAINT chk_vl_produto_poupanca CHECK(
        vl_produto_poupanca >= 0
    ),
    CONSTRAINT chk_situacao_produto_poupanca CHECK(
        ds_situacao_produto_poupanca IN ('ATIVA', 'INATIVA', 'SUSPENSA')
    ),
    
    CONSTRAINT pk_id_produto_poupanca PRIMARY KEY (id_produto_poupanca),
    CONSTRAINT uq_nm_produto_poupanca UNIQUE (nm_produto_poupanca)
);

COMMIT;