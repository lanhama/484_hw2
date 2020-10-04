-- CREATE VIEW ClassLayout AS
-- SELECT *
-- FROM Enrollments e
-- INNER JOIN Courses c on e.CID=c.CID
-- INNER JOIN Students s on e.'SID'=S.SID;

-- CREATE VIEW eecsHeavy AS
-- SELECT S.SID
-- FROM Students s, ClassLayout v
-- WHERE
-- S.SID=v.'SID' AND v.C_Name='EECS 280'
-- INTERSECT
-- SELECT S.SID
-- FROM Students s, ClassLayout v
-- WHERE
-- S.SID=v.'SID' AND (v.C_Name='EECS 485' OR v.C_Name='EECS484')
-- INTERSECT
-- SELECT S.SID
-- FROM Students s, ClassLayout v
-- WHERE
-- S.SID=v.'SID' AND (v.C_Name='EECS 483' OR v.C_Name='EECS482');

-- SELECT * 
-- FROM Members m, ClassLayout v, Students s
-- WHERE v.'SID'=m.'SID' AND S.SID=m.'SID'

-- select the people that are in the same projects as the people in that view

-- SELECT S1.'SID', S2.'SID' -- COUNT(*) AS counter -- DISTINCT m.'SID', s.Name
-- FROM Members m
-- INNER JOIN Students s ON m.'SID'=S.SID
-- INNER JOIN Projects p ON M.PID=P.PID
-- GROUP BY m.PID
-- HAVING (EXISTS (SELECT * FROM Enrollments WHERE 'SID'= ))

-- SELECT * FROM Students S2
-- JOIN
SELECT 'SID', Name
FROM Members
NATURAL JOIN Students
WHERE PID=(
    SELECT PID
    FROM Members
    WHERE 'SID'=(
        SELECT DISTINCT 'SID'
        FROM Enrollments E
        NATURAL JOIN Students S
        NATURAL JOIN Courses C
        WHERE
        EXISTS
        (SELECT *
        FROM Enrollments
        NATURAL JOIN Courses
        WHERE 'SID'=S.SID AND C_Name='EECS280')
        AND
        EXISTS
        (SELECT *
        FROM Enrollments
        NATURAL JOIN Courses
        WHERE 'SID'=S.SID AND (C_Name='EECS485') OR (C_Name='EECS484'))
        AND
        EXISTS
        (SELECT *
        FROM Enrollments
        NATURAL JOIN Courses
        WHERE 'SID'=S.SID AND (C_Name='EECS483') OR (C_Name='EECS482'))
    )
)
ORDER BY Name;
