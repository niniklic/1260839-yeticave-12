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

CREATE INDEX idx_user_email ON user(email);

CREATE TABLE category (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(128) NOT NULL,
  code CHAR(20) NOT NULL UNIQUE
);

CREATE INDEX idx_category_code ON category(code);

CREATE TABLE lot (
  id INT AUTO_INCREMENT PRIMARY KEY,
  date_create TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  name VARCHAR(128) NOT NULL,
  description VARCHAR(200) NOT NULL,
  image VARCHAR(300) NOT NULL,
  price_initial INT NOT NULL,
  date_final TIMESTAMP NOT NULL,
  price_step INT NOT NULL,
  id_category INT NOT NULL,
  id_creator INT NOT NULL,
  id_winner INT NOT NULL,
  
  CONSTRAINT fk_lot_category 
  FOREIGN KEY (id_category) REFERENCES category (id),
  CONSTRAINT fk_lot_creator 
  FOREIGN KEY (id_creator) REFERENCES user (id),
  CONSTRAINT fk_lot_winner 
  FOREIGN KEY (id_winner) REFERENCES user (id)
);

CREATE INDEX idx_lot_name ON lot(name);
CREATE INDEX idx_lot_description ON lot(description);
CREATE INDEX idx_lot_date_create ON lot(date_create);
CREATE INDEX idx_lot_date_final ON lot(date_final);
CREATE INDEX idx_lot_category ON lot(id_category);
CREATE INDEX idx_lot_creator ON lot(id_creator);
CREATE INDEX idx_lot_winner ON lot(id_winner);

CREATE TABLE bet (
  id INT AUTO_INCREMENT PRIMARY KEY,
  date_create TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  price_proposal INT,
  id_lot INT NOT NULL,
  id_user INT NOT NULL,
  
  CONSTRAINT fk_bet_lot 
  FOREIGN KEY (id_lot) REFERENCES lot (id),
  CONSTRAINT fk_bet_user 
  FOREIGN KEY (id_user) REFERENCES user (id)
);

CREATE INDEX idx_bet_price_proposal ON bet(price_proposal);
CREATE INDEX idx_bet_lot ON bet(id_lot);
CREATE INDEX idx_bet_user ON bet(id_user);