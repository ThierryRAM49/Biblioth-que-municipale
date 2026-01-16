-- ----------------------------------------------------------
-- Script MYSQL pour mcd 
-- ----------------------------------------------------------

-- Créer et utiliser la base
CREATE DATABASE IF NOT EXISTS Bibliotheque CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE Bibliotheque;


-- ----------------------------
-- Table: Categories
-- ----------------------------
CREATE TABLE Categories (
  id BIGINT NOT NULL AUTO_INCREMENT,
  Nom VARCHAR(50) NOT NULL,
  Description TEXT NOT NULL,
  CONSTRAINT Categories_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


-- ----------------------------
-- Table: Adherents
-- Client déjà enrégistré dans la base de donnée et possède un abonnement annuel.
-- ----------------------------
CREATE TABLE Adherents (
  code BIGINT NOT NULL AUTO_INCREMENT,
  Nom VARCHAR(255) NOT NULL,
  Prenom VARCHAR(255) NOT NULL,
  Adresse TEXT NOT NULL,
  Telephone VARCHAR(20) NOT NULL,
  inscription DATE NOT NULL,
  CONSTRAINT Adherents_PK PRIMARY KEY (code)
)ENGINE=InnoDB;


-- ----------------------------
-- Table: Emprunter
-- ----------------------------
CREATE TABLE Emprunter (
  id_Categories BIGINT NOT NULL AUTO_INCREMENT,
  code BIGINT NOT NULL,
  Id BIGINT NOT NULL,
  Num_Isbn BIGINT NOT NULL,
  Code_Adherent BIGINT NOT NULL,
  Nom_Emprunteur VARCHAR(50) NOT NULL,
  Prenom_Emprunteur VARCHAR(50) NOT NULL,
  Date_Debut DATE NOT NULL,
  Date_Retour DATE NOT NULL,
  Date_Retour_Effective DATE NOT NULL,
  CONSTRAINT Emprunter_PK PRIMARY KEY (id_Categories, code),
  CONSTRAINT Emprunter_id_Categories_FK FOREIGN KEY (id_Categories) REFERENCES Categories (id),
  CONSTRAINT Emprunter_code_FK FOREIGN KEY (code) REFERENCES Adherents (code)
)ENGINE=InnoDB;


-- ----------------------------
-- Table: Livres
-- ----------------------------
CREATE TABLE Livres (
  id BIGINT NOT NULL AUTO_INCREMENT,
  Num_Isbn BIGINT NOT NULL,
  Titre VARCHAR(50) NOT NULL,
  Genre VARCHAR(50) NOT NULL,
  Auteur VARCHAR(50) NOT NULL,
  Pub_Date DATE NOT NULL,
  Nb_Exemplaire INT NOT NULL,
  Num_Isbn_Categories BIGINT NOT NULL,
  Nom VARCHAR(50) NOT NULL,
  Description TEXT NOT NULL,
  Titre_Categories VARCHAR(50) NOT NULL,
  Genre_Categories VARCHAR(50) NOT NULL,
  Auteur_Categories VARCHAR(50) NOT NULL,
  Pub_Date_Categories DATE NOT NULL,
  Nb_Exemplaire_Categories INT NOT NULL,
  CONSTRAINT Livres_PK PRIMARY KEY (id, Num_Isbn),
  CONSTRAINT Livres_id_FK FOREIGN KEY (id_categorie) REFERENCES Categories (id)
)ENGINE=InnoDB;
