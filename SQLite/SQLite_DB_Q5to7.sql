-- Question 5: SQLite DB Schema
CREATE TABLE car_brand
(
    id   integer      NOT NULL PRIMARY KEY autoincrement,
    name varchar(100) NOT NULL
);

CREATE TABLE car_serie
(
    id           integer      NOT NULL PRIMARY KEY autoincrement,
    name         varchar(100) NOT NULL,
    car_brand_id integer,
    FOREIGN KEY (car_brand_id) REFERENCES car_brand (id)
);

CREATE TABLE owner
(
    id      integer      NOT NULL PRIMARY KEY autoincrement,
    id_card char(13)     NOT NULL,
    name    varchar(255) NOT NULL,
    CONSTRAINT Unique_id_card UNIQUE (id_card)
);

CREATE TABLE car
(
    id           integer    NOT NULL PRIMARY KEY autoincrement,
    buy_date     date       NOT NULL DEFAULT CURRENT_DATE,
    price        decimal(2) NOT NULL,
    owner_id     integer,
    car_brand_id integer,
    car_serie_id integer,
    FOREIGN KEY (owner_id) REFERENCES owner (id),
    FOREIGN KEY (car_brand_id) REFERENCES car_brand (id),
    FOREIGN KEY (car_serie_id) REFERENCES car_serie (id)
);

INSERT INTO car_brand (id, name)
VALUES (1, 'Lotus');
INSERT INTO car_brand (id, name)
VALUES (2, 'BMW');
INSERT INTO car_brand (id, name)
VALUES (3, 'Mercedes');
INSERT INTO car_brand (id, name)
VALUES (4, 'Toyota');
INSERT INTO car_brand (id, name)
VALUES (5, 'Porsche');
INSERT INTO car_brand (id, name)
VALUES (6, 'Jaguar');
INSERT INTO car_brand (id, name)
VALUES (7, 'TukTuk');
INSERT INTO car_brand (id, name)
VALUES (8, 'Mini');
INSERT INTO car_brand (id, name)
VALUES (9, 'Honda');
INSERT INTO car_brand (id, name)
VALUES (10, 'Corvette');

INSERT INTO car_serie (id, name, car_brand_id)
VALUES (1, 'Exige S', 1);
INSERT INTO car_serie (id, name, car_brand_id)
VALUES (2, 'M3', 2);
INSERT INTO car_serie (id, name, car_brand_id)
VALUES (3, 'M5', 2);
INSERT INTO car_serie (id, name, car_brand_id)
VALUES (4, '320d', 2);
INSERT INTO car_serie (id, name, car_brand_id)
VALUES (5, 'SLK AMG', 3);
INSERT INTO car_serie (id, name, car_brand_id)
VALUES (6, 'Sprinter', 3);
INSERT INTO car_serie (id, name, car_brand_id)
VALUES (7, 'Alphard', 4);
INSERT INTO car_serie (id, name, car_brand_id)
VALUES (8, 'Camry', 4);
INSERT INTO car_serie (id, name, car_brand_id)
VALUES (9, '911', 5);
INSERT INTO car_serie (id, name, car_brand_id)
VALUES (10, 'Cooper', 8);
INSERT INTO car_serie (id, name, car_brand_id)
VALUES (11, 'Jazz', 9);
INSERT INTO car_serie (id, name, car_brand_id)
VALUES (12, 'Z06', 10);


INSERT INTO owner (id, id_card, name)
VALUES (1, '1000000000001', 'Rick');
INSERT INTO owner (id, id_card, name)
VALUES (2, '1000000000002', 'John');
INSERT INTO owner (id, id_card, name)
VALUES (3, '1000000000003', 'Zing');
INSERT INTO owner (id, id_card, name)
VALUES (4, '1000000000004', 'Nan');

INSERT INTO car (id, buy_date, price, owner_id, car_brand_id, car_serie_id)
VALUES (1, datetime('now'), 10, 1, 10, 12);
INSERT INTO car (id, buy_date, price, owner_id, car_brand_id, car_serie_id)
VALUES (2, datetime('now'), 10, 1, 1, 1);
INSERT INTO car (id, buy_date, price, owner_id, car_brand_id, car_serie_id)
VALUES (3, datetime('now'), 10, 1, 2, 2);
INSERT INTO car (id, buy_date, price, owner_id, car_brand_id, car_serie_id)
VALUES (4, datetime('now'), 10, 2, 2, 4);
INSERT INTO car (id, buy_date, price, owner_id, car_brand_id, car_serie_id)
VALUES (5, datetime('now'), 10, 2, 3, 5);
INSERT INTO car (id, buy_date, price, owner_id, car_brand_id, car_serie_id)
VALUES (6, datetime('now'), 10, 3, 4, 7);
INSERT INTO car (id, buy_date, price, owner_id, car_brand_id, car_serie_id)
VALUES (7, datetime('now'), 10, 3, 3, 6);
INSERT INTO car (id, buy_date, price, owner_id, car_brand_id, car_serie_id)
VALUES (8, datetime('now'), 10, 4, 4, 8);
INSERT INTO car (id, buy_date, price, owner_id, car_brand_id, car_serie_id)
VALUES (9, datetime('now'), 10, 4, 2, 3);
INSERT INTO car (id, buy_date, price, owner_id, car_brand_id, car_serie_id)
VALUES (10, datetime('now'), 10, 4, 5, 9);
INSERT INTO car (id, buy_date, price, owner_id, car_brand_id, car_serie_id)
VALUES (11, datetime('now'), 10, 4, 6, NULL);
INSERT INTO car (id, buy_date, price, owner_id, car_brand_id, car_serie_id)
VALUES (12, datetime('now'), 10, 4, 7, NULL);
INSERT INTO car (id, buy_date, price, owner_id, car_brand_id, car_serie_id)
VALUES (13, datetime('now'), 10, 4, 8, 10);
INSERT INTO car (id, buy_date, price, owner_id, car_brand_id, car_serie_id)
VALUES (14, datetime('now'), 10, 4, 9, 11);

-- Question 5:  SQL queries to retrieve data
SELECT *
FROM (
         SELECT owner.name                              AS owner_name,
                owner.id                                AS owner_id,
                car_brand.name || ' ' || car_serie.name AS car_brand_serie
         FROM owner,
              car,
              car_brand,
              car_serie
         WHERE owner.id = car.owner_id
           AND car_brand.id = car.car_brand_id
           AND car_serie.id = car.car_serie_id) AS a
UNION
SELECT *
FROM (
         SELECT owner.id       AS owner_id,
                owner.name     AS owner_name,
                car_brand.name AS car_brand_serie
         FROM owner,
              car,
              car_brand
         WHERE owner.id = car.owner_id
           AND car_brand.id = car.car_brand_id
           AND car.car_serie_id IS NULL) AS b
ORDER BY owner_id;


-- Question 6:  SQL queries to retrieve data
SELECT owner.name,
       count(car.id) as cars
FROM owner,
     car
WHERE owner.id = car.owner_id
GROUP BY owner.id;

-- Question 7:  SQL queries to retrieve data
SELECT owner.name,
       count(car.id) as cars
FROM owner,
     car
WHERE owner.id = car.owner_id
GROUP BY owner.id
HAVING cars > 2;