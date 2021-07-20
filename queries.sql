USE yeticave;

/* заполняем таблицу категорий заданными значениями */
INSERT INTO category (name, code)
VALUES 
      ('Доски и лыжи', 'boards'),
      ('Крепления', 'attachment'),
      ('Ботинки', 'boots'),
      ('Одежда', 'clothing'),
      ('Инструменты', 'tools'),
      ('Разное', 'other');


/* заполняем таблицу пользователей произвольнми данными 
            (пароли пока что не являются хэшированными) */
INSERT INTO user (email, name, password, contact_info)
VALUES 
      ('mail_user1@mail.com', 'Pinky', 'pass1', 'tel. +111'),
      ('mail_user2@mail.com', 'Che', 'pass2', 'tel. +222'),
      ('mail_user3@mail.com', 'Utah', 'pass3', 'tel. +333'),
      ('mail_user4@mail.com', 'Norma', 'pass4', 'tel. +444');

/* заполняем таблицу лотов заданными объявлениями (победителя не указываем) */
INSERT INTO lot (date_create, name, description, image, price_initial, 
								date_final, price_step, id_category, id_creator)
VALUES 
      ('2021-07-18', '2014 Rossignol District Snowboard', 'Сноуборд Россигнол', 'img/lot-1.jpg', 10999, '2021-07-21', 100, 1, 2),
      ('2021-07-19', 'DC Ply Mens 2016/2017 Snowboard', 'Сноуборд DC', 'img/lot-2.jpg', 159999, '2021-07-22', 500, 1, 1),
      ('2021-07-17', 'Крепления Union Contact Pro 2015 года размер L/XL', 'Отличные крепления', 'img/lot-3.jpg', 8000, '2021-08-13', 75, 1, 4),
      ('2021-07-15', 'Ботинки для сноуборда DC Mutiny Charocal', ' Ботинки (в комплекте с курткой из этой же серии дают +5 к скорости)', 'img/lot-4.jpg', 10999, '2021-08-02', 100, 1, 3),
      ('2021-07-20', 'Куртка для сноуборда DC Mutiny Charocal', 'Куртка (в комплекте с ботинками из этой же серии даёт +10 устойчивость к холоду)', 'img/lot-5.jpg', 7500, '2021-07-23', 75, 1, 2),
      ('2021-07-19', 'Маска Oakley Canopy', 'Супер маска', 'img/lot-6.jpg', 5400, '2021-08-01', 50, 6, 1);


/* заполняем таблицу ставок ставками для первого и второго лотов */
INSERT INTO bet (price_proposal, id_lot, id_user)
VALUES 
      (11099, 1, 4),
      (160499, 2, 3),
      (160999, 2, 2),
      (11199, 1, 3),
      (11299, 1, 1),
      (11399, 1, 4),
      (161499, 2, 3);