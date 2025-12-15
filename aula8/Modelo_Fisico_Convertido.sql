/* modeloLogico: */

CREATE TABLE Produto (
    ID_Produto Numeric(3) PRIMARY KEY,
    Nome_Produto Varchar(3),
    Preco Numeric(7),
    Qtde_Estoque Numeric(4)
);

CREATE TABLE Cliente (
    ID_Cliente Numeric(3) PRIMARY KEY,
    Nome_Cliente Varchar(10),
    CPF Char(11),
    Data_Nasc Date
);

CREATE TABLE Compra (
    ID_Compra Numeric(3) PRIMARY KEY,
    ID_Cliente Numeric(3),
    ID_Produto Numeric(3),
    Data_Venda Date,
    Quantidade Numeric(4)
);
 
ALTER TABLE Compra ADD CONSTRAINT FK_Compra_2
    FOREIGN KEY (ID_Cliente???)
    REFERENCES ??? (???);
 
ALTER TABLE Compra ADD CONSTRAINT FK_Compra_3
    FOREIGN KEY (ID_Produto???)
    REFERENCES ??? (???);