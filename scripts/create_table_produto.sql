CREATE TABLE tb_produto(
    id_produto INT NOT NULL AUTO_INCREMENT,
    nm_produto VARCHAR(100) NOT NULL,
    ds_produto VARCHAR(255),
    vl_preco_produto DECIMAL(15,2) NOT NULL,
    dt_registro_produto DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_conta INT NOT NULL,
    
    CONSTRAINT pk_id_produto PRIMARY KEY (id_produto),
    CONSTRAINT uq_nm_produto UNIQUE (nm_produto),
    CONSTRAINT fk_id_conta FOREIGN KEY (id_conta) REFERENCES tb_conta(id_conta)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

COMMIT;