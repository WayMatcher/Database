DROP TABLE IF EXISTS "Schedule";

CREATE TABLE "WayMatcher"."Schedule" (
    "Schedule_ID" int IDENTITY(1, 1) NOT NULL,
    "Cron_Schedule" varchar(255),
    "User_ID" int,
    PRIMARY KEY (Schedule_ID),
    CONSTRAINT FK__Schedule__User_I__4C8B54C9 FOREIGN key ("User_ID") REFERENCES "User" ("User_ID")
);

DROP TRIGGER IF EXISTS WayMatcher.trg_Schedule_Audit;

CREATE TRIGGER trg_Schedule_Audit
ON WayMatcher.Schedule
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

        DECLARE @Entity_ID INT = (SELECT TOP 1 Schedule_ID FROM DELETED);

        EXEC WayMatcher.LogAuditEntry 
            @Message = @Message, 
            @Entity_Type = 'Schedule', 
            @Entity_ID = @Entity_ID, 
            @User_ID = NULL;
    END
END;
