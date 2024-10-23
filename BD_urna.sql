DROP DATABASE urna;

CREATE DATABASE IF NOT EXISTS urna;
USE urna;

CREATE TABLE IF NOT EXISTS eleicao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    data_eleicao DATE NOT NULL,
    local VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS candidato (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    partido VARCHAR(255) NOT NULL,
    eleicao_id INT,
    FOREIGN KEY (eleicao_id) REFERENCES eleicao(id)
);

CREATE TABLE IF NOT EXISTS eleitor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    local_votacao VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS voto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    eleitor_id INT,
    candidato_id INT,
    eleicao_id INT,
    data_voto DATE NOT NULL,
    FOREIGN KEY (eleitor_id) REFERENCES eleitor(id),
    FOREIGN KEY (candidato_id) REFERENCES candidato(id),
    FOREIGN KEY (eleicao_id) REFERENCES eleicao(id),
    UNIQUE (eleitor_id, eleicao_id)
);
