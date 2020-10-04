SELECT A.First_Name, A.Last_Name
FROM Authors A
WHERE EXISTS (SELECT *
    FROM Books B
        INNER JOIN Subjects S ON B.Subject_ID=S.Subject_ID
    WHERE Author_ID=A.Author_ID AND Subject='Children/YA')
    AND
    EXISTS (SELECT *
    FROM Books B
        INNER JOIN Subjects S ON B.Subject_ID=S.Subject_ID
    WHERE Author_ID=A.Author_ID AND Subject='Fiction')
ORDER BY A.First_Name ASC, A.Last_Name ASC;
