SELECT e.CID
FROM Enrollments e
    INNER JOIN Students s ON e.SID=s.SID
    INNER JOIN Courses c ON e.CID=c.CID
GROUP BY e.CID
HAVING COUNT(case s.Major when 'CS' then 0 else 1 end) < 10
ORDER BY e.CID DESC;
