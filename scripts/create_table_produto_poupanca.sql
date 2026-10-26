CREATE TABLE tb_produto_poupanca(
    id_produto_poupanca INT NOT NULL AUTO_INCREMENT,
    id_produto INT NOT NULL,
    
    CONSTRAINT pk_id_produto_poupanca PRIMARY KEY (id_produto),
    CONSTRAINT fk_id_produto_poupanca FOREIGN KEY (id_produto) REFERENCES tb_produto(id_produto)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

COMMIT;