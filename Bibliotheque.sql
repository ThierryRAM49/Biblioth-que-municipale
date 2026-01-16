
/* Création de la base de données */

CREATE DATABASE Bibliotheque;

USE Bibliotheque;

-- ----------------------------
-- Table: Adherents
-- ----------------------------

CREATE TABLE Adherents (
  Num_Adherent INT NOT NULL,
  Nom VARCHAR(50) NOT NULL,
  Prenom VARCHAR(50) NOT NULL,
  Adresse VARCHAR(100) NOT NULL,
  Telephone VARCHAR(20) NOT NULL,
  Date_Inscription DATE NOT NULL,
  CONSTRAINT Adherents_PK PRIMARY KEY (Num_Adherent)
)ENGINE=InnoDB;


-- ----------------------------
-- Table: Livres
-- ----------------------------
CREATE TABLE Livres (
  Num_Isbn BIGINT NOT NULL,
  Titre VARCHAR(50) NOT NULL,
  Genre VARCHAR(50) NOT NULL,
  Auteur VARCHAR(50) NOT NULL,
  Pub_Date DATE NOT NULL,
  Nb_Exemplaire INT NOT NULL,
  CONSTRAINT Livres_PK PRIMARY KEY (Num_Isbn)
)ENGINE=InnoDB;


-- ----------------------------
-- Table: Categories
-- ----------------------------
CREATE TABLE Categories (
  Num_Isbn BIGINT NOT NULL,
  id BIGINT NOT NULL,
  Nom VARCHAR(50) NOT NULL,
  Description TEXT NOT NULL,
  Titre VARCHAR(50) NOT NULL,
  Genre VARCHAR(50) NOT NULL,
  Auteur VARCHAR(50) NOT NULL,
  Pub_Date DATE NOT NULL,
  Nb_Exemplaire INT NOT NULL,
  CONSTRAINT Categories_PK PRIMARY KEY (Num_Isbn, id),
  CONSTRAINT Categories_Num_Isbn_FK FOREIGN KEY (Num_Isbn) REFERENCES Livres (Num_Isbn)
)ENGINE=InnoDB;


-- ----------------------------
-- Table: Emprunter
-- ----------------------------


CREATE TABLE Emprunter (
  Num_Isbn BIGINT NOT NULL,
  id BIGINT NOT NULL,
  Num_Adherent INT NOT NULL,
  Code_Adherent BIGINT NOT NULL,
  Num_Isbn_Categorie VARCHAR(50) NOT NULL,
  Date_Emprunt DATE NOT NULL,
  Date_Retour_prevue DATE NOT NULL,
  Date_Retour_Effective DATE NOT NULL,
  CONSTRAINT Emprunter_PK PRIMARY KEY (Num_Isbn, id, Num_Adherent),
  CONSTRAINT Emprunter_Num_Isbn_id_FK FOREIGN KEY (Num_Isbn, id) REFERENCES Categories (Num_Isbn, id),
  CONSTRAINT Emprunter_Num_Adherent_FK FOREIGN KEY (Num_Adherent) REFERENCES Adherents (Num_Adherent)
)ENGINE=InnoDB;


