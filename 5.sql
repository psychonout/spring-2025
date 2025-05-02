WITH TagCombinations AS (
  SELECT
    PostTags.PostId,
    STRING_AGG(Tags.TagName, ', ') WITHIN GROUP (ORDER BY Tags.TagName) AS TagCombination
  FROM PostTags
  JOIN Tags ON PostTags.TagId = Tags.Id
  GROUP BY PostTags.PostId
),

TagCombinationCounts AS (
  SELECT
    TagCombination,
    COUNT(*) AS CombinationCount
  FROM TagCombinations
  GROUP BY TagCombination
)

SELECT TOP 1
  TagCombination,
  CombinationCount
FROM TagCombinationCounts
ORDER BY CombinationCount DESC;
