/* App_Streamiing_Logico: */

CREATE TABLE Streaming (
    ID_Stream NUMERIC(7) PRIMARY KEY,
    Nome_Stream VARCHAR(25)
);

CREATE TABLE Genero (
    ID_Genero NUMERIC(3) PRIMARY KEY,
    Nome_Genero VARCHAR(15)
);

CREATE TABLE Episodio (
    ID_Episodio NUMERIC(7) PRIMARY KEY,
    fk_Serie_fk_Streaming_ID_Stream NUMERIC(7)
);

CREATE TABLE Diretor (
    ID_Diretor NUMERIC(5) PRIMARY KEY,
    Nome VARCHAR(25)
);

CREATE TABLE Plano_Assinatura_Usuario (
    ID_Usuario NUMERIC(8) PRIMARY KEY,
    Metodo_Pagamento VARCHAR(6),
    Email VARCHAR(300),
    Nome VARCHAR(25),
    Senha VARCHAR(15)
);

CREATE TABLE Elenco (
    LIsta_Nomes VARCHAR(500)
);

CREATE TABLE Produtora (
    ID_Produtora NUMERIC(5) PRIMARY KEY,
    Nome VARCHAR(25)
);

CREATE TABLE Filme (
    fk_Streaming_ID_Stream NUMERIC(7) PRIMARY KEY,
    Duracao NUMERIC(8)
);

CREATE TABLE Serie (
    fk_Streaming_ID_Stream NUMERIC(7) PRIMARY KEY
);

CREATE TABLE Plano_Solo (
    ID_Plano NUMERIC(1) PRIMARY KEY,
    Valor NUMERIC(5)
);

CREATE TABLE Plano_Familia (
    ID_Plano NUMERIC(1) PRIMARY KEY,
    Valor NUMERIC(7)
);

CREATE TABLE _Assiste (
    fk_Plano_Assinatura_Usuario_ID_Usuario NUMERIC(8),
    fk_Streaming_ID_Stream NUMERIC(7)
);

CREATE TABLE Usuario_Incluso (
    ID_Usuario NUMERIC(7) PRIMARY KEY,
    fk_Plano_Familia_ID_Plano NUMERIC(1),
    Email VARCHAR(300),
    Senha VARCHAR(15),
    Nome VARCHAR(25)
);

CREATE TABLE _Produz (
    fk_Produtora_ID_Produtora NUMERIC(5),
    fk_Streaming_ID_Stream NUMERIC(7)
);

CREATE TABLE _Possui (
    fk_Streaming_ID_Stream NUMERIC(7),
    fk_Genero_ID_Genero NUMERIC(3)
);

CREATE TABLE _Dirige (
    fk_Diretor_ID_Diretor NUMERIC(5),
    fk_Streaming_ID_Stream NUMERIC(7)
);

CREATE TABLE Playlist_Assistira (
    ID_Playlist NUMERIC(7) PRIMARY KEY,
    fk_Streaming_ID_Stream NUMERIC(7),
    fk_Plano_Assinatura_Usuario_ID_Usuario NUMERIC(8)
);

CREATE TABLE Avaliacao_Assistiu (
    ID_Avaliacao NUMERIC(7) PRIMARY KEY,
    fk_Plano_Assinatura_Usuario_ID_Usuario NUMERIC(8),
    fk_Streaming_ID_Stream NUMERIC(7),
    Pontuacao NUMERIC(1)
);

CREATE TABLE Metodo_Pagamento (
    ID_Metodo NUMERIC(1) PRIMARY KEY
);

CREATE TABLE Pix (
    ID_Transacao_Pix NUMERIC(30) PRIMARY KEY
);

CREATE TABLE Cartao (
    ID_Cartao NUMERIC(7) PRIMARY KEY,
    Tipo VARCHAR(7)
);
 
ALTER TABLE Episodio ADD CONSTRAINT FK_Episodio_2
    FOREIGN KEY (fk_Serie_fk_Streaming_ID_Stream)
    REFERENCES Serie (fk_Streaming_ID_Stream)
    ON DELETE RESTRICT;
 
ALTER TABLE Filme ADD CONSTRAINT FK_Filme_2
    FOREIGN KEY (fk_Streaming_ID_Stream)
    REFERENCES Streaming (ID_Stream)
    ON DELETE CASCADE;
 
ALTER TABLE Serie ADD CONSTRAINT FK_Serie_2
    FOREIGN KEY (fk_Streaming_ID_Stream)
    REFERENCES Streaming (ID_Stream)
    ON DELETE CASCADE;
 
ALTER TABLE _Assiste ADD CONSTRAINT FK__Assiste_1
    FOREIGN KEY (fk_Plano_Assinatura_Usuario_ID_Usuario)
    REFERENCES Plano_Assinatura_Usuario (ID_Usuario);
 
ALTER TABLE _Assiste ADD CONSTRAINT FK__Assiste_2
    FOREIGN KEY (fk_Streaming_ID_Stream)
    REFERENCES Streaming (ID_Stream);
 
ALTER TABLE Usuario_Incluso ADD CONSTRAINT FK_Usuario_Incluso_2
    FOREIGN KEY (fk_Plano_Familia_ID_Plano)
    REFERENCES Plano_Familia (ID_Plano)
    ON DELETE RESTRICT;
 
ALTER TABLE _Produz ADD CONSTRAINT FK__Produz_1
    FOREIGN KEY (fk_Produtora_ID_Produtora)
    REFERENCES Produtora (ID_Produtora);
 
ALTER TABLE _Produz ADD CONSTRAINT FK__Produz_2
    FOREIGN KEY (fk_Streaming_ID_Stream)
    REFERENCES Streaming (ID_Stream);
 
ALTER TABLE _Possui ADD CONSTRAINT FK__Possui_1
    FOREIGN KEY (fk_Streaming_ID_Stream)
    REFERENCES Streaming (ID_Stream);
 
ALTER TABLE _Possui ADD CONSTRAINT FK__Possui_2
    FOREIGN KEY (fk_Genero_ID_Genero)
    REFERENCES Genero (ID_Genero);
 
ALTER TABLE _Dirige ADD CONSTRAINT FK__Dirige_1
    FOREIGN KEY (fk_Diretor_ID_Diretor)
    REFERENCES Diretor (ID_Diretor);
 
ALTER TABLE _Dirige ADD CONSTRAINT FK__Dirige_2
    FOREIGN KEY (fk_Streaming_ID_Stream)
    REFERENCES Streaming (ID_Stream);
 
ALTER TABLE Playlist_Assistira ADD CONSTRAINT FK_Playlist_Assistira_2
    FOREIGN KEY (fk_Streaming_ID_Stream)
    REFERENCES Streaming (ID_Stream);
 
ALTER TABLE Playlist_Assistira ADD CONSTRAINT FK_Playlist_Assistira_3
    FOREIGN KEY (fk_Plano_Assinatura_Usuario_ID_Usuario)
    REFERENCES Plano_Assinatura_Usuario (ID_Usuario);
 
ALTER TABLE Avaliacao_Assistiu ADD CONSTRAINT FK_Avaliacao_Assistiu_2
    FOREIGN KEY (fk_Plano_Assinatura_Usuario_ID_Usuario)
    REFERENCES Plano_Assinatura_Usuario (ID_Usuario);
 
ALTER TABLE Avaliacao_Assistiu ADD CONSTRAINT FK_Avaliacao_Assistiu_3
    FOREIGN KEY (fk_Streaming_ID_Stream)
    REFERENCES Streaming (ID_Stream);