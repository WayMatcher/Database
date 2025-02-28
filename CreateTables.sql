-- Drop tables in reverse order of creation to avoid foreign key constraint issues

IF OBJECT_ID('Rating', 'U') IS NOT NULL DROP TABLE Rating;
IF OBJECT_ID('Audit', 'U') IS NOT NULL DROP TABLE Audit;
IF OBJECT_ID('Stop', 'U') IS NOT NULL DROP TABLE Stop;
IF OBJECT_ID('Notification', 'U') IS NOT NULL DROP TABLE Notification;
IF OBJECT_ID('Invite', 'U') IS NOT NULL DROP TABLE Invite;
IF OBJECT_ID('ConfirmationStatus', 'U') IS NOT NULL DROP TABLE ConfirmationStatus;  -- Drop lookup table
IF OBJECT_ID('Chat_Message', 'U') IS NOT NULL DROP TABLE Chat_Message;
IF OBJECT_ID('Event_Member', 'U') IS NOT NULL DROP TABLE Event_Member;
IF OBJECT_ID('EventMemberType', 'U') IS NOT NULL DROP TABLE EventMemberType; -- Drop lookup table
IF OBJECT_ID('Event', 'U') IS NOT NULL DROP TABLE Event;
IF OBJECT_ID('EventType', 'U') IS NOT NULL DROP TABLE EventType; -- Drop lookup table
IF OBJECT_ID('Schedule', 'U') IS NOT NULL DROP TABLE Schedule;
IF OBJECT_ID('Vehicle_Mapping', 'U') IS NOT NULL DROP TABLE Vehicle_Mapping;
IF OBJECT_ID('Vehicle', 'U') IS NOT NULL DROP TABLE Vehicle;
IF OBJECT_ID('[User]', 'U') IS NOT NULL DROP TABLE [User];  -- Brackets for reserved word
IF OBJECT_ID('Address', 'U') IS NOT NULL DROP TABLE Address;
IF OBJECT_ID('Role', 'U') IS NOT NULL DROP TABLE Role;
IF OBJECT_ID('Status', 'U') IS NOT NULL DROP TABLE Status;


-- Create the Status table
CREATE TABLE Status (
    Status_ID INT PRIMARY KEY IDENTITY(1,1),
    Status_Description VARCHAR(255) NOT NULL
);

-- Create the Role table
CREATE TABLE Role (
    Role_ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(255) NOT NULL,
    Description VARCHAR(MAX)
);

-- Create the Address table
CREATE TABLE Address (
    Address_ID INT PRIMARY KEY IDENTITY(1,1),
    City VARCHAR(255),
    Postal_Code VARCHAR(20),
    Street VARCHAR(255), -- Street Number removed, now combined in Street
    Country VARCHAR(255),
    Country_Code VARCHAR(10),
    Region VARCHAR(255),
    State VARCHAR(255),
    Longitude FLOAT,
    Latitude FLOAT,
    Address_Line1 VARCHAR(255),
    Address_Line2 VARCHAR(255),
    Status_ID INT,
    FOREIGN KEY (Status_ID) REFERENCES Status(Status_ID)
);

-- Create the User table
CREATE TABLE [User] (
    User_ID INT PRIMARY KEY IDENTITY(1,1),
    Firstname VARCHAR(255),
    Name VARCHAR(255),
    Username VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    [E-Mail] VARCHAR(255) UNIQUE NOT NULL,
    Telephone VARCHAR(20),
    Additional_Description VARCHAR(MAX),
    License_Verified BIT,
    Profile_Picture VARBINARY(MAX),
    Creation_Date DATETIME2 DEFAULT SYSDATETIME(),
    Address_ID INT,
    Role_ID INT,
    Status_ID INT,
    FOREIGN KEY (Address_ID) REFERENCES Address(Address_ID),
    FOREIGN KEY (Role_ID) REFERENCES Role(Role_ID),
    FOREIGN KEY (Status_ID) REFERENCES Status(Status_ID)
);

-- Create the Vehicle table
CREATE TABLE Vehicle (
    Vehicle_ID INT PRIMARY KEY IDENTITY(1,1),
    Model VARCHAR(255),
    Seats INT,
    Year_of_manufacture INT,
    Manufacturer_Name VARCHAR(255),
    Status_ID INT,
    FOREIGN KEY (Status_ID) REFERENCES Status(Status_ID)
);

-- Create the Vehicle_Mapping table
CREATE TABLE Vehicle_Mapping (
    Vehicle_Mapping_ID INT PRIMARY KEY IDENTITY(1,1),
    Fuel_Milage DECIMAL(5, 2),
    Additional_Info VARCHAR(MAX),
    License_Plate VARCHAR(20),
    Vehicle_ID INT,
    User_ID INT,
    Status_ID INT,
    FOREIGN KEY (Vehicle_ID) REFERENCES Vehicle(Vehicle_ID),
    FOREIGN KEY (User_ID) REFERENCES [User](User_ID),
    FOREIGN KEY (Status_ID) REFERENCES Status(Status_ID)
);

-- Create the Schedule table
CREATE TABLE Schedule (
    Schedule_ID INT PRIMARY KEY IDENTITY(1,1),
    Cron_Schedule VARCHAR(255),
    User_ID INT,
    FOREIGN KEY (User_ID) REFERENCES [User](User_ID)
);

-- Create EventType table (Recommended)
CREATE TABLE EventType (
    EventType_ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50) NOT NULL  -- e.g., 'Passenger', 'Pilot'
);

-- Create the Event table
CREATE TABLE Event (
    Event_ID INT PRIMARY KEY IDENTITY(1,1),
    EventType_ID INT,  -- Foreign Key to EventType
    Free_Seats INT,  -- Can be NULL
    Description VARCHAR(MAX),
    Start_Timestamp DATETIME2,
    Schedule_ID INT,
    Status_ID INT,
    FOREIGN KEY (EventType_ID) REFERENCES EventType(EventType_ID),
    FOREIGN KEY (Schedule_ID) REFERENCES Schedule(Schedule_ID),
    FOREIGN KEY (Status_ID) REFERENCES Status(Status_ID)
);

-- Create EventMemberType table (Recommended)
CREATE TABLE EventMemberType (
    EventMemberType_ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50) NOT NULL  -- e.g., 'Pilot', 'Passenger'
);

-- Create the Event_Member table
CREATE TABLE Event_Member (
    Member_ID INT PRIMARY KEY IDENTITY(1,1),
    EventMemberType_ID INT,  -- Foreign key to EventMemberType
    User_ID INT,
    Event_ID INT,
    Status_ID INT,
    FOREIGN KEY (EventMemberType_ID) REFERENCES EventMemberType(EventMemberType_ID),
    FOREIGN KEY (User_ID) REFERENCES [User](User_ID),
    FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID),
    FOREIGN KEY (Status_ID) REFERENCES Status(Status_ID)
);

-- Create the Chat_Message table
CREATE TABLE Chat_Message (
    Chat_Message_ID INT PRIMARY KEY IDENTITY(1,1),
    Message VARCHAR(MAX),
    Timestamp DATETIME2 DEFAULT SYSDATETIME(),
    User_ID INT,
    Event_ID INT,
    FOREIGN KEY (User_ID) REFERENCES [User](User_ID),
    FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID)
);

-- Create ConfirmationStatus table (Recommended)
CREATE TABLE ConfirmationStatus (
    ConfirmationStatus_ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50) NOT NULL  -- e.g., 'Accepted', 'Declined', 'Pending'
);

-- Create the Invite table
CREATE TABLE Invite (
    Invite_ID INT PRIMARY KEY IDENTITY(1,1),
    ConfirmationStatus_ID INT,  -- Foreign Key to ConfirmationStatus
    Is_Request BIT,
    Event_ID INT,
    User_ID INT,
    FOREIGN KEY (ConfirmationStatus_ID) REFERENCES ConfirmationStatus(ConfirmationStatus_ID),
    FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID),
    FOREIGN KEY (User_ID) REFERENCES [User](User_ID)
);

-- Create the Notification table
CREATE TABLE Notification (
    Notification_ID INT PRIMARY KEY IDENTITY(1,1),
    [Read] BIT DEFAULT 0,
    Message VARCHAR(MAX),
    Entity_Type VARCHAR(255),
    Entity_ID INT,
    User_ID INT,
    FOREIGN KEY (User_ID) REFERENCES [User](User_ID)
);

-- Create the Stop table
CREATE TABLE Stop (
    Stop_ID INT PRIMARY KEY IDENTITY(1,1),
    Stop_sequence_number INT,
    Address_ID INT,
    Event_ID INT,
    FOREIGN KEY (Address_ID) REFERENCES Address(Address_ID),
    FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID)
);

-- Create the Audit table
CREATE TABLE Audit (
    Audit_ID INT PRIMARY KEY IDENTITY(1,1),
    Message VARCHAR(MAX), -- Action is now contained within Message
    Entity_Type VARCHAR(255),
    Timestamp DATETIME2 DEFAULT SYSDATETIME(),
    Entity_ID INT,
    User_ID INT,
    FOREIGN KEY (User_ID) REFERENCES [User](User_ID)
);

-- Create the Rating table
CREATE TABLE Rating (
    Rating_ID INT PRIMARY KEY IDENTITY(1,1),
    Rating_Text VARCHAR(MAX),
    Rating_Value INT CHECK (Rating_Value >= 1 AND Rating_Value <= 5),
    Rated_user_ID INT,
    User_who_rated_ID INT,
    Status_ID INT,
    FOREIGN KEY (Rated_user_ID) REFERENCES [User](User_ID),
    FOREIGN KEY (User_who_rated_ID) REFERENCES [User](User_ID),
    FOREIGN KEY (Status_ID) REFERENCES Status(Status_ID)
);

-- Sample Data (Adapted for SQL Server and new tables)
INSERT INTO Status (Status_Description) VALUES
('Active'), ('Inactive'), ('Pending'), ('Approved'), ('Rejected'), ('Deleted');

INSERT INTO Role (Name, Description) VALUES
('Admin', 'Administrator with full access'),
('User', 'Regular user'),
('Driver', 'User who can drive vehicles');

INSERT INTO Address (City, Postal_Code, Street, Country, Country_Code, Status_ID) VALUES
('Example City', '12345', 'Example Street 123', 'Example Country', 'EC', 1),
('Another City', '67890', 'Another Street 456', 'Another Country', 'AC', 1);

INSERT INTO [User] (Firstname, Name, Username, Password, [E-Mail], Telephone, Address_ID, Role_ID, Status_ID, License_Verified) VALUES
('John', 'Doe', 'johndoe', 'hashed_password', 'john.doe@example.com', '123-456-7890', 1, 2, 1, 1),
('Jane', 'Doe', 'janedoe', 'hashed_password2', 'jane.doe@example.com', '098-765-4321', 2, 1, 1, 0);

INSERT INTO Vehicle (Model, Seats, Year_of_manufacture, Manufacturer_Name, Status_ID) VALUES
('Sedan', 5, 2022, 'Toyota', 1),
('SUV', 7, 2023, 'Honda', 1);

INSERT INTO Vehicle_Mapping (Fuel_Milage, Additional_Info, License_Plate, Vehicle_ID, User_ID, Status_ID) VALUES
(25.5, 'Good condition', 'ABC-123', 1, 1, 1),
(18.2, 'Needs maintenance', 'XYZ-789', 2, 2, 1);

INSERT INTO EventType (Name) VALUES ('Passenger'), ('Pilot');
INSERT INTO EventMemberType (Name) VALUES ('Pilot'), ('Passenger');
INSERT INTO ConfirmationStatus (Name) VALUES ('Accepted'), ('Declined'), ('Pending');