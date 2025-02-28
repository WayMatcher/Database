# Entities

## User

- **User ID**
- Firstname
- Name
- Username
- Password (Hashed and salted)
- E-Mail
- Telephone
- Additonal Description
- Driver's License (Verified or not)
- Profile Picture
- Creation Date
- *Address ID* (Home Address)
- *Role ID*
- *Status ID*

## Vehicle Mapping

- **Vehicle Mapping ID**
- Fuel Milage
- Additional Info
- License Plate
- *Vehicle ID*
- *User ID*
- *Status ID*

## Status

- *Status ID*
- Status Description

## Roles

- **Role ID**
- Name
- Description

## Address

- **Address ID**
- City
- Postal Code
- Street (*with number*)
- Country
- Country Code
- Region
- State
- Longitude
- Latitude
- Address Line1
- Address Line2
- *Status ID*

[*Address Autocomplete API*](https://www.geoapify.com/address-autocomplete/#:~:text=Here%27s%20an%20example%20of%20a%20bounding%20box%20and%20coordinates%20that%20can%20be%20used%20to%20show%20results%20on%20a%20map%20and%20allow%20users%20to%20search%20for%20what%20they%20need)

## Vehicle

- **Vehicle ID**
- Model
- Seats
- Year of manufacture
- Manufacturer Name
- *Status ID*

## Event

- **Event ID**
- Type (Passenger or Pilot)
- Free Seats
- Description
- Start Timestamp (= Deperature Time)
- *Schedule ID*
- *Status ID*

Free Seats will be `NULL` when the Event is created by a passenger (=> Type == `Passenger`).
Free Seats can be defined by the Pilot, if it's a Pilot created Event.

## Event Member

- **Member ID**
- Type (Pilot (= Owner/Creator) or Passenger)
- *User ID*
- *Event ID*
- *Status ID*

## Chat Message

- **Chat Message ID**
- Message
- Timestamp
- *User ID*
- *Event ID*

Chat messages can only be sent in Chats that are only available in Events (Therfore the foregin key of Event ID exists here)

## Invite

- **Invite ID**
- Confirmation Status (Accepted, Declined and Pending)
- Is Request (Boolean)
- *Event ID*
- *User ID*

## Notification

- **Notification ID**
- Read (Boolean)
- Message (What happened? (=> Invite, Cancellation, etc.))
- Entitiy Type (What was affected)
- *Entity ID* (What exactly was affected)
- *User ID* (The user who got the notification)

## Stop

- **Stop ID**
- Stop sequence number
- *Address ID*
- *Event ID*

## Schedule

- **Schedule ID**
- Cron Schedule
- *User ID*

## Audit

- **Audit ID**
- Message (What happened -> Created/Updated/(Soft-)Deleted)
- Entity Type
- Timestamp
- *Entity ID* (UserID, EventID, ... => Dependent on Type)
- *User ID* (Who did it)

## Rating

- **Rating ID**
- Rating Text
- Rating Value (*Value from 1-5*)
- *Rated user ID*
- *User who rated ID*
- *Status ID*

---

## Legend

- **Primary Key**
- *Foreign Key*
- Attribute
