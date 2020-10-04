-- SELECT DISTINCT a1.Author_ID, a1.First_Name, a1.Last_Name
-- FROM Books b1
--     INNER JOIN Authors a1 ON b1.Author_ID=a1.Author_ID
-- WHERE Subject_ID IN(

CREATE VIEW JK_BOOKS
AS
    SELECT DISTINCT Subject_ID
    FROM Books B
        INNER JOIN Authors A ON B.Author_ID=A.Author_ID
    WHERE A.First_Name='J. K.' AND A.Last_Name='Rowling';

    SELECT DISTINCT Author_ID, Last_Name, First_Name
    FROM Authors
MINUS
    SELECT DISTINCT A.Author_ID, A.Last_Name, A.First_Name
    FROM JK_BOOKS B, Authors A
    WHERE NOT EXISTS (SELECT *
    FROM Books
    WHERE Subject_ID=B.Subject_ID AND Author_ID=A.Author_ID)
ORDER BY Last_Name ASC, Author_ID DESC;

DROP VIEW JK_BOOKS;
