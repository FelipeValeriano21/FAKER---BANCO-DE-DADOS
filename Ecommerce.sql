create database Ecommerce; 
use Ecommerce; 

  CREATE TABLE TB_FORNECEDOR (
    id_Fornecedor INTEGER   NOT NULL ,
    Nome VARCHAR(45)    ,
    CEP VARCHAR(11)    ,
    Complemento  VARCHAR(30)    ,
    Status_Fornecedor BOOL    ,
    Telefone_Fornecedor VARCHAR(15)      ,
    PRIMARY KEY(id_Fornecedor));




CREATE TABLE TB_ESTOQUE (
  id_Estoque INTEGER   NOT NULL ,
  Quantidade_Entrada INTEGER    ,
  Data_Entrada DATETIME    ,
  Quantidade_Saida INTEGER    ,
  Data_Saida INTEGER      ,
PRIMARY KEY(id_Estoque));




CREATE TABLE TB_MOEDA (
  id_Moeda INTEGER   NOT NULL ,
  Nome VARCHAR(20)      ,
PRIMARY KEY(id_Moeda));




CREATE TABLE TB_UNIDADE (
  id_Unidade INTEGER   NOT NULL ,
  Nome_Unidade VARCHAR(50)    ,
  CEP_Unidade VARCHAR(11)    ,
  Telefone_Unidade VARCHAR(15)    ,
  Email_Unidade VARCHAR(50)    ,
  Complemento_Unidade VARCHAR(30)    ,
  Status_Unidade BOOL      ,
PRIMARY KEY(id_Unidade));




CREATE TABLE TB_CLIENTE (
  id_Cliente INTEGER   NOT NULL ,
  Nome_Cliente VARCHAR(45)    ,
  Telefone_Cliente VARCHAR(15)    ,
  E_mail_Cliente VARCHAR(50)    ,
  CEP_Cliente VARCHAR(11)    ,
  Data_Nasc_Cliente DATE    ,
  CPF_Cliente VARCHAR(13)    ,
  Status_Cliente BOOLEAN    ,
  Complemento_Cliente VARCHAR(30)      ,
PRIMARY KEY(id_Cliente));




CREATE TABLE Status_Pedido (
  idStatus_Pedido INTEGER   NOT NULL ,
  Situacao VARCHAR(15)      ,
PRIMARY KEY(idStatus_Pedido));




CREATE TABLE Marca (
  Id_Marca INTEGER   NOT NULL ,
  nome_Marca VARCHAR(30)      ,
PRIMARY KEY(Id_Marca));




CREATE TABLE TB_VENDEDOR (
  id_Vendedor INTEGER   NOT NULL ,
  Nome_Vendedor VARCHAR(45)    ,
  Telefone_Vendedor VARCHAR(15)    ,
  E_mail_Vendedor VARCHAR(50)    ,
  CEP_Vendedor VARCHAR(11)    ,
  CPF_Vendedor VARCHAR(15)    ,
  Genero_Vendedor VARCHAR(20)    ,
  Status_Vendedor BOOL    ,
  Complemento_Vendedor VARCHAR(30)    ,
  Data_Nascimento_Vendedor DATE      ,
PRIMARY KEY(id_Vendedor));




CREATE TABLE TB_CATEGORIA (
  idTB_CATEGORIA INTEGER   NOT NULL ,
  Nome_Categoria VARCHAR(20)      ,
PRIMARY KEY(idTB_CATEGORIA));




CREATE TABLE TB_PAGAMENTO (
  id_Pagamento INTEGER   NOT NULL ,
  TB_MOEDA_id_Moeda INTEGER   NOT NULL ,
  Tipo VARCHAR(20)    ,
  Parcela INT(3)      ,
PRIMARY KEY(id_Pagamento, TB_MOEDA_id_Moeda)  ,
  FOREIGN KEY(TB_MOEDA_id_Moeda)
    REFERENCES TB_MOEDA(id_Moeda));


CREATE INDEX TB_PAGAMENTO_FKIndex1 ON TB_PAGAMENTO (TB_MOEDA_id_Moeda);


CREATE INDEX IFK_Rel_05 ON TB_PAGAMENTO (TB_MOEDA_id_Moeda);


CREATE TABLE TB_PRODUTO (
  id_Produto INTEGER   NOT NULL ,
  Status_Produto BOOL   NOT NULL ,
  Marca_Id_Marca INTEGER   NOT NULL ,
  TB_CATEGORIA_idTB_CATEGORIA INTEGER   NOT NULL ,
  Nome VARCHAR(50)    ,
  Preco_unitario float    ,
  Descricao VARCHAR(250)    ,
  Marca VARCHAR(20)    ,
  Data_Chegada DATETIME      ,
PRIMARY KEY(id_Produto, Status_Produto)    ,
  FOREIGN KEY(TB_CATEGORIA_idTB_CATEGORIA)
    REFERENCES TB_CATEGORIA(idTB_CATEGORIA),
  FOREIGN KEY(Marca_Id_Marca)
    REFERENCES Marca(Id_Marca));


CREATE INDEX TB_PRODUTO_FKIndex1 ON TB_PRODUTO (TB_CATEGORIA_idTB_CATEGORIA);
CREATE INDEX TB_PRODUTO_FKIndex2 ON TB_PRODUTO (Marca_Id_Marca);


CREATE INDEX IFK_Rel_17 ON TB_PRODUTO (TB_CATEGORIA_idTB_CATEGORIA);
CREATE INDEX IFK_Rel_17 ON TB_PRODUTO (Marca_Id_Marca);


CREATE TABLE TB_PEDIDO (
  id_Pedido INTEGER   NOT NULL ,
  TB_UNIDADE_id_Unidade INTEGER   NOT NULL ,
  TB_VENDEDOR_id_Vendedor INTEGER   NOT NULL ,
  Status_Pedido_idStatus_Pedido INTEGER   NOT NULL ,
  TB_CLIENTE_id_Cliente INTEGER   NOT NULL ,
  Preco_Total float    ,
  Data_Pedido DATETIME   NOT NULL   ,
PRIMARY KEY(id_Pedido)        ,
  FOREIGN KEY(TB_CLIENTE_id_Cliente)
    REFERENCES TB_CLIENTE(id_Cliente),
  FOREIGN KEY(Status_Pedido_idStatus_Pedido)
    REFERENCES Status_Pedido(idStatus_Pedido),
  FOREIGN KEY(TB_VENDEDOR_id_Vendedor)
    REFERENCES TB_VENDEDOR(id_Vendedor),
  FOREIGN KEY(TB_UNIDADE_id_Unidade)
    REFERENCES TB_UNIDADE(id_Unidade));


CREATE INDEX TB_PEDIDO_FKIndex1 ON TB_PEDIDO (TB_CLIENTE_id_Cliente);
CREATE INDEX TB_PEDIDO_FKIndex2 ON TB_PEDIDO (Status_Pedido_idStatus_Pedido);
CREATE INDEX TB_PEDIDO_FKIndex3 ON TB_PEDIDO (TB_VENDEDOR_id_Vendedor);
CREATE INDEX TB_PEDIDO_FKIndex4 ON TB_PEDIDO (TB_UNIDADE_id_Unidade);


CREATE INDEX IFK_Rel_01 ON TB_PEDIDO (TB_CLIENTE_id_Cliente);
CREATE INDEX IFK_Rel_19 ON TB_PEDIDO (Status_Pedido_idStatus_Pedido);
CREATE INDEX IFK_Rel_19 ON TB_PEDIDO (TB_VENDEDOR_id_Vendedor);
CREATE INDEX IFK_Rel_20 ON TB_PEDIDO (TB_UNIDADE_id_Unidade);


CREATE TABLE TB_NOTAFISCAL (
  id_NotaFiscal INTEGER   NOT NULL ,
  TB_PEDIDO_id_Pedido INTEGER   NOT NULL   ,
PRIMARY KEY(id_NotaFiscal)  ,
  FOREIGN KEY(TB_PEDIDO_id_Pedido)
    REFERENCES TB_PEDIDO(id_Pedido));


CREATE INDEX TB_NOTAFISCAL_FKIndex1 ON TB_NOTAFISCAL (TB_PEDIDO_id_Pedido);


CREATE INDEX IFK_Rel_04 ON TB_NOTAFISCAL (TB_PEDIDO_id_Pedido);


CREATE TABLE TB_PRODUTO_FORNECEDOR (
  TB_PRODUTO_Status_Produto BOOL   NOT NULL ,
  TB_PRODUTO_id_Produto INTEGER   NOT NULL ,
  TB_FORNECEDOR_id_Fornecedor INTEGER   NOT NULL ,
  Quantidade INTEGER      ,
PRIMARY KEY(TB_PRODUTO_Status_Produto, TB_PRODUTO_id_Produto, TB_FORNECEDOR_id_Fornecedor)    ,
  FOREIGN KEY(TB_PRODUTO_id_Produto, TB_PRODUTO_Status_Produto)
    REFERENCES TB_PRODUTO(id_Produto, Status_Produto),
  FOREIGN KEY(TB_FORNECEDOR_id_Fornecedor)
    REFERENCES TB_FORNECEDOR(id_Fornecedor));


CREATE INDEX TB_PRODUTO_has_TB_FORNECEDOR_FKIndex1 ON TB_PRODUTO_FORNECEDOR (TB_PRODUTO_id_Produto, TB_PRODUTO_Status_Produto);
CREATE INDEX TB_PRODUTO_has_TB_FORNECEDOR_FKIndex2 ON TB_PRODUTO_FORNECEDOR (TB_FORNECEDOR_id_Fornecedor);


CREATE INDEX IFK_Rel_16 ON TB_PRODUTO_FORNECEDOR (TB_PRODUTO_id_Produto, TB_PRODUTO_Status_Produto);
CREATE INDEX IFK_Rel_17 ON TB_PRODUTO_FORNECEDOR (TB_FORNECEDOR_id_Fornecedor);


CREATE TABLE TB_PRODUTO_TB_ESTOQUE (
  TB_PRODUTO_Status_Produto BOOL   NOT NULL ,
  TB_PRODUTO_id_Produto INTEGER   NOT NULL ,
  TB_ESTOQUE_id_Estoque INTEGER   NOT NULL   ,
PRIMARY KEY(TB_PRODUTO_Status_Produto, TB_PRODUTO_id_Produto, TB_ESTOQUE_id_Estoque)    ,
  FOREIGN KEY(TB_PRODUTO_id_Produto, TB_PRODUTO_Status_Produto)
    REFERENCES TB_PRODUTO(id_Produto, Status_Produto),
  FOREIGN KEY(TB_ESTOQUE_id_Estoque)
    REFERENCES TB_ESTOQUE(id_Estoque));


CREATE INDEX TB_PRODUTO_has_TB_ESTOQUE_FKIndex1 ON TB_PRODUTO_TB_ESTOQUE (TB_PRODUTO_id_Produto, TB_PRODUTO_Status_Produto);
CREATE INDEX TB_PRODUTO_has_TB_ESTOQUE_FKIndex2 ON TB_PRODUTO_TB_ESTOQUE (TB_ESTOQUE_id_Estoque);


CREATE INDEX IFK_Rel_16 ON TB_PRODUTO_TB_ESTOQUE (TB_PRODUTO_id_Produto, TB_PRODUTO_Status_Produto);
CREATE INDEX IFK_Rel_17 ON TB_PRODUTO_TB_ESTOQUE (TB_ESTOQUE_id_Estoque);


CREATE TABLE TB_ITENS_DE_PEDIDO (
  TB_PEDIDO_id_Pedido INTEGER   NOT NULL ,
  TB_PRODUTO_id_Produto INTEGER   NOT NULL ,
  TB_PRODUTO_Status_Produto BOOL   NOT NULL ,
  Quantidade INT(4)    ,
  Preco float,
PRIMARY KEY(TB_PEDIDO_id_Pedido, TB_PRODUTO_id_Produto, TB_PRODUTO_Status_Produto)    ,
  FOREIGN KEY(TB_PEDIDO_id_Pedido)
    REFERENCES TB_PEDIDO(id_Pedido),
  FOREIGN KEY(TB_PRODUTO_id_Produto, TB_PRODUTO_Status_Produto)
    REFERENCES TB_PRODUTO(id_Produto, Status_Produto));


CREATE INDEX TB_PEDIDO_has_TB_PRODUTO_FKIndex1 ON TB_ITENS_DE_PEDIDO (TB_PEDIDO_id_Pedido);
CREATE INDEX TB_PEDIDO_has_TB_PRODUTO_FKIndex2 ON TB_ITENS_DE_PEDIDO (TB_PRODUTO_id_Produto, TB_PRODUTO_Status_Produto);


CREATE INDEX IFK_Rel_02 ON TB_ITENS_DE_PEDIDO (TB_PEDIDO_id_Pedido);
CREATE INDEX IFK_Rel_03 ON TB_ITENS_DE_PEDIDO (TB_PRODUTO_id_Produto, TB_PRODUTO_Status_Produto);


CREATE TABLE TB_CAIXA (
  id_Caixa INTEGER   NOT NULL ,
  TB_PAGAMENTO_TB_MOEDA_id_Moeda INTEGER   NOT NULL ,
  TB_PAGAMENTO_id_Pagamento INTEGER   NOT NULL ,
  TB_NOTAFISCAL_id_NotaFiscal INTEGER   NOT NULL ,
  Valor_Total float    ,
  Date DATETIME      ,
PRIMARY KEY(id_Caixa)    ,
  FOREIGN KEY(TB_NOTAFISCAL_id_NotaFiscal)
    REFERENCES TB_NOTAFISCAL(id_NotaFiscal),
  FOREIGN KEY(TB_PAGAMENTO_id_Pagamento, TB_PAGAMENTO_TB_MOEDA_id_Moeda)
    REFERENCES TB_PAGAMENTO(id_Pagamento, TB_MOEDA_id_Moeda));


CREATE INDEX TB_CAIXA_FKIndex1 ON TB_CAIXA (TB_NOTAFISCAL_id_NotaFiscal);
CREATE INDEX TB_CAIXA_FKIndex2 ON TB_CAIXA (TB_PAGAMENTO_id_Pagamento, TB_PAGAMENTO_TB_MOEDA_id_Moeda);


CREATE INDEX IFK_Rel_15 ON TB_CAIXA (TB_NOTAFISCAL_id_NotaFiscal);
CREATE INDEX IFK_Rel_27 ON TB_CAIXA (TB_PAGAMENTO_id_Pagamento, TB_PAGAMENTO_TB_MOEDA_id_Moeda);


CREATE TABLE TB_COMISSAO (
  id_Comissao INTEGER   NOT NULL ,
  TB_CAIXA_id_Caixa INTEGER   NOT NULL ,
  Taxa FLOAT(4)    ,
  Valor_Comissao FLOAT(6)      ,
PRIMARY KEY(id_Comissao)  ,
  FOREIGN KEY(TB_CAIXA_id_Caixa)
    REFERENCES TB_CAIXA(id_Caixa));


CREATE INDEX TB_COMISSAO_FKIndex2 ON TB_COMISSAO (TB_CAIXA_id_Caixa);


CREATE INDEX IFK_Rel_26 ON TB_COMISSAO (TB_CAIXA_id_Caixa);




