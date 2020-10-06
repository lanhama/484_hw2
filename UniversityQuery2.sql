CREATE VIEW Students_taking_classes
AS
    SELECT DISTINCT S2.SID
    FROM Students S2
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
        WHERE SID=S2.SID AND (C_Name='EECS483') OR (C_Name='EECS482'));

SELECT DISTINCT S.SID, S.Name
FROM Students S, Members M
WHERE
EXISTS (SELECT *
    FROM Members
    WHERE PID=M.PID AND SID != S.SID AND SID IN (
        SELECT SID
        FROM Students_taking_classes
)
)
    AND
    EXISTS (SELECT *
    FROM
        Members
    WHERE SID=S.SID AND PID=M.PID);

-- DROP VIEW Students_taking_classes;


-- SELECT DISTINCT S.SID, S.Name
-- FROM Students S, Members M
-- WHERE
-- EXISTS (SELECT *
--     FROM Members
--     WHERE
--     PID=M.PID AND SID != S.SID AND
--         SID IN (
--             SELECT DISTINCT S2.SID
--         FROM Enrollments E
--             INNER JOIN Students S2 ON E.SID=S2.SID
--             INNER JOIN Courses C ON E.CID=C.CID
--         WHERE EXISTS
--         (SELECT *
--             FROM Enrollments
--                 INNER JOIN Courses ON Enrollments.CID=Courses.CID
--             WHERE SID=S2.SID AND C_Name='EECS280')
--             AND EXISTS
--         (SELECT *
--             FROM Enrollments
--                 INNER JOIN Courses ON Enrollments.CID=Courses.CID
--             WHERE SID=S2.SID AND (C_Name='EECS485') OR (C_Name='EECS484'))
--             AND EXISTS
--         (SELECT *
--             FROM Enrollments
--                 INNER JOIN Courses ON Enrollments.CID=Courses.CID
--             WHERE SID=S2.SID AND (C_Name='EECS483') OR (C_Name='EECS482'))
-- )
-- )
--     AND
--     EXISTS (SELECT *
--     FROM
--         Members
--     WHERE SID=S.SID AND PID=M.PID);
