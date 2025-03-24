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

CREATE UNIQUE INDEX UQ__User__F692CF072516A299 ON "WayMatcher"."User" ("E-Mail");
CREATE UNIQUE INDEX UQ__User__536C85E44C860875 ON "WayMatcher"."User" ("Username");

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
