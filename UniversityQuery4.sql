CREATE VIEW StudentPairs
AS
            SELECT DISTINCT S1.SID AS SID1, S2.SID AS SID2
        FROM Students S1, Students S2, Courses C
        WHERE EXISTS (SELECT *
            FROM Enrollments
            WHERE SID=S1.SID AND CID=C.CID)
            AND
            EXISTS (SELECT *
            FROM Enrollments
            WHERE SID=S2.SID AND CID=C.CID)
            AND S1.SID < S2.SID
    MINUS
        SELECT DISTINCT S1.SID AS SID1, S2.SID AS SID2
        FROM Students S1, Students S2, Projects P
        WHERE EXISTS (SELECT *
            FROM Members
            WHERE PID=P.PID AND SID=S1.SID)
            AND
            EXISTS (SELECT *
            FROM Members
            WHERE PID=P.PID AND SID=S2.SID)
            AND S1.SID < S2.SID;
