CREATE DATABASE BankDB;
USE BankDB;


CREATE TABLE Klienci (
    klient_id INT PRIMARY KEY AUTO_INCREMENT,
    imie VARCHAR(50) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL,
    pesel CHAR(11) NOT NULL UNIQUE,
    data_urodzenia DATE NOT NULL
);


CREATE TABLE Adresy (
    adres_id INT PRIMARY KEY AUTO_INCREMENT,
    ulica VARCHAR(100) NOT NULL,
    miasto VARCHAR(50) NOT NULL,
    kod_pocztowy CHAR(6) NOT NULL,
    kraj VARCHAR(50) NOT NULL
);


CREATE TABLE Konta (
    konto_id INT PRIMARY KEY AUTO_INCREMENT,
    klient_id INT NOT NULL,
    waluta CHAR(3) NOT NULL,
    saldo DECIMAL(15, 2) DEFAULT 0.0 NOT NULL,
    data_otwarcia DATE NOT NULL,
    FOREIGN KEY (klient_id) REFERENCES Klienci(klient_id)
);


CREATE TABLE Pracownicy (
    pracownik_id INT PRIMARY KEY AUTO_INCREMENT,
    imie VARCHAR(50) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL,
    pesel CHAR(11) NOT NULL UNIQUE,
    data_zatrudnienia DATE NOT NULL,
    adres_id INT NOT NULL,
    FOREIGN KEY (adres_id) REFERENCES Adresy(adres_id)
);


CREATE TABLE Pozyczki (
    pozyczka_id INT PRIMARY KEY AUTO_INCREMENT,
    klient_id INT NOT NULL,
    pracownik_id INT NOT NULL,
    rata_id INT NOT NULL,
    kwota DECIMAL(15, 2) NOT NULL,
    okres_miesiecy INT NOT NULL,
    data_udzielenia DATE NOT NULL,
    FOREIGN KEY (klient_id) REFERENCES Klienci(klient_id),
    FOREIGN KEY (pracownik_id) REFERENCES Pracownicy(pracownik_id),
    FOREIGN KEY (rata_id) REFERENCES Raty(rata_id)
);


CREATE TABLE Raty (
    rata_id INT PRIMARY KEY AUTO_INCREMENT,
    pozyczka_id INT NOT NULL,
    kwota_raty DECIMAL(15, 2) NOT NULL,
    data_splaty DATE NOT NULL,
    status_splaty ENUM('niesplacona', 'splacona') DEFAULT 'niesplacona' NOT NULL,
    FOREIGN KEY (pozyczka_id) REFERENCES Pozyczki(pozyczka_id)
);