SELECT FirstName, LastName, MobilePhone, Count(Booking.GuestID) AS NumOfBookings
FROM Guest
INNER JOIN BOOKING ON (Guest.GuestID = Booking.GuestID)
GROUP BY Guest.GuestID HAVING NumOfBookings>1
