DROP TABLE IF EXISTS "WayMatcher"."Vehicle";
CREATE TABLE "WayMatcher"."Vehicle"(
    "Vehicle_ID" int IDENTITY(1,1) NOT NULL,
    "Model" varchar(255),
    "Seats" int,
    "Year_of_manufacture" int,
    "Manufacturer_Name" varchar(255),
    "Status_ID" int,
    PRIMARY KEY(Vehicle_ID),
    CONSTRAINT FK__Vehicle__Status___44EA3301 FOREIGN key("Status_ID") REFERENCES "Status"("Status_ID")
);

DROP TRIGGER IF EXISTS "WayMatcher"."trg_Vehicle_Audit";
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