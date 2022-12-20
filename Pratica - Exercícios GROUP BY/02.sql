SELECT e."userId" AS id, COUNT('courseId') AS educations
FROM educations AS e
GROUP BY e."userId"
ORDER BY id DESC;