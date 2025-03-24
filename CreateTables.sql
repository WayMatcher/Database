-- Database Client 8.2.2
-- Host: waymatcher.database.windows.net Port: 1433 Database: WayMatcher  Schema: WayMatcher

DROP TABLE IF EXISTS "Address";

CREATE TABLE "WayMatcher"."Address" (
    "Address_ID" int IDENTITY(1, 1) NOT NULL,
    "City" varchar(255),
    "Postal_Code" varchar(20),
    "Street" varchar(255),
    "Country" varchar(255),
    "Country_Code" varchar(10),
    "Region" varchar(255),
    "State" varchar(255),
    "Longitude" float,
    "Latitude" float,
    "Address_Line1" varchar(255),
    "Address_Line2" varchar(255),
    "Status_ID" int,
    PRIMARY KEY (Address_ID),
    CONSTRAINT FK__Address__Status___3A6CA48E FOREIGN key ("Status_ID") REFERENCES "Status" ("Status_ID")
);

DROP TABLE IF EXISTS "Audit";

CREATE TABLE "WayMatcher"."Audit" (
    "Audit_ID" int IDENTITY(1, 1) NOT NULL,
    "Message" varchar(max),
    "Entity_Type" varchar(255),
    "Timestamp" datetime2 DEFAULT (sysdatetime()),
    "Entity_ID" int,
    "User_ID" int,
    PRIMARY KEY (Audit_ID),
    CONSTRAINT FK__Audit__User_ID__71BCD978 FOREIGN key ("User_ID") REFERENCES "User" ("User_ID")
);

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

DROP TABLE IF EXISTS "ConfirmationStatus";

CREATE TABLE "WayMatcher"."ConfirmationStatus" (
    "ConfirmationStatus_ID" int IDENTITY(1, 1) NOT NULL,
    "Name" varchar(50) NOT NULL,
    PRIMARY KEY (ConfirmationStatus_ID)
);

DROP TABLE IF EXISTS "Event";

CREATE TABLE "WayMatcher"."Event" (
    "Event_ID" int IDENTITY(1, 1) NOT NULL,
    "EventType_ID" int,
    "Free_Seats" int,
    "Description" varchar(max),
    "Start_Timestamp" datetime2,
    "Schedule_ID" int,
    "Status_ID" int,
    PRIMARY KEY (Event_ID),
    CONSTRAINT FK__Event__Schedule___52442E1F FOREIGN key ("Schedule_ID") REFERENCES "Schedule" ("Schedule_ID"),
    CONSTRAINT FK__Event__Status_ID__53385258 FOREIGN key ("Status_ID") REFERENCES "Status" ("Status_ID")
);

DROP TABLE IF EXISTS "Event_Member";

CREATE TABLE "WayMatcher"."Event_Member" (
    "Member_ID" int IDENTITY(1, 1) NOT NULL,
    "EventMemberType_ID" int,
    "User_ID" int,
    "Event_ID" int,
    "Status_ID" int,
    PRIMARY KEY (Member_ID),
    CONSTRAINT FK__Event_Mem__User___58F12BAE FOREIGN key ("User_ID") REFERENCES "User" ("User_ID"),
    CONSTRAINT FK__Event_Mem__Event__59E54FE7 FOREIGN key ("Event_ID") REFERENCES "Event" ("Event_ID"),
    CONSTRAINT FK__Event_Mem__Statu__5AD97420 FOREIGN key ("Status_ID") REFERENCES "Status" ("Status_ID")
);

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

DROP TABLE IF EXISTS "Rating";

CREATE TABLE "WayMatcher"."Rating" (
    "Rating_ID" int IDENTITY(1, 1) NOT NULL,
    "Rating_Text" varchar(max),
    "Rating_Value" int,
    "Rated_user_ID" int,
    "User_who_rated_ID" int,
    "Status_ID" int,
    PRIMARY KEY (Rating_ID),
    CONSTRAINT FK__Rating__Rated_us__758D6A5C FOREIGN key ("Rated_user_ID") REFERENCES "User" ("User_ID"),
    CONSTRAINT FK__Rating__User_who__76818E95 FOREIGN key ("User_who_rated_ID") REFERENCES "User" ("User_ID"),
    CONSTRAINT FK__Rating__Status_I__7775B2CE FOREIGN key ("Status_ID") REFERENCES "Status" ("Status_ID"),
    CONSTRAINT CK__Rating__Rating_V__74994623 CHECK (
        [Rating_Value] >= (1)
        AND [Rating_Value] <= (5)
    )
);

DROP TABLE IF EXISTS "Role";

CREATE TABLE "WayMatcher"."Role" (
    "Role_ID" int IDENTITY(1, 1) NOT NULL,
    "Name" varchar(255) NOT NULL,
    "Description" varchar(max),
    PRIMARY KEY (Role_ID)
);

DROP TABLE IF EXISTS "Schedule";

CREATE TABLE "WayMatcher"."Schedule" (
    "Schedule_ID" int IDENTITY(1, 1) NOT NULL,
    "Cron_Schedule" varchar(255),
    "User_ID" int,
    PRIMARY KEY (Schedule_ID),
    CONSTRAINT FK__Schedule__User_I__4C8B54C9 FOREIGN key ("User_ID") REFERENCES "User" ("User_ID")
);

DROP TABLE IF EXISTS "Status";

CREATE TABLE "WayMatcher"."Status" (
    "Status_ID" int IDENTITY(1, 1) NOT NULL,
    "Status_Description" varchar(255) NOT NULL,
    PRIMARY KEY (Status_ID)
);

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

DROP TABLE IF EXISTS "User";

CREATE TABLE "WayMatcher"."User" (
    "User_ID" int IDENTITY(1, 1) NOT NULL,
    "Firstname" varchar(255),
    "Name" varchar(255),
    "Username" varchar(255) NOT NULL,
    "Password" varchar(255) NOT NULL,
    "E-Mail" varchar(255) NOT NULL,
    "Telephone" varchar(20),
    "Additional_Description" varchar(max),
    "License_Verified" bit,
    "Profile_Picture" varbinary(max),
    "Creation_Date" datetime2 DEFAULT (sysdatetime()),
    "Address_ID" int,
    "Role_ID" int,
    "Status_ID" int,
    "MfAToken" varchar(64),
    PRIMARY KEY (User_ID),
    CONSTRAINT FK__User__Address_ID__40257DE4 FOREIGN key ("Address_ID") REFERENCES "Address" ("Address_ID"),
    CONSTRAINT FK__User__Role_ID__4119A21D FOREIGN key ("Role_ID") REFERENCES "Role" ("Role_ID"),
    CONSTRAINT FK__User__Status_ID__420DC656 FOREIGN key ("Status_ID") REFERENCES "Status" ("Status_ID")
);

CREATE UNIQUE
INDEX UQ__User__F692CF072516A299 ON "WayMatcher"."User" ("E-Mail");

CREATE UNIQUE
INDEX UQ__User__536C85E44C860875 ON "WayMatcher"."User" ("Username");

DROP TABLE IF EXISTS "Vehicle";

CREATE TABLE "WayMatcher"."Vehicle" (
    "Vehicle_ID" int IDENTITY(1, 1) NOT NULL,
    "Model" varchar(255),
    "Seats" int,
    "Year_of_manufacture" int,
    "Manufacturer_Name" varchar(255),
    "Status_ID" int,
    PRIMARY KEY (Vehicle_ID),
    CONSTRAINT FK__Vehicle__Status___44EA3301 FOREIGN key ("Status_ID") REFERENCES "Status" ("Status_ID")
);

DROP TABLE IF EXISTS "Vehicle_Mapping";

CREATE TABLE "WayMatcher"."Vehicle_Mapping" (
    "Vehicle_Mapping_ID" int IDENTITY(1, 1) NOT NULL,
    "Fuel_Milage" decimal(5, 2),
    "Additional_Info" varchar(max),
    "License_Plate" varchar(20),
    "Vehicle_ID" int,
    "User_ID" int,
    "Status_ID" int,
    PRIMARY KEY (Vehicle_Mapping_ID),
    CONSTRAINT FK__Vehicle_M__Vehic__47C69FAC FOREIGN key ("Vehicle_ID") REFERENCES "Vehicle" ("Vehicle_ID"),
    CONSTRAINT FK__Vehicle_M__User___48BAC3E5 FOREIGN key ("User_ID") REFERENCES "User" ("User_ID"),
    CONSTRAINT FK__Vehicle_M__Statu__49AEE81E FOREIGN key ("Status_ID") REFERENCES "Status" ("Status_ID")
);

DROP VIEW IF EXISTS "vw_EventDetails";

CREATE VIEW vw_EventDetails AS
SELECT
    e.Event_ID,
    e.EventType_ID,
    e.Free_Seats,
    e.Description,
    e.Start_Timestamp,
    e.Schedule_ID,
    e.Status_ID,
    s.Schedule_ID AS Schedule_ScheduleId,
    s.Cron_Schedule,
    st.Stop_ID,
    st.Stop_sequence_number,
    st.Address_ID,
    st.Event_ID AS StopEventId,
    a.Address_ID AS Address_AddressId,
    a.City,
    a.Postal_Code,
    a.Street,
    a.Country,
    a.Country_Code,
    a.Region,
    a.State,
    a.Longitude,
    a.Latitude,
    a.Address_Line1,
    a.Address_Line2,
    em.Member_ID,
    em.EventMemberType_ID,
    em.User_ID,
    em.Event_ID AS EventMemberEventId,
    em.Status_ID AS EventMemberStatusId,
    i.Invite_ID,
    i.ConfirmationStatus_ID,
    i.Is_Request,
    i.Event_ID AS InviteEventId,
    i.User_ID AS InviteUserId
FROM
    Event e
    LEFT JOIN Schedule s ON e.Schedule_ID = s.Schedule_ID
    LEFT JOIN Stop st ON e.Event_ID = st.Event_ID
    LEFT JOIN Address a ON st.Address_ID = a.Address_ID
    LEFT JOIN Event_Member em ON e.Event_ID = em.Event_ID
    LEFT JOIN Invite i ON e.Event_ID = i.Event_ID;
;

DROP VIEW IF EXISTS "vw_PassengerEvents";

CREATE VIEW WayMatcher.vw_PassengerEvents AS
SELECT *
FROM WayMatcher.Event
WHERE
    "EventType_ID" = 2;

DROP VIEW IF EXISTS "vw_PilotEvents";

CREATE VIEW WayMatcher.vw_PilotEvents AS
SELECT *
FROM WayMatcher.Event
WHERE
    "EventType_ID" = 1;

-- Stored procedure for logging audit entries
DROP PROCEDURE IF EXISTS WayMatcher.LogAuditEntry;

CREATE PROCEDURE WayMatcher.LogAuditEntry
    @Message NVARCHAR(MAX),
    @Entity_Type NVARCHAR(255),
    @Entity_ID INT,
    @User_ID INT = NULL -- Optional, replace with appropriate user context if available
AS
BEGIN
    INSERT INTO WayMatcher.Audit (Message, Entity_Type, Entity_ID, User_ID)
    VALUES (@Message, @Entity_Type, @Entity_ID, @User_ID);
END;

-- Drop trigger for Address table
DROP TRIGGER IF EXISTS WayMatcher.trg_Address_Audit;

CREATE TRIGGER trg_Address_Audit
ON WayMatcher.Address
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

        DECLARE @Entity_ID INT = (SELECT TOP 1 Address_ID FROM DELETED);

        EXEC WayMatcher.LogAuditEntry 
            @Message = @Message, 
            @Entity_Type = 'Address', 
            @Entity_ID = @Entity_ID, 
            @User_ID = NULL;
    END
END;

-- Drop trigger for Chat_Message table
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

-- Drop trigger for Event table
DROP TRIGGER IF EXISTS WayMatcher.trg_Event_Audit;

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

-- Drop trigger for Event_Member table
DROP TRIGGER IF EXISTS WayMatcher.trg_Event_Member_Audit;

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

-- Drop trigger for Invite table
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

-- Drop trigger for Notification table
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

-- Drop trigger for Rating table
DROP TRIGGER IF EXISTS WayMatcher.trg_Rating_Audit;

CREATE TRIGGER trg_Rating_Audit
ON WayMatcher.Rating
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

        DECLARE @Entity_ID INT = (SELECT TOP 1 Rating_ID FROM DELETED);

        EXEC WayMatcher.LogAuditEntry 
            @Message = @Message, 
            @Entity_Type = 'Rating', 
            @Entity_ID = @Entity_ID, 
            @User_ID = NULL;
    END
END;

-- Drop trigger for Role table
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

-- Drop trigger for Schedule table
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

-- Drop trigger for Status table
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

-- Drop trigger for Stop table
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

-- Drop trigger for User table
DROP TRIGGER IF EXISTS WayMatcher.trg_User_Audit;

CREATE TRIGGER trg_User_Audit
ON WayMatcher.[User] -- Use square brackets to escape the reserved keyword "User"
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

        DECLARE @Entity_ID INT = (SELECT TOP 1 User_ID FROM DELETED);

        EXEC WayMatcher.LogAuditEntry 
            @Message = @Message, 
            @Entity_Type = 'User', 
            @Entity_ID = @Entity_ID, 
            @User_ID = NULL;
    END
END;

-- Drop trigger for Vehicle table
DROP TRIGGER IF EXISTS WayMatcher.trg_Vehicle_Audit;

CREATE TRIGGER trg_Vehicle_Audit
ON WayMatcher.Vehicle
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

        DECLARE @Entity_ID INT = (SELECT TOP 1 Vehicle_ID FROM DELETED);

        EXEC WayMatcher.LogAuditEntry 
            @Message = @Message, 
            @Entity_Type = 'Vehicle', 
            @Entity_ID = @Entity_ID, 
            @User_ID = NULL;
    END
END;

-- Drop trigger for Vehicle_Mapping table
DROP TRIGGER IF EXISTS WayMatcher.trg_Vehicle_Mapping_Audit;

CREATE TRIGGER trg_Vehicle_Mapping_Audit
ON WayMatcher.Vehicle_Mapping
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

        DECLARE @Entity_ID INT = (SELECT TOP 1 Vehicle_Mapping_ID FROM DELETED);

        EXEC WayMatcher.LogAuditEntry 
            @Message = @Message, 
            @Entity_Type = 'Vehicle_Mapping', 
            @Entity_ID = @Entity_ID, 
            @User_ID = NULL;
    END
END;