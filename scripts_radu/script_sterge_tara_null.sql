# Dumbraveni
UPDATE localitate
SET judetId = -34
WHERE nume = 'Dumbraveni';

# Budapesta  ;;; in judetul Pest

INSERT INTO judet (id, nume, taraId)
VALUES (-43, 'Pest', NULL);

UPDATE judet
SET taraId = -110
WHERE nume = 'Pest';

UPDATE localitate 
SET taraId = -110, judetId = -43
WHERE id = -442; 

# Pogoniani   ;;; judetul Ioannina

INSERT INTO judet (id, nume, taraId)
VALUES (-44, '	Ioannina', NULL);

UPDATE judet
SET taraId = -109
WHERE nume = '	Ioannina';

UPDATE localitate 
SET taraId = -109, judetId = -44
WHERE id = -435; 

# Rujnita  ;;; judetul Ocnita

INSERT INTO judet (id, nume, taraId)
VALUES (-45, 'Ocnita', NULL);

UPDATE judet
SET taraId = -105
WHERE nume = 'Ocnita';

UPDATE localitate 
SET taraId = -105, judetId = -45
WHERE id = -432; 

# Virset  ;;; judetul Banatul de Sud

INSERT INTO judet (id, nume, taraId)
VALUES (-46, 'Banatul de Sud', NULL);

UPDATE judet
SET taraId = -108
WHERE nume = 'Banatul de Sud';

UPDATE localitate 
SET taraId = -108, judetId = -46
WHERE id = -416; 

# Abbazia   ;;; judetul Primorje-Gorski kotar

INSERT INTO judet (id, nume, taraId)
VALUES (-47, 'Primorje-Gorski kotar', NULL);

UPDATE judet
SET taraId = -107
WHERE nume = 'Primorje-Gorski kotar';

UPDATE localitate 
SET taraId = -107, judetId = -47
WHERE id = -414; 

# Karlovy Vary  ;;;; Judetul Bohemia

INSERT INTO judet (id, nume, taraId)
VALUES (-48, 'Bohemia', NULL);

UPDATE judet
SET taraId = -134
WHERE nume = 'Bohemia';

INSERT INTO tara(id, nume)
VALUES (-134, 'Cehia');

UPDATE localitate 
SET taraId = -134, judetId = -48
WHERE id = -410; 

# Tonnerre   ;;; judetul Yonne

INSERT INTO judet (id, nume, taraId)
VALUES (-49, 'Yonne', NULL);

UPDATE judet
SET taraId = -103
WHERE nume = 'Yonne';

UPDATE localitate 
SET taraId = -103, judetId = -49
WHERE id = -408; 

# Chisinau    ;;; judet Chisinau 

INSERT INTO judet (id, nume, taraId)
VALUES (-50, 'Chisinau', NULL);

UPDATE judet
SET taraId = -105
WHERE nume = 'Chisinau';
 
UPDATE localitate 
SET taraId = -105, judetId = -50
WHERE id = -407; 

SELECT * FROM judet where taraId = -98;
SELECT * FROM localitate where judetId = -42;

DELETE FROM judet WHERE id = -42;
DELETE FROM tara WHERE id = 98;

SELECT * FROM judet where taraId = -98;
SELECT * FROM localitate where judetId = -42;