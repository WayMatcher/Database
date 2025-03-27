DROP TABLE IF EXISTS "WayMatcher"."Vehicle_Mapping";
CREATE TABLE "WayMatcher"."Vehicle_Mapping"(
    "Vehicle_Mapping_ID" int IDENTITY(1,1) NOT NULL,
    "Fuel_Milage" decimal(5,2),
    "Additional_Info" varchar(max),
    "License_Plate" varchar(20),
    "Vehicle_ID" int,
    "User_ID" int,
    "Status_ID" int,
    PRIMARY KEY(Vehicle_Mapping_ID),
    CONSTRAINT FK__Vehicle_M__Vehic__47C69FAC FOREIGN key("Vehicle_ID") REFERENCES "Vehicle"("Vehicle_ID"),
    CONSTRAINT FK__Vehicle_M__User___48BAC3E5 FOREIGN key("User_ID") REFERENCES "User"("User_ID"),
    CONSTRAINT FK__Vehicle_M__Statu__49AEE81E FOREIGN key("Status_ID") REFERENCES "Status"("Status_ID")
);

DROP TRIGGER IF EXISTS "WayMatcher"."trg_Vehicle_Mapping_Audit";
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