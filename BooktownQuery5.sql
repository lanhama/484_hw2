CREATE VIEW JK_BOOKS
AS
    SELECT DISTINCT Subject_ID
    FROM Books B
        INNER JOIN Authors A ON B.Author_ID=A.Author_ID
    WHERE A.First_Name='J. K.' AND A.Last_Name='Rowling';

    SELECT DISTINCT Author_ID, First_Name, Last_Name
    FROM Authors
MINUS
    SELECT DISTINCT A.Author_ID, A.First_Name, A.Last_Name
    FROM JK_BOOKS J, Authors A
    WHERE NOT EXISTS (SELECT *
    FROM Books
    WHERE Subject_ID=J.Subject_ID AND Author_ID=A.Author_ID)
ORDER BY Last_Name ASC, Author_ID DESC;

DROP VIEW JK_BOOKS;
