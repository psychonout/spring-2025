-- single specific ID and its last comment
DECLARE @SomePostId int;
SET @SomePostId = 79593182;

SELECT
  TOP 1
  PostId,
  Text
FROM Comments
WHERE PostId = @SomePostId
ORDER BY Id DESC;

-- every post and its last comment
WITH LastComments AS (
  SELECT
    PostId,
    Text,
    ROW_NUMBER() OVER (PARTITION BY PostId ORDER BY Id DESC) AS rn
  FROM Comments
)

SELECT
  PostId,
  Text
FROM LastComments
WHERE rn = 1;
