USE sql_project;
CREATE TABLE pruchase_history(product_ID int, sale_QTY int, billdate date);
CREATE TABLE product_catalogue(product_ID int,cat_ID int);
ALTER TABLE product_catalogue
ADD COLUMN TRENDING int;

INSERT INTO pruchase_history VALUES	(100,1,"2020-02-22");
INSERT INTO pruchase_history VALUES	(100,2,"2020-02-23");
INSERT INTO pruchase_history VALUES	(100,1,"2020-02-27");
INSERT INTO pruchase_history VALUES (100,1,"2020-02-27");
INSERT INTO pruchase_history VALUES	(200,1,"2020-02-27");
INSERT INTO pruchase_history VALUES	(200,1,"2019-11-11");
INSERT INTO pruchase_history VALUES	(300,1,"2019-11-16");
INSERT INTO pruchase_history VALUES	(300,1,"2019-11-19");
INSERT INTO pruchase_history VALUES	(300,1,"2019-11-26");
INSERT INTO pruchase_history VALUES	(300,1,"2019-11-26");
INSERT INTO pruchase_history VALUES	(301,1,"2019-12-01");
INSERT INTO pruchase_history VALUES	(401,1,"2019-12-04");
INSERT INTO pruchase_history VALUES	(402,1,"2019-12-08");
INSERT INTO pruchase_history VALUES	(403,1,"2019-12-08");
INSERT INTO pruchase_history VALUES	(404,2,"2019-12-08");
INSERT INTO pruchase_history VALUES	(405,1,"2019-12-08");
INSERT INTO pruchase_history VALUES	(406,1,"2019-12-08");
INSERT INTO pruchase_history VALUES	(407,1,"2019-12-16");
INSERT INTO pruchase_history VALUES	(405,1,"2019-12-16");
INSERT INTO pruchase_history VALUES	(301,1,"2020-01-19");
INSERT INTO pruchase_history VALUES (401,1,"2020-01-19");
INSERT INTO pruchase_history VALUES	(402,1,"2020-01-23");



INSERT INTO product_catalogue VALUES (100,1);
INSERT INTO product_catalogue VALUES (100,1);
INSERT INTO product_catalogue VALUES (100,1);
INSERT INTO product_catalogue VALUES (100,1);
INSERT INTO product_catalogue VALUES (200,1);
INSERT INTO product_catalogue VALUES (200,1);
INSERT INTO product_catalogue VALUES (300,2);
INSERT INTO product_catalogue VALUES (300,2);
INSERT INTO product_catalogue VALUES (300,2);
INSERT INTO product_catalogue VALUES (301,2);
INSERT INTO product_catalogue VALUES (401,3);
INSERT INTO product_catalogue VALUES (403,3);
INSERT INTO product_catalogue VALUES (404,3);

SELECT DISTINCT pruchase_history.product_ID,product_catalogue.cat_ID
FROM pruchase_history
INNER JOIN product_catalogue
ON pruchase_history.product_ID=product_catalogue.product_ID
WHERE sale_QTY IN (SELECT DISTINCT sale_QTY FROM pruchase_history)
GROUP BY DATEDIFF((select max(billdate) from pruchase_history ),billdate) BETWEEN 0 AND 30
