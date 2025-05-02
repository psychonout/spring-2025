WITH upvotes AS (
  SELECT TOP 10
    PostId
  FROM Votes
  WHERE VoteTypeId = 2
  GROUP BY PostId
  ORDER BY COUNT(Id) DESC
),

downvotes AS (
  SELECT TOP 10
    PostId
  FROM Votes
  WHERE VoteTypeId = 3
  GROUP BY PostId
  ORDER BY COUNT(Id) DESC
)

SELECT PostId
FROM upvotes
UNION
SELECT PostId
FROM downvotes;
