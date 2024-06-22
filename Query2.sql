SELECT ANY_VALUE(FirstName_EMP) AS FirstName,ANY_VALUE(LastName_EMP) AS LastName, MotelName, COUNT(Room.MotelID) As NumOfRoomsManaged
FROM Motel
INNER JOIN EMPLOYEE ON Motel.MotelID = Employee.MotelID
INNER JOIN ROOM ON Motel.MotelID = Room.MotelID
GROUP BY MotelName
ORDER BY NumOfRoomsManaged DESC;