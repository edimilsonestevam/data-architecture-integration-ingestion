CREATE  TABLE tb_conta ( 
    id_conta INT NOT NULL AUTO_INCREMENT,
    ds_tipo_conta VARCHAR(20) NOT NULL,
    vl_conta DECIMAL(15,2) NOT NULL,  
    dt_registro_conta DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ds_situacao_conta VARCHAR(9) NOT NULL,
    id_cliente INT NOT NULL,
    id_agencia_conta INT NOT NULL,
    
    CONSTRAINT chk_tipo_conta CHECK(
        ds_tipo_conta IN ('CORRENTE', 'POUPANCA', 'SALARIO', 'INVESTIMENTO')
    ),
    CONSTRAINT chk_conta CHECK (
        vl_conta >= 0
    ),
    
    CONSTRAINT chk_situacao_conta CHECK (
        ds_situacao_conta IN ('ATIVA', 'INATIVA', 'SUSPENSA')
    ),
    
    CONSTRAINT pk_id_conta PRIMARY KEY (id_conta),
    CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES tb_cliente(id_cliente)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
    CONSTRAINT fk_id_agencia_conta FOREIGN KEY (id_agencia_conta) REFERENCES tb_agencia(id_agencia)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

COMMIT;