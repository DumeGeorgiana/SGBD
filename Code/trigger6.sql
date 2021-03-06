USE master
GO
-- tabela de audit
CREATE TABLE dbo.ChangeAttempt
(
	EventData xml NOT NULL,
	AttemptDate datetime NOT NULL DEFAULT GETDATE(),
	DBUser char(50) NOT NULL
)
GO

--trigger DDL care va inregistra operatiile cu indecși
CREATE TRIGGER db_trg_RestrictINDEXChanges
ON DATABASE
FOR CREATE_INDEX, ALTER_INDEX, DROP_INDEX
AS
SET NOCOUNT ON
INSERT dbo.ChangeAttempt
(EventData, DBUser)
VALUES (EVENTDATA(), USER)
GO

-- testare trigger
CREATE NONCLUSTERED INDEX ni_ChangeAttempt_DBUser ON
dbo.ChangeAttempt(DBUser)
GO

--verificam ce s-a inserat in tabela de audit 
SELECT EventData
FROM dbo.ChangeAttempt

