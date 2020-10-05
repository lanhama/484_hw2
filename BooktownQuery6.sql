SELECT DISTINCT Title, Publication_Date, Author_ID, First_Name, Last_Name
FROM Editions
    NATURAL JOIN Authors
    NATURAL JOIN Books  
WHERE Author_ID IN (
SELECT DISTINCT Author_ID
FROM
    Editions
    NATURAL JOIN Authors
    NATURAL JOIN Books  
WHERE (Publication_Date >= '2003-01-01' AND Publication_Date <= '2008-12-31')
)
ORDER BY Author_ID ASC, Publication_Date DESC;
