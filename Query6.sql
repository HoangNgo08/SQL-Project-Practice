SELECT MotelName, COUNT(Booking.RoomID) AS NumberOfBookings
FROM Room
INNER JOIN Motel ON Motel.MotelID = Room.MotelID
INNER JOIN BOOKING ON Room.RoomID = Booking.RoomID
GROUP BY MotelName HAVING NumberOfBookings = (SELECT MAX(NumberOfBookings)
FROM (SELECT MotelName, COUNT(Booking.RoomID) AS NumberOfBookings
FROM Room
INNER JOIN Motel ON Motel.MotelID = Room.MotelID
INNER JOIN BOOKING ON Room.RoomID = Booking.RoomID
GROUP BY MotelName) as t2);

