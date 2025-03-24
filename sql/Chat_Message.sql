DROP TABLE IF EXISTS "Chat_Message";

CREATE TABLE "WayMatcher"."Chat_Message" (
    "Chat_Message_ID" int IDENTITY(1, 1) NOT NULL,
    "Message" varchar(max),
    "Timestamp" datetime2 DEFAULT (sysdatetime()),
    "User_ID" int,
    "Event_ID" int,
    PRIMARY KEY (Chat_Message_ID),
    CONSTRAINT FK__Chat_Mess__User___5EAA0504 FOREIGN key ("User_ID") REFERENCES "User" ("User_ID"),
    CONSTRAINT FK__Chat_Mess__Event__5F9E293D FOREIGN key ("Event_ID") REFERENCES "Event" ("Event_ID")
);

DROP TRIGGER IF EXISTS WayMatcher.trg_Chat_Message_Audit;

CREATE TRIGGER trg_Chat_Message_Audit
ON WayMatcher.Chat_Message
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

        DECLARE @Entity_ID INT = (SELECT TOP 1 Chat_Message_ID FROM DELETED);

        EXEC WayMatcher.LogAuditEntry 
            @Message = @Message, 
            @Entity_Type = 'Chat_Message', 
            @Entity_ID = @Entity_ID, 
            @User_ID = NULL;
    END
END;
