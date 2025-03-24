DROP TABLE IF EXISTS "Stop";

CREATE TABLE "WayMatcher"."Stop" (
    "Stop_ID" int IDENTITY(1, 1) NOT NULL,
    "Stop_sequence_number" int,
    "Address_ID" int,
    "Event_ID" int,
    PRIMARY KEY (Stop_ID),
    CONSTRAINT FK__Stop__Address_ID__6CF8245B FOREIGN key ("Address_ID") REFERENCES "Address" ("Address_ID"),
    CONSTRAINT FK__Stop__Event_ID__6DEC4894 FOREIGN key ("Event_ID") REFERENCES "Event" ("Event_ID")
);

DROP TRIGGER IF EXISTS WayMatcher.trg_Stop_Audit;

CREATE TRIGGER trg_Stop_Audit
ON WayMatcher.Stop
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

        DECLARE @Entity_ID INT = (SELECT TOP 1 Stop_ID FROM DELETED);

        EXEC WayMatcher.LogAuditEntry 
            @Message = @Message, 
            @Entity_Type = 'Stop', 
            @Entity_ID = @Entity_ID, 
            @User_ID = NULL;
    END
END;
