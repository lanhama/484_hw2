SELECT e.CID
FROM Enrollments e
    INNER JOIN Students s ON e.SID=s.SID
    INNER JOIN Courses c ON e.CID=c.CID
GROUP BY e.CID
HAVING COUNT(case s.Major when 'CS' then 1 else 0 end) < 10;
