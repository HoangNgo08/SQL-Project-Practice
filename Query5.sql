SELECT Guest.LastName, Guest.FirstName,Booking.RoomID, StartDate, EndDate, Booking.TotalCharge
FROM Booking
INNER JOIN GUEST ON GUEST.GuestID = Booking.GuestID
WHERE TotalCharge IN (SELECT MAX(TotalCharge) FROM BOOKING)


