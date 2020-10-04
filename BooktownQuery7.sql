SELECT Title, SUM(Pages) AS Total_Pages
FROM Editions
    NATURAL JOIN Books
GROUP BY Book_ID
ORDER BY Total_Pages DESC;
