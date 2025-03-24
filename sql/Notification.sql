DROP TABLE IF EXISTS "Notification";

CREATE TABLE "WayMatcher"."Notification" (
    "Notification_ID" int IDENTITY(1, 1) NOT NULL,
    "Read" bit DEFAULT ((0)),
    "Message" varchar(max),
    "Entity_Type" varchar(255),
    "Entity_ID" int,
    "User_ID" int,
    PRIMARY KEY (Notification_ID),
    CONSTRAINT FK__Notificat__User___6A1BB7B0 FOREIGN key ("User_ID") REFERENCES "User" ("User_ID")
);

DROP TRIGGER IF EXISTS WayMatcher.trg_Notification_Audit;

CREATE TRIGGER trg_Notification_Audit
ON WayMatcher.Notification
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

        DECLARE @Entity_ID INT = (SELECT TOP 1 Notification_ID FROM DELETED);

        EXEC WayMatcher.LogAuditEntry 
            @Message = @Message, 
            @Entity_Type = 'Notification', 
            @Entity_ID = @Entity_ID, 
            @User_ID = NULL;
    END
END;
