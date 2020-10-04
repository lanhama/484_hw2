SELECT CID
FROM Enrollments
    NATURAL JOIN Students
    NATURAL JOIN Courses
GROUP BY CID
HAVING SUM(case Major when 'CS' then 0 else 1 end) < 10
ORDER BY CID DESC;
