
SELECT DISTINCT E.Publisher_ID, P.Name
FROM Editions E
    INNER JOIN Publishers P ON E.Publisher_ID=P.Publisher_ID
    INNER JOIN Books B ON E.Book_ID=B.Book_ID
WHERE B.Author_ID IN (
SELECT Author_ID
FROM
    Books
GROUP BY Author_ID
HAVING COUNT(*) = 3
)
ORDER BY E.Publisher_ID DESC;
