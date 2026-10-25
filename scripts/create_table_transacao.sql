CREATE TABLE tb_transacao(
    id_transacao INT NOT NULL AUTO_INCREMENT,
    dt_registro_transacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ds_tipo_transacao VARCHAR(20) NOT NULL,
    ds_situacao_transacao VARCHAR(15) NOT NULL,
    ds_descricao_transacao VARCHAR(100),
    vl_transacao DECIMAL(15,2) NOT NULL,
    id_investimento INT NOT NULL,
    
    CONSTRAINT chk_tipo_transacao CHECK(
        ds_tipo_transacao IN ('APLICACAO', 'RESGATE', 'COMPRA', 'VENDA')
    ),
    CONSTRAINT chk_situacao_transacao CHECK (
        ds_situacao_transacao IN ('PENDENTE', 'CONCLUIDA', 'CANCELADA', 'REJEITADA')
    ),
    CONSTRAINT chk_valor_transacao CHECK(
        vl_transacao > 0
    ),
    
    CONSTRAINT pk_id_transacao PRIMARY KEY (id_transacao),
    CONSTRAINT fk_id_investimento FOREIGN KEY (id_investimento) REFERENCES tb_investimento(id_investimento)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

COMMIT;