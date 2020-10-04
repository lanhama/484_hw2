CREATE VIEW Classes AS
SELECT *
FROM Enrollments
NATURAL JOIN Courses;

SELECT DISTINCT "SID"
FROM Students S
WHERE
EXISTS (
    SELECT * FROM Classes
    WHERE C_Name="EECS442"
    AND "SID"=S."SID"
)
AND
EXISTS (
    SELECT * FROM Classes
    WHERE C_Name="EECS445"
    AND "SID"=S."SID"

)
AND
EXISTS (
    SELECT * FROM Classes
    WHERE C_Name="EECS492"
    AND "SID"=S."SID"
)
OR
(
    EXISTS (
        SELECT * FROM Classes
        WHERE C_Name="EECS482"
        AND "SID"=S."SID"
    )
AND
    EXISTS (
        SELECT * FROM Classes
        WHERE C_Name="EECS486"
        AND "SID"=S."SID"
    )
)
OR
    EXISTS (
        SELECT * FROM Classes
        WHERE C_Name="EECS281"
        AND "SID"=S."SID"
    )
ORDER BY SID;

DROP VIEW Classes;
