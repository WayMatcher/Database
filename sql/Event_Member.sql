DROP TABLE IF EXISTS "WayMatcher"."Event_Member";
CREATE TABLE "WayMatcher"."Event_Member"(
    "Member_ID" int IDENTITY(1,1) NOT NULL,
    "EventMemberType_ID" int,
    "User_ID" int,
    "Event_ID" int,
    "Status_ID" int,
    PRIMARY KEY(Member_ID),
    CONSTRAINT FK__Event_Mem__User___58F12BAE FOREIGN key("User_ID") REFERENCES "User"("User_ID"),
    CONSTRAINT FK__Event_Mem__Event__59E54FE7 FOREIGN key("Event_ID") REFERENCES "Event"("Event_ID"),
    CONSTRAINT FK__Event_Mem__Statu__5AD97420 FOREIGN key("Status_ID") REFERENCES "Status"("Status_ID")
);

DROP TRIGGER IF EXISTS "WayMatcher"."trg_Event_Member_Audit";
CREATE TRIGGER trg_Event_Member_Audit
ON WayMatcher.Event_Member
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

        DECLARE @Entity_ID INT = (SELECT TOP 1 Member_ID FROM DELETED);

        EXEC WayMatcher.LogAuditEntry 
            @Message = @Message, 
            @Entity_Type = 'Event_Member', 
            @Entity_ID = @Entity_ID, 
            @User_ID = NULL;
    END
END;