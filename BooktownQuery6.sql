SELECT b1.Title, e1.Publication_Date, a1.Author_ID, a1.First_Name, a1.Last_Name
FROM Authors a1
    INNER JOIN Books b1 ON a1.Author_ID=b1.Author_ID
    INNER JOIN Editions e1 ON b1.Book_ID=e1.Book_ID
WHERE a1.Author_ID IN (
SELECT DISTINCT A.Author_ID
FROM
    Editions E
    INNER JOIN Books B ON E.Book_ID=B.Book_ID
    INNER JOIN Authors A ON B.Author_ID=A.Author_ID
WHERE Publication_Date >= '2003-01-01' AND Publication_Date <= '2008-12-31'
)
ORDER BY a1.Author_ID ASC, e1.Publication_Date DESC;
