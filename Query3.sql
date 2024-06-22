SELECT Room.RoomID, TypeDescription, PricePerNight, MotelName
FROM ROOM
INNER JOIN RoomType ON Room.TypeID = RoomType.TypeID
INNER JOIN Motel ON ROOM.MotelID = Motel.MotelID
WHERE PricePerNight <= 200 AND MotelName = 'ECMG Melbourne';

