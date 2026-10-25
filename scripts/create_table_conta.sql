CREATE  TABLE tb_conta ( 
    id_conta INT NOT NULL AUTO_INCREMENT,
    ds_tipo_conta VARCHAR(20) NOT NULL,
    vl_saldo_conta DECIMAL(15,2) NOT NULL,  
    dt_registro_conta DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ds_situacao_conta VARCHAR(9) NOT NULL,
    id_cliente INT NOT NULL,
    
    CONSTRAINT chk_saldo_conta CHECK (
        vl_saldo_conta >= 0
    ),
    
    CONSTRAINT chk_situacao_conta CHECK (
        ds_situacao_conta IN ('ATIVA', 'INATIVA', 'BLOQUEADA')
    ),
    
    CONSTRAINT pk_id_conta PRIMARY KEY (id_conta),
    CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES tb_cliente(id_cliente)
    ON DELETE RESTRICT
    ON UPDATE CASCADE 
);

COMMIT;