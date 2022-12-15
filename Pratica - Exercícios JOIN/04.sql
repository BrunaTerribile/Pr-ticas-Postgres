SELECT e."userId" as id, u.name as name, r.name as role, c.name as company, e."startDate" as startDate
FROM experiences as e
JOIN companies as c ON e."companyId" = c.id
JOIN roles as r ON e."roleId" = r.id
JOIN users as u ON e."userId" = u.id
WHERE e."userId" = 50 AND e."endDate" IS NULL;