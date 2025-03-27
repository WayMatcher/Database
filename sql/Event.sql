DROP TABLE IF EXISTS "WayMatcher"."Event";
CREATE TABLE "WayMatcher"."Event"(
    "Event_ID" int IDENTITY(1,1) NOT NULL,
    "EventType_ID" int,
    "Free_Seats" int,
    "Description" varchar(max),
    "Start_Timestamp" datetime2,
    "Schedule_ID" int,
    "Status_ID" int,
    "EventOwner_ID" int,
    PRIMARY KEY(Event_ID),
    CONSTRAINT FK__Event__Schedule___52442E1F FOREIGN key("Schedule_ID") REFERENCES "Schedule"("Schedule_ID"),
    CONSTRAINT FK__Event__Status_ID__53385258 FOREIGN key("Status_ID") REFERENCES "Status"("Status_ID")
);


DROP TRIGGER IF EXISTS "WayMatcher"."trg_Event_Audit";
CREATE TRIGGER trg_Event_Audit
ON WayMatcher.Event
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

        DECLARE @Entity_ID INT = (SELECT TOP 1 Event_ID FROM DELETED);

        EXEC WayMatcher.LogAuditEntry 
            @Message = @Message, 
            @Entity_Type = 'Event', 
            @Entity_ID = @Entity_ID, 
            @User_ID = NULL;
    END
END;
