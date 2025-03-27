DROP TABLE IF EXISTS "WayMatcher"."Address";
CREATE TABLE "WayMatcher"."Address"(
    "Address_ID" int IDENTITY(1,1) NOT NULL,
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
    PRIMARY KEY(Address_ID),
    CONSTRAINT FK__Address__Status___3A6CA48E FOREIGN key("Status_ID") REFERENCES "Status"("Status_ID")
);

DROP TRIGGER IF EXISTS "WayMatcher"."trg_Address_Audit";
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
