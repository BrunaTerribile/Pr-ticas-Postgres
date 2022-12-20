SELECT u.name AS writer, COUNT(t.id) as "testimonialCount"
FROM testimonials AS t
JOIN users AS u
ON t."writerId" = u.id
WHERE "writerId" = 435
GROUP BY u.name;