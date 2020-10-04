SELECT e.CID
FROM Enrollments e
INNER JOIN Students s ON e."SID"=s."SID"
INNER JOIN Courses c ON e.CID=c.CID
GROUP BY e.CID
HAVING COUNT(s.Major != 'CS') < 10;
