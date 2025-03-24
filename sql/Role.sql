DROP TABLE IF EXISTS "Role";

CREATE TABLE "WayMatcher"."Role" (
    "Role_ID" int IDENTITY(1, 1) NOT NULL,
    "Name" varchar(255) NOT NULL,
    "Description" varchar(max),
    PRIMARY KEY (Role_ID)
);

DROP TRIGGER IF EXISTS WayMatcher.trg_Role_Audit;

CREATE TRIGGER trg_Role_Audit
ON WayMatcher.Role
AFTER UPDATE, DELETE
AS
BEGIN
    IF EXISTS (SELECT * FROM DELETED)
    BEGIN
        DECLARE @Message NVARCHAR(MAX);
        SET @Message = CASE 
            WHEN EXISTS (SELECT * FROM INSERTED) THEN 'UPDATE'
            ELSE 'DELETE'
        END;

        DECLARE @Entity_ID INT = (SELECT TOP 1 Role_ID FROM DELETED);

        EXEC WayMatcher.LogAuditEntry 
            @Message = @Message, 
            @Entity_Type = 'Role', 
            @Entity_ID = @Entity_ID, 
            @User_ID = NULL;
    END
END;
