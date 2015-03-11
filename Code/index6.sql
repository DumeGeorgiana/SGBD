-- baza de date tempdb va fi folosita pentru rezultate intermediare de indexare
-- timpul de creare a indexului se va îmbunatati
-- compromisul este că baza de date tempdb va avea nevoie de mai mult spațiu
CREATE NONCLUSTERED INDEX NI_Address_PostalCode ON
Person.Address (PostalCode)
WITH (SORT_IN_TEMPDB = ON)