DROP VIEW IF EXISTS "WayMatcher"."vw_EventDetails";
CREATE VIEW vw_EventDetails AS
SELECT 
    e.Event_ID,
    e.EventType_ID,
    e.Free_Seats,
    e.Description,
    e.Start_Timestamp,
    e.Schedule_ID,
    e.Status_ID,
    s.Schedule_ID AS Schedule_ScheduleId,
    s.Cron_Schedule,
    st.Stop_ID,
    st.Stop_sequence_number,
    st.Address_ID,
    st.Event_ID AS StopEventId,
    a.Address_ID AS Address_AddressId,
    a.City,
    a.Postal_Code,
    a.Street,
    a.Country,
    a.Country_Code,
    a.Region,
    a.State,
    a.Longitude,
    a.Latitude,
    a.Address_Line1,
    a.Address_Line2,
    em.Member_ID,
    em.EventMemberType_ID,
    em.User_ID,
    em.Event_ID AS EventMemberEventId,
    em.Status_ID AS EventMemberStatusId,
    i.Invite_ID,
    i.ConfirmationStatus_ID,
    i.Is_Request,
    i.Event_ID AS InviteEventId,
    i.User_ID AS InviteUserId
FROM 
    Event e
LEFT JOIN 
    Schedule s ON e.Schedule_ID = s.Schedule_ID
LEFT JOIN 
    Stop st ON e.Event_ID = st.Event_ID
LEFT JOIN 
    Address a ON st.Address_ID = a.Address_ID
LEFT JOIN 
    Event_Member em ON e.Event_ID = em.Event_ID
LEFT JOIN 
    Invite i ON e.Event_ID = i.Event_ID;;

DROP VIEW IF EXISTS "WayMatcher"."vw_PassengerEvents";
CREATE VIEW WayMatcher.vw_PassengerEvents
AS
SELECT * FROM WayMatcher.Event WHERE "EventType_ID" = 2;

DROP VIEW IF EXISTS "WayMatcher"."vw_PilotEvents";
CREATE VIEW WayMatcher.vw_PilotEvents
AS
SELECT * FROM WayMatcher.Event WHERE "EventType_ID" = 1;