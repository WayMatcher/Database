DROP TABLE IF EXISTS "ConfirmationStatus";

CREATE TABLE "WayMatcher"."ConfirmationStatus" (
    "ConfirmationStatus_ID" int IDENTITY(1, 1) NOT NULL,
    "Name" varchar(50) NOT NULL,
    PRIMARY KEY (ConfirmationStatus_ID)
);
