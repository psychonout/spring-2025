SELECT
-- TOP 50000 - 9018 ms
*
FROM posts
WHERE CHARINDEX('<html>', tags) > 0
  AND CHARINDEX('<css>', tags) > 0;

SELECT
-- TOP 50000 - 9264 ms
*
FROM posts
WHERE tags LIKE '%<css>%'
  AND tags LIKE '%<html>%';
