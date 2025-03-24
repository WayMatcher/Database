DROP TABLE IF EXISTS "Status";

CREATE TABLE "WayMatcher"."Status" (
    "Status_ID" int IDENTITY(1, 1) NOT NULL,
    "Status_Description" varchar(255) NOT NULL,
    PRIMARY KEY (Status_ID)
);

DROP TRIGGER IF EXISTS WayMatcher.trg_Status_Audit;

CREATE TRIGGER trg_Status_Audit
ON WayMatcher.Status
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

        DECLARE @Entity_ID INT = (SELECT TOP 1 Status_ID FROM DELETED);

        EXEC WayMatcher.LogAuditEntry 
            @Message = @Message, 
            @Entity_Type = 'Status', 
            @Entity_ID = @Entity_ID, 
            @User_ID = NULL;
    END
END;
