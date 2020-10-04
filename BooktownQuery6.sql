SELECT Title, Publication_Date, Author_ID, First_Name, Last_Name
FROM Authors
    NATURAL JOIN Books
    NATURAL JOIN Editions
WHERE Author_ID IN (
SELECT DISTINCT A.Author_ID
FROM
    Editions E
    INNER JOIN Books B ON E.Book_ID=B.Book_ID
    INNER JOIN Authors A ON B.Author_ID=A.Author_ID
WHERE Publication_Date >= '2003-01-01' AND Publication_Date <= '2008-12-31'
)
ORDER BY Author_ID ASC, Publication_Date DESC;
