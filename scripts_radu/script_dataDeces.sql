#manually fixing some fast changes
UPDATE traducator
SET dataDeces = '30.01.1857'
WHERE id = -301;

UPDATE traducator
SET dataDeces = '11.VI.1946'
WHERE id = -301;

UPDATE traducator
SET dataDeces = '11.09.1856'
WHERE id = -300;


SELECT id, dataDeces from traducator where dataDeces LIKE '%.%.%';

CREATE FUNCTION 
   SPLIT_STRING ( s VARCHAR(1024) , del CHAR(1) , i INT)
   RETURNS VARCHAR(1024)
   DETERMINISTIC -- always returns same results for same input parameters
    BEGIN

        DECLARE n INT ;

        -- get max number of items
        SET n = LENGTH(s) - LENGTH(REPLACE(s, del, '')) + 1;

        IF i > n THEN
            RETURN NULL ;
        ELSE
            RETURN SUBSTRING_INDEX(SUBSTRING_INDEX(s, del, i) , del , -1 ) ;        
        END IF;

    END;

create temporary table tmpTable (id INT, cifre1 VARCHAR(30), schimbare VARCHAR(30), cifre2 VARCHAR(30), replacer VARCHAR(30));

insert  tmpTable
        (id, cifre1, schimbare, cifre2)
select  id, dataDeces, dataDeces, dataDeces
from    traducator
where   dataDeces LIKE '%.%.%';

SELECT * from tmpTable;

UPDATE tmpTable
SET cifre1 = SPLIT_STRING(cifre1,'.',1), schimbare = SPLIT_STRING(schimbare,'.',2), cifre2 = SPLIT_STRING(cifre2,'.',3)
WHERE id < 0;

SELECT * from tmpTable;

DELETE FROM tmpTable WHERE schimbare NOT REGEXP '^[0-9]+$';
SELECT * FROM tmpTable;

UPDATE tmpTable
SET schimbare = CASE 
WHEN schimbare = 1 THEN 'I'
WHEN schimbare = 2 THEN 'II'
WHEN schimbare = 3 THEN 'III'
WHEN schimbare = 4 THEN 'IV'
WHEN schimbare = 5 THEN 'V'
WHEN schimbare = 6 THEN 'VI'
WHEN schimbare = 7 THEN 'VII'
WHEN schimbare = 8 THEN 'VIII'
WHEN schimbare = 9 THEN 'IX'
WHEN schimbare = 10 THEN 'X'
WHEN schimbare = 11 THEN 'XI'
WHEN schimbare = 12 THEN 'XII'
ELSE schimbare
END 
WHERE id < 0;

SELECT * from tmpTable;

UPDATE tmpTable 
SET replacer = concat(cifre1, ".", schimbare, ".", cifre2)
WHERE id < 0;

SELECT * from tmpTable;

#applying, there is no rollback

UPDATE traducator, tmpTable
SET traducator.dataDeces = tmpTable.replacer
WHERE traducator.id = tmpTable.id;

drop table tmpTable;