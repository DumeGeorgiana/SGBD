IF NOT EXISTS
	(SELECT ProductID FROM Production.Product 
	WHERE Color = 'Pink')
BEGIN
	RETURN
END
-- Nu se execut� daca nu exista nici un produs roz
SELECT ProductID
FROM Production.Product
WHERE Color = 'Pink'