DROP TABLE AUTOR_LLIBRE;
DROP TABLE LLIBRE_GENERE;
DROP TABLE LLIBRE;
DROP TABLE EDITORIAL;
DROP TABLE AUTOR;
DROP TABLE GENERE;

CREATE TABLE EDITORIAL(
    ID number generated as identity primary key,
    nom varchar2(50)
);

CREATE TABLE LLIBRE (
    ID number generated as identity primary key,
    titol varchar2(50),
    an number CHECK(an <= 2023),
    exemplars number CHECK (exemplars > 0),
    ID_editorial number NOT NULL,
    ID_sequela number,
    foreign key (ID_editorial) references EDITORIAL(ID),
    foreign key (ID_sequela) references LLIBRE(ID),
    unique (titol, an)
);

CREATE TABLE AUTOR (
    ID number generated as identity primary key,
    nom varchar2(50),
    cognoms varchar2(50),
    data_naix date,
    nacionalitat varchar2(3),
    unique (nom, cognoms, nacionalitat)
);

CREATE TABLE AUTOR_LLIBRE(
    ID_autor number,
    ID_llibre number,
    primary key(ID_autor, ID_llibre),
    foreign key (ID_autor) references AUTOR(ID),
    foreign key (ID_llibre) references LLIBRE(ID)
);

CREATE TABLE GENERE(
    nom varchar2(50) primary key
);

CREATE TABLE LLIBRE_GENERE(
    ID_llibre number,
    nom_genere varchar2(50),
    foreign key (ID_llibre) references LLIBRE(ID),
    foreign key (nom_genere) references GENERE(nom),
    primary key (ID_llibre, nom_genere)
);