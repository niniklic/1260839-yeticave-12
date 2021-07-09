CREATE DATABASE yeticave
	DEFAULT CHARACTER SET utf8
	DEFAULT COLLATE utf8_general_ci;

USE yeticave;

CREATE TABLE user (
  id INT AUTO_INCREMENT PRIMARY KEY,
  reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  email VARCHAR(128) NOT NULL UNIQUE,
  name VARCHAR(128) NOT NULL,
  password CHAR(64) NOT NULL,
  contact_info VARCHAR(400)
);

CREATE INDEX c_email ON user(email);

CREATE TABLE category (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(128) NOT NULL,
  code CHAR(20) NOT NULL UNIQUE
);

CREATE INDEX c_category ON category(code);

CREATE TABLE lot (
  id INT AUTO_INCREMENT PRIMARY KEY,
  date_create TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  name VARCHAR(128) NOT NULL,
  description VARCHAR(200) NOT NULL,
  image VARCHAR(300) NOT NULL,
  id_category INT NOT NULL,
  price_initial INT NOT NULL,
  final_date TIMESTAMP NOT NULL,
  price_step INT NOT NULL,
  id_creator INT NOT NULL,
  id_winner INT NOT NULL,
  
  CONSTRAINT lot_creator_fk 
  FOREIGN KEY (id_creator)  REFERENCES user (id),
  CONSTRAINT lot_winner_fk 
  FOREIGN KEY (id_winner)  REFERENCES user (id)
);

CREATE INDEX c_lot_name ON lot(name);
CREATE INDEX c_lot_description ON lot(description);
CREATE INDEX c_lot_create_date ON lot(date_create);
CREATE INDEX c_lot_final ON lot(final_date);

CREATE TABLE bet (
  id INT AUTO_INCREMENT PRIMARY KEY,
  date_create TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  price_proposal INT,
  id_lot INT NOT NULL,
  id_user INT NOT NULL,
  
  CONSTRAINT bet_lot_fk 
  FOREIGN KEY (id_lot)  REFERENCES lot (id),
  CONSTRAINT bet_creator_fk 
  FOREIGN KEY (id_user)  REFERENCES user (id)
);

CREATE INDEX c_bet ON bet(price_proposal);
