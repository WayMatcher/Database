-- Insert into Status
INSERT INTO Status (Status_Description) 
VALUES 
('Active'), 
('Inactive'), 
('Banned'), 
('Expired'), 
('Completed'), 
('Cancelled');

-- Insert into Role
INSERT INTO Role (Name, Description) 
VALUES 
('Admin', 'System Administrator'), 
('User', 'Regular User');

-- Insert into Address
INSERT INTO Address (City, Postal_Code, Street, Country, Country_Code, Region, State, Longitude, Latitude, Address_Line1, Address_Line2, Status_ID)
VALUES 
('New York', '10001', '5th Avenue', 'USA', 'US', 'NY', 'New York', -74.006, 40.7128, '123 Main St', 'Apt 4B', 1),
('Los Angeles', '90001', 'Sunset Blvd', 'USA', 'US', 'CA', 'California', -118.2437, 34.0522, '456 Elm St', 'Suite 301', 1),
('Chicago', '60601', 'Michigan Ave', 'USA', 'US', 'IL', 'Illinois', -87.6298, 41.8781, '789 Oak St', 'Floor 2', 1);

-- Insert into User
INSERT INTO [User] (Firstname, Name, Username, Password, [E-Mail], Telephone, Additional_Description, License_Verified, Profile_Picture, Address_ID, Role_ID, Status_ID)
VALUES 
('John', 'Doe', 'johndoe', 'password123', 'john@example.com', '1234567890', 'Test user', 1, NULL, 2, 2, 1),
('Jane', 'Smith', 'janesmith', 'securepass', 'jane@example.com', '9876543210', 'Experienced driver', 1, NULL, 4, 2, 1),
('Alice', 'Johnson', 'alicej', 'alice123', 'alice@example.com', '5552223333', 'Frequent traveler', 0, NULL, 3, 2, 1),
('Robert', 'Brown', 'robbrown', 'pass456', 'robert@example.com', '4445556666', 'Rideshare driver', 1, NULL, 5, 2, 1),
('Emily', 'Davis', 'emilyd', 'emilysecure', 'emily@example.com', '7778889999', 'Long-distance traveler', 0, NULL, 3, 2, 1),
('Michael', 'Wilson', 'michaelw', 'mikepass', 'michael@example.com', '1112223333', 'Tech enthusiast', 1, NULL, 3, 2, 1),
('Sarah', 'Miller', 'sarahm', 'sarahpass', 'sarah@example.com', '6667778888', 'Frequent event organizer', 1, NULL, 2, 2, 1),
('David', 'Anderson', 'davea', 'davepass', 'david@example.com', '3334445555', 'Professional chauffeur', 1, NULL, 4, 2, 1),
('Jessica', 'Martinez', 'jessm', 'jesspass', 'jessica@example.com', '9990001111', 'Adventure traveler', 0, NULL, 5, 2, 1),
('William', 'Harris', 'willh', 'willpass', 'william@example.com', '2223334444', 'Business commuter', 1, NULL, 2, 2, 1);

-- Insert into Vehicle
INSERT INTO Vehicle (Model, Seats, Year_of_manufacture, Manufacturer_Name, Status_ID)
VALUES 
('Tesla Model 3', 5, 2022, 'Tesla', 1),
('Ford Mustang', 4, 2019, 'Ford', 1),
('Honda Civic', 5, 2020, 'Honda', 1);

-- Insert into Vehicle_Mapping
INSERT INTO Vehicle_Mapping (Fuel_Milage, Additional_Info, License_Plate, Vehicle_ID, User_ID, Status_ID)
VALUES 
(25.5, 'Electric car', 'ABC-123', 1, 1, 1),
(20.2, 'Sports car', 'XYZ-789', 2, 2, 1),
(30.1, 'Reliable sedan', 'LMN-456', 3, 3, 1);

-- Insert into Schedule
INSERT INTO Schedule (Cron_Schedule, User_ID) 
VALUES 
('0 0 * * *', 1), 
('30 14 * * 1-5', 2), 
('15 8 * * *', 3);

-- Insert into EventType
INSERT INTO EventType (Name) 
VALUES 
('Pilot'),
('Passenger'); 

-- Insert into Event
INSERT INTO Event (EventType_ID, Free_Seats, Description, Start_Timestamp, Schedule_ID, Status_ID)
VALUES 
(1, 3, 'Trip to airport', GETDATE(), 1, 1),
(2, 1, 'Scenic flight over the city', GETDATE(), 2, 1),
(2, 2, 'VIP transport service', GETDATE(), 3, 1);

-- Insert into EventMemberType
INSERT INTO EventMemberType (Name) 
VALUES
('Pilot'), 
('Passenger');

-- Insert into Event_Member
INSERT INTO Event_Member (EventMemberType_ID, User_ID, Event_ID, Status_ID)
VALUES 
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 3, 1);

-- Insert into Chat_Message
INSERT INTO Chat_Message (Message, Timestamp, User_ID, Event_ID)
VALUES 
('Hello, everyone!', GETDATE(), 1, 1),
('Is the trip still on?', GETDATE(), 2, 2),
('Looking forward to the ride!', GETDATE(), 3, 3);

-- Insert into ConfirmationStatus
INSERT INTO ConfirmationStatus (Name) 
VALUES 
('Accepted'), 
('Declined'), 
('Pending'), 
('Cancelled'), 
('Expired');

-- Insert into Invite
INSERT INTO Invite (ConfirmationStatus_ID, Is_Request, Event_ID, User_ID)
VALUES 
(1, 0, 1, 1),
(3, 1, 2, 2),
(2, 0, 3, 3);

-- Insert into Notification
INSERT INTO Notification ([Read], Message, Entity_Type, Entity_ID, User_ID)
VALUES 
(0, 'You have a new invite', 'Event', 1, 1),
(1, 'Your trip has been confirmed', 'Event', 2, 2),
(0, 'Reminder: Your event starts soon', 'Event', 3, 3);

-- Insert into Stop
INSERT INTO Stop (Stop_sequence_number, Address_ID, Event_ID)
VALUES 
(1, 1, 1),
(2, 2, 1),
(1, 3, 2);

-- Insert into Audit
INSERT INTO Audit (Message, Entity_Type, Entity_ID, User_ID)
VALUES 
('User created', 'User', 1, 1),
('Event updated', 'Event', 2, 2),
('Vehicle registered', 'Vehicle', 3, 3);

-- Insert into Rating
INSERT INTO Rating (Rating_Text, Rating_Value, Rated_user_ID, User_who_rated_ID, Status_ID)
VALUES 
('Great driver!', 5, 1, 2, 1),
('Smooth ride, very punctual', 4, 2, 3, 1),
('Friendly and professional', 5, 3, 1, 1);
