SELECT t.id, w.name as writer, r.name as recipient, t.message
FROM testimonials as t 
JOIN users as w ON t."writerId" = w.id
JOIN users as r on t."recipientId" = r.id;