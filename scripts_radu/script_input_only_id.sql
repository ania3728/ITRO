#intrarile doar cu id, trebuie sterse

DELETE FROM autorlistatraduceri where autorId IN 
	(SELECT d.id FROM autor d WHERE d.nume IS NULL and d.prenume IS NULL); 
	
DELETE FROM bibliografieautor where autorId IN 
	(SELECT d.id FROM autor d WHERE d.nume IS NULL and d.prenume IS NULL); 
		
DELETE FROM autor WHERE nume IS NULL and prenume IS NULL; 