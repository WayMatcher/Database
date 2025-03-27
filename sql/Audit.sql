DROP TABLE IF EXISTS "WayMatcher"."Audit";
CREATE TABLE "WayMatcher"."Audit"(
    "Audit_ID" int IDENTITY(1,1) NOT NULL,
    "Message" varchar(max),
    "Entity_Type" varchar(255),
    "Timestamp" datetime2 DEFAULT (sysdatetime()),
    "Entity_ID" int,
    "User_ID" int,
    PRIMARY KEY(Audit_ID),
    CONSTRAINT FK__Audit__User_ID__71BCD978 FOREIGN key("User_ID") REFERENCES "User"("User_ID")
);