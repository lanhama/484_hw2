SELECT S.SID, Name
FROM Members
    INNER JOIN Students S ON Members.SID=S.SID
WHERE PID=(
    SELECT PID
FROM Members
WHERE SID=(
        SELECT DISTINCT S2.SID
FROM Enrollments E
    INNER JOIN Students S2 ON E.SID=S2.SID
    INNER JOIN Courses C ON E.CID=C.CID
WHERE EXISTS
        (SELECT *
    FROM Enrollments
        INNER JOIN Courses ON Enrollments.CID=Courses.CID
    WHERE SID=S2.SID AND C_Name='EECS280')
    AND EXISTS
        (SELECT *
    FROM Enrollments
        INNER JOIN Courses ON Enrollments.CID=Courses.CID
    WHERE SID=S2.SID AND (C_Name='EECS485') OR (C_Name='EECS484'))
    AND EXISTS
        (SELECT *
    FROM Enrollments
        INNER JOIN Courses ON Enrollments.CID=Courses.CID
    WHERE SID=S2.SID AND (C_Name='EECS483') OR (C_Name='EECS482'))
    )
)
ORDER BY Name DESC;
