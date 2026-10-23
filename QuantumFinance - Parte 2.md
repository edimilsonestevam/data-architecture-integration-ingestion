## Proposta de Arquitetura de Dados - QuantumFinance

**Diagrama Entidade Relacionamento (ER)**

![ER](image/ER.png)

---

**Linguagem de Definição de Dados (DDL)**

1. Script de Criação de Tabela

```python
CREATE  TABLE mysql.tb_cliente ( 
	pk_id_cliente        INT   NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	nm_primeiro_cliente  VARCHAR(100)   NOT NULL,
	nm_segundo_cliente   VARCHAR(100),
	nm_ultimo_cliente    VARCHAR(100)   NOT NULL,
	id_idade_cliente     INT   NOT NULL,
	tp_situacao_civil_cliente VARCHAR(10)   NOT NULL,
	tp_sexo_cliente      VARCHAR(9)   NOT NULL,
	ds_profissao_cliente VARCHAR(100)   NOT NULL,
	vl_renda_bruta_cliente DECIMAL(15,2)   NOT NULL,
	ds_endereco_rua_cliente VARCHAR(100)   NOT NULL,
	id_endereco_numero_cliente INT   NOT NULL,
	id_endereco_andar_cliente INT,
	id_endereco_cep_cliente INT   NOT NULL,
	ds_endereco_bairro_cliente VARCHAR(100)   NOT NULL,
	ds_endereco_cidade_cliente VARCHAR(100)   NOT NULL,
	ds_endereco_estado_cliente VARCHAR(100)   NOT NULL,
	ds_endereco_pais_cliente VARCHAR(100)   NOT NULL,
	id_ddi_telefone_fixo_cliente INT,
	id_ddd_telefone_fixo_cliente INT,
	id_telefone_fixo_cliente INT,
	id_ddi_telefone_movel_cliente INT   NOT NULL,
	id_ddd_telefone_movel_cliente INT   NOT NULL,
	id_telefone_movel_cliente INT   NOT NULL,
	ds_email_cliente     VARCHAR(50)   NOT NULL,
	dt_cadastro_cliente DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	tp_segmento_cliente  VARCHAR(16) NOT NULL,
	tp_sistema_situacao_cliente VARCHAR(8) NOT NULL,

	CONSTRAINT pk_id_cliente PRIMARY KEY (pk_id_cliente)
 );
```

```python
		<código fonte>
```

```python
		<código fonte>
```

```python
		<código fonte>	
```

```python
CREATE  TABLE mysql.tb_transacoes_cliente ( 
	pk_id_transacoes_cliente INT   NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	dt_transacoes_cliente DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	tp_transacoes_cliente CHAR(3)   NOT NULL,
	vl_transacoes_cliente DECIMAL(15,2)   NOT NULL,
	ds_transacoes_cliente VARCHAR(100),
	fk_id_cliente        INT   NOT NULL,

	CONSTRAINT pk_id_transacoes_cliente PRIMARY KEY (pk_id_transacoes_cliente),
	CONSTRAINT fk_id_cliente FOREIGN KEY (fk_id_cliente) 
	REFERENCES mysql.tb_cliente (pk_id_cliente) 
	ON DELETE CASCADE;
 );
```

2. Script de Inclusão de Dados

```python
		<código fonte>
```

```python
		<código fonte>
```

```python
		<código fonte>
```

```python
		<código fonte>
```
