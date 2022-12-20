SELECT MAX(salary) AS "maximumSalary", r.name AS role
FROM jobs AS j
JOIN roles AS r
ON j."roleId" = r.id
GROUP BY r.name
ORDER BY "maximumSalary";
