SELECT Subject
FROM Subjects S
WHERE NOT EXISTS (SELECT *
FROM Books
WHERE Subject_ID=S.Subject_ID)
ORDER BY Subject ASC;
