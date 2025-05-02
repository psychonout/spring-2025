WITH TopTags AS (
  SELECT TOP 5
    Tags.Id,
    Tags.TagName
  FROM Tags
  JOIN PostTags ON Tags.Id = PostTags.TagId
  JOIN Posts ON PostTags.PostId = Posts.Id
  WHERE YEAR(Posts.CreationDate) = YEAR(GETDATE())
  GROUP BY Tags.Id, Tags.TagName
  ORDER BY COUNT(Posts.Id) DESC
),

FilteredPosts AS (
  SELECT
    Posts.Id AS PostId,
    Posts.CreationDate,
    PostTags.TagId
  FROM Posts
  JOIN PostTags ON Posts.Id = PostTags.PostId
  WHERE YEAR(Posts.CreationDate) = YEAR(GETDATE())
)

SELECT
  FilteredPosts.CreationDate AS Date,
  TopTags.TagName,
  COUNT(FilteredPosts.PostId) OVER (PARTITION BY TopTags.TagName ORDER BY FilteredPosts.CreationDate) AS CumulativePosts
FROM FilteredPosts
JOIN TopTags ON FilteredPosts.TagId = TopTags.Id
ORDER BY TopTags.TagName, FilteredPosts.CreationDate;
