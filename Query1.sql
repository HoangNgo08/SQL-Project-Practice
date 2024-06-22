SELECT Room.RoomID, TypeDescription, MotelName, PricePerNight
From ROOM
INNER JOIN RoomType ON Room.TypeID = Roomtype.TypeID
INNER JOIN Motel ON Room.MotelID = Motel.MotelID
HAVING Room.RoomID NOT IN (Select Booking.RoomID From Booking);
