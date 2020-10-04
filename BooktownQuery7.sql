SELECT B.Title, SUM(Pages) AS Total_Pages
FROM Editions E
INNER JOIN Books B ON E.Book_ID=B.Book_ID
GROUP BY E.Book_ID
ORDER BY Total_Pages DESC;
