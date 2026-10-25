CREATE TABLE tb_investimento(
    id_investimento INT NOT NULL AUTO_INCREMENT,
    nm_investimento VARCHAR(100) NOT NULL,
    vl_investimento DECIMAL(15,2) NOT NULL,
    dt_registro_investimento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_produto INT NOT NULL,
    id_conta INT NOT NULL,
    
    CONSTRAINT chk_valor_investimento CHECK(
        vl_investimento >= 0
    ),
    
    CONSTRAINT pk_id_investimento PRIMARY KEY (id_investimento),
    
    CONSTRAINT fk_id_produto FOREIGN KEY (id_produto) REFERENCES tb_produto(id_produto)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
    
    CONSTRAINT fk_id_conta FOREIGN KEY (id_conta) REFERENCES tb_conta(id_conta)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

COMMIT;