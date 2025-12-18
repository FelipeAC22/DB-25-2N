/* Avaliativa_Logico: */

CREATE TABLE Usuario (
    ID_Usuario NUMERIC(7) PRIMARY KEY,
    fk_Assinatura_ID_Assinatura VARCHAR(7),
    Nome VARCHAR(25),
    Email VARCHAR(300),
    Senha VARCHAR(15)
);

CREATE TABLE Conteudo (
    ID_Conteudo NUMERIC(7) PRIMARY KEY,
    fk_Capa_ID_Capa VARCHAR(7),
    Nome VARCHAR(25),
    Duracao NUMERIC(7)
);

CREATE TABLE Musica (
    fk_Conteudo_ID_Conteudo NUMERIC(7) PRIMARY KEY
);

CREATE TABLE Podcast (
    fk_Conteudo_ID_Conteudo NUMERIC(7) PRIMARY KEY
);

CREATE TABLE _Ouve (
    fk_Usuario_ID_Usuario NUMERIC(7),
    fk_Conteudo_ID_Conteudo NUMERIC(7)
);

CREATE TABLE Playlist_Ouvira (
    ID_Playlist NUMERIC(7) PRIMARY KEY,
    fk_Conteudo_ID_Conteudo NUMERIC(7),
    fk_Usuario_ID_Usuario NUMERIC(7)
);

CREATE TABLE Podcaster (
    ID_Podcaster NUMERIC(7) PRIMARY KEY,
    Nome VARCHAR(25)
);

CREATE TABLE Artista (
    ID_Artista NUMERIC(7) PRIMARY KEY,
    Nome VARCHAR(25)
);

CREATE TABLE _Produz (
    fk_Musica_fk_Conteudo_ID_Conteudo NUMERIC(7),
    fk_Artista_ID_Artista NUMERIC(7)
);

CREATE TABLE _Produz (
    fk_Podcast_fk_Conteudo_ID_Conteudo NUMERIC(7),
    fk_Podcaster_ID_Podcaster NUMERIC(7)
);

CREATE TABLE Avaliacao_Ouviu (
    ID_Avaliacao NUMERIC(7) PRIMARY KEY,
    fk_Usuario_ID_Usuario NUMERIC(7),
    fk_Conteudo_ID_Conteudo NUMERIC(7),
    Pontos_Avaliacao NUMERIC(2)
);

CREATE TABLE Genero_Musical (
    ID_Genero NUMERIC(7) PRIMARY KEY,
    Nome VARCHAR(25)
);

CREATE TABLE _Possui (
    fk_Musica_fk_Conteudo_ID_Conteudo NUMERIC(7),
    fk_Genero_Musical_ID_Genero NUMERIC(7)
);

CREATE TABLE Capa (
    ID_Capa VARCHAR(7) PRIMARY KEY,
    Capa STRING(30)
);

CREATE TABLE _Possui (
    fk_Podcast_fk_Conteudo_ID_Conteudo NUMERIC(7),
    fk_Tipo_Atributo_8 NUMERIC(7)
);

CREATE TABLE Tipo (
    ID_Tipo NUMERIC(7) PRIMARY KEY,
    Nome VARCHAR
);

CREATE TABLE Assinatura (
    ID_Assinatura VARCHAR(7) PRIMARY KEY
);

CREATE TABLE Gratuita (
    ID_Plano NUMERIC(7),
    fk_Assinatura_ID_Assinatura VARCHAR(7),
    Valor NUMERIC(7),
    PRIMARY KEY (ID_Plano, fk_Assinatura_ID_Assinatura)
);

CREATE TABLE Premium_Solo (
    ID_Plano NUMERIC(7),
    fk_Assinatura_ID_Assinatura VARCHAR(7),
    Valor NUMERIC(7),
    PRIMARY KEY (ID_Plano, fk_Assinatura_ID_Assinatura)
);

CREATE TABLE Premium_Duo_Usuario_Incluso (
    ID_Plano NUMERIC(7),
    ID_usuario NUMERIC(7),
    fk_Assinatura_ID_Assinatura VARCHAR(7),
    Valor NUMERIC(7),
    Senha NUMERIC(15),
    Email VARCHAR(300),
    Nome VARCHAR(25),
    PRIMARY KEY (ID_Plano, fk_Assinatura_ID_Assinatura, ID_usuario)
);

CREATE TABLE Premium_Familia (
    ID_Plano NUMERIC(7),
    fk_Assinatura_ID_Assinatura VARCHAR(7),
    Valor NUMERIC(7),
    PRIMARY KEY (ID_Plano, fk_Assinatura_ID_Assinatura)
);

CREATE TABLE Metodo_Pagamento (
    ID_Metodo NUMERIC(1)
);

CREATE TABLE Cartao (
    ID_cartao NUMERIC(7) PRIMARY KEY,
    Nome_Titular VARCHAR(25),
    Cod_Seguranca NUMERIC(3),
    Tipo_Cartao VARCHAR(7)
);

CREATE TABLE Pix (
    ID_Pix NUMERIC(7) PRIMARY KEY,
    Cod_Pagamento NUMERIC(15)
);

CREATE TABLE Estudante (
    ID_Plano NUMERIC(7),
    fk_Assinatura_ID_Assinatura VARCHAR(7),
    Valor NUMERIC(7),
    PRIMARY KEY (ID_Plano, fk_Assinatura_ID_Assinatura)
);

CREATE TABLE Usuario_Incluso (
    ID_Usuario NUMERIC(7) PRIMARY KEY,
    fk_Premium_Familia_ID_Plano NUMERIC(7),
    fk_Premium_Familia_fk_Assinatura_ID_Assinatura VARCHAR(7),
    Senha NUMERIC(7),
    Email VARCHAR(300),
    Nome VARCHAR(25)
);
 
ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_2
    FOREIGN KEY (fk_Assinatura_ID_Assinatura)
    REFERENCES Assinatura (ID_Assinatura)
    ON DELETE RESTRICT;
 
ALTER TABLE Conteudo ADD CONSTRAINT FK_Conteudo_2
    FOREIGN KEY (fk_Capa_ID_Capa)
    REFERENCES Capa (ID_Capa)
    ON DELETE RESTRICT;
 
ALTER TABLE Musica ADD CONSTRAINT FK_Musica_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo)
    ON DELETE CASCADE;
 
ALTER TABLE Podcast ADD CONSTRAINT FK_Podcast_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo)
    ON DELETE CASCADE;
 
ALTER TABLE _Ouve ADD CONSTRAINT FK__Ouve_1
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario);
 
ALTER TABLE _Ouve ADD CONSTRAINT FK__Ouve_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo);
 
ALTER TABLE Playlist_Ouvira ADD CONSTRAINT FK_Playlist_Ouvira_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo);
 
ALTER TABLE Playlist_Ouvira ADD CONSTRAINT FK_Playlist_Ouvira_3
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario);
 
ALTER TABLE _Produz ADD CONSTRAINT FK__Produz_1
    FOREIGN KEY (fk_Musica_fk_Conteudo_ID_Conteudo)
    REFERENCES Musica (fk_Conteudo_ID_Conteudo);
 
ALTER TABLE _Produz ADD CONSTRAINT FK__Produz_2
    FOREIGN KEY (fk_Artista_ID_Artista)
    REFERENCES Artista (ID_Artista);
 
ALTER TABLE _Produz ADD CONSTRAINT FK__Produz_1
    FOREIGN KEY (fk_Podcast_fk_Conteudo_ID_Conteudo)
    REFERENCES Podcast (fk_Conteudo_ID_Conteudo);
 
ALTER TABLE _Produz ADD CONSTRAINT FK__Produz_2
    FOREIGN KEY (fk_Podcaster_ID_Podcaster)
    REFERENCES Podcaster (ID_Podcaster);
 
ALTER TABLE Avaliacao_Ouviu ADD CONSTRAINT FK_Avaliacao_Ouviu_2
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario);
 
ALTER TABLE Avaliacao_Ouviu ADD CONSTRAINT FK_Avaliacao_Ouviu_3
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo);
 
ALTER TABLE _Possui ADD CONSTRAINT FK__Possui_1
    FOREIGN KEY (fk_Musica_fk_Conteudo_ID_Conteudo)
    REFERENCES Musica (fk_Conteudo_ID_Conteudo);
 
ALTER TABLE _Possui ADD CONSTRAINT FK__Possui_2
    FOREIGN KEY (fk_Genero_Musical_ID_Genero)
    REFERENCES Genero_Musical (ID_Genero);
 
ALTER TABLE _Possui ADD CONSTRAINT FK__Possui_1
    FOREIGN KEY (fk_Podcast_fk_Conteudo_ID_Conteudo)
    REFERENCES Podcast (fk_Conteudo_ID_Conteudo);
 
ALTER TABLE _Possui ADD CONSTRAINT FK__Possui_2
    FOREIGN KEY (fk_Tipo_Atributo_8)
    REFERENCES Tipo (ID_Tipo);
 
ALTER TABLE Gratuita ADD CONSTRAINT FK_Gratuita_2
    FOREIGN KEY (fk_Assinatura_ID_Assinatura)
    REFERENCES Assinatura (ID_Assinatura)
    ON DELETE CASCADE;
 
ALTER TABLE Premium_Solo ADD CONSTRAINT FK_Premium_Solo_2
    FOREIGN KEY (fk_Assinatura_ID_Assinatura)
    REFERENCES Assinatura (ID_Assinatura)
    ON DELETE CASCADE;
 
ALTER TABLE Premium_Duo_Usuario_Incluso ADD CONSTRAINT FK_Premium_Duo_Usuario_Incluso_2
    FOREIGN KEY (fk_Assinatura_ID_Assinatura)
    REFERENCES Assinatura (ID_Assinatura)
    ON DELETE CASCADE;
 
ALTER TABLE Premium_Familia ADD CONSTRAINT FK_Premium_Familia_2
    FOREIGN KEY (fk_Assinatura_ID_Assinatura)
    REFERENCES Assinatura (ID_Assinatura)
    ON DELETE CASCADE;
 
ALTER TABLE Estudante ADD CONSTRAINT FK_Estudante_2
    FOREIGN KEY (fk_Assinatura_ID_Assinatura)
    REFERENCES Assinatura (ID_Assinatura)
    ON DELETE CASCADE;
 
ALTER TABLE Usuario_Incluso ADD CONSTRAINT FK_Usuario_Incluso_2
    FOREIGN KEY (fk_Premium_Familia_ID_Plano, fk_Premium_Familia_fk_Assinatura_ID_Assinatura)
    REFERENCES Premium_Familia (ID_Plano, fk_Assinatura_ID_Assinatura)
    ON DELETE RESTRICT;