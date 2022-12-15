SELECT e."userId" as id, u.name as name, c.name as course, s.name as school, e."endDate" as endDate
FROM educations as e
JOIN schools as s ON e."schoolId" = s.id
JOIN courses as c ON e."courseId" = c.id
JOIN users as u ON e."userId" = u.id
WHERE e."userId" = 30 and e.status = 'finished';