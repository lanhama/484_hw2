SELECT DISTINCT S1.SID, S1.Name
FROM Students S1, Students S2, Projects M
WHERE
S1.SID != S2.SID AND
    EXISTS (SELECT *
    FROM Enrollments
        INNER JOIN Courses ON Enrollments.CID=Courses.CID
    WHERE SID=S2.SID AND C_Name='EECS280')
    AND EXISTS
        (SELECT *
    FROM Enrollments
        INNER JOIN Courses ON Enrollments.CID=Courses.CID
    WHERE SID=S2.SID AND (C_Name='EECS485' OR C_Name='EECS484'))
    AND EXISTS
        (SELECT *
    FROM Enrollments
        INNER JOIN Courses ON Enrollments.CID=Courses.CID
    WHERE SID=S2.SID AND (C_Name='EECS483' OR C_Name='EECS482'))
    AND
    EXISTS (SELECT *
    FROM
        Members
    WHERE SID=S1.SID AND PID=M.PID)
    AND
    EXISTS (SELECT *
    FROM
        Members
    WHERE SID=S2.SID AND PID=M.PID)
ORDER BY S1.Name DESC;
