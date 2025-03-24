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
