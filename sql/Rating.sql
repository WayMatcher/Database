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
