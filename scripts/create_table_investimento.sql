CREATE TABLE tb_investimento(
    id_investimento INT NOT NULL AUTO_INCREMENT,
    nm_investimento VARCHAR(100) NOT NULL,
    vl_aplicado_investimento DECIMAL(15,2) NOT NULL,
    vl_rendimento_investimento DECIMAL(15,2) NOT NULL,
    vl_total_investimento DECIMAL(15,2) NOT NULL,
    dt_registro_investimento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    dt_vencimento_investimento DATE NOT NULL,
    id_produto INT NOT NULL,
    id_conta INT NOT NULL,
    
    CONSTRAINT chk_valor_investimento CHECK(
        vl_aplicado_investimento > 0
    ),
    CONSTRAINT chk_rendimento_investimento CHECK(
        vl_rendimento_investimento >= 0
    ),
    CONSTRAINT chk_total_investimento CHECK(
        vl_total_investimento = vl_aplicado_investimento + vl_rendimento_investimento
    ),
    CONSTRAINT chk_vencimento_investimento CHECK(
        dt_vencimento_investimento >= DATE(dt_registro_investimento)
    ),
    
    CONSTRAINT pk_id_investimento PRIMARY KEY (id_investimento),
    CONSTRAINT fk_id_produto FOREIGN KEY (id_produto) REFERENCES tb_produto(id_produto)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
    CONSTRAINT fk_id_conta_investimento FOREIGN KEY (id_conta) REFERENCES tb_conta(id_conta)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

COMMIT;