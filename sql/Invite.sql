DROP TABLE IF EXISTS "Invite";

CREATE TABLE "WayMatcher"."Invite" (
    "Invite_ID" int IDENTITY(1, 1) NOT NULL,
    "ConfirmationStatus_ID" int,
    "Is_Request" bit,
    "Event_ID" int,
    "User_ID" int,
    PRIMARY KEY (Invite_ID),
    CONSTRAINT FK__Invite__Confirma__6462DE5A FOREIGN key ("ConfirmationStatus_ID") REFERENCES "ConfirmationStatus" ("ConfirmationStatus_ID"),
    CONSTRAINT FK__Invite__Event_ID__65570293 FOREIGN key ("Event_ID") REFERENCES "Event" ("Event_ID"),
    CONSTRAINT FK__Invite__User_ID__664B26CC FOREIGN key ("User_ID") REFERENCES "User" ("User_ID")
);

DROP TRIGGER IF EXISTS WayMatcher.trg_Invite_Audit;

CREATE TRIGGER trg_Invite_Audit
ON WayMatcher.Invite
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

        DECLARE @Entity_ID INT = (SELECT TOP 1 Invite_ID FROM DELETED);

        EXEC WayMatcher.LogAuditEntry 
            @Message = @Message, 
            @Entity_Type = 'Invite', 
            @Entity_ID = @Entity_ID, 
            @User_ID = NULL;
    END
END;
