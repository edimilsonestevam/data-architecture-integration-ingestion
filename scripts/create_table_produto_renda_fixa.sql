CREATE TABLE tb_produto_renda_fixa(
    id_produto_renda_fixa INT NOT NULL AUTO_INCREMENT,
    id_produto INT NOT NULL,

    CONSTRAINT pk_id_produto_renda_fixa PRIMARY KEY (id_produto_renda_fixa),
    CONSTRAINT uq_nm_produto_renda_fixa UNIQUE (nm_produto_renda_fixa),
    CONSTRAINT fk_id_produto_renda_fixa FOREIGN KEY (id_produto) REFERENCES tb_produto(id_produto)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

COMMIT;