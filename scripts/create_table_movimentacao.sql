CREATE TABLE tb_movimentacao(
    id_movimentacao INT NOT NULL AUTO_INCREMENT,
    dt_registro_movimentacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ds_tipo_movimentacao VARCHAR(20) NOT NULL,
    ds_situacao_movimentacao VARCHAR(15) NOT NULL,
    ds_movimentacao VARCHAR(255),
    vl_movimentacao DECIMAL(15,2) NOT NULL,
    id_conta INT NOT NULL,

    CONSTRAINT chk_tipo_movimentacao CHECK(
        ds_tipo_movimentacao IN ('CREDITO', 'DEBITO')
    ),
    CONSTRAINT chk_situacao_movimentacao CHECK(
        ds_situacao_movimentacao IN ('PENDENTE', 'CONCLUIDA', 'CANCELADA', 'REJEITADA')
    ),
    CONSTRAINT chk_valor_movimentacao CHECK(
        vl_movimentacao >= 0
    ),

    CONSTRAINT pk_id_movimentacao PRIMARY KEY (id_movimentacao),
    CONSTRAINT fk_id_conta_movimentacao FOREIGN KEY (id_conta) REFERENCES tb_conta(id_conta)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB;