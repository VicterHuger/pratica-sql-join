-- Questão 1
SELECT u.id, u.name, c.name as city 
FROM users u
JOIN cities c
ON u."cityId"=c.id 
WHERE c.name = 'Rio de Janeiro';

-- Questão 2
SELECT t.id, u1.name as writer, u2.name as recipente, t.message 
FROM testimonials t
JOIN users u1
ON t."writerId" = u1.id
JOIN users u2
ON t."recipientId"=u2.id;

-- Questão 3
SELECT e."userId" as id, u.name, c.name as course, s.name as school, e."endDate"  
FROM educations e
JOIN users u
ON e."userId"=u.id
JOIN courses c
ON e."courseId"=c.id
JOIN schools s
ON e."schoolId"=s.id
WHERE e.status='finished'
AND e."userId"=30;

-- Questão 4

SELECT e."userId" as id, u.name, r.name as "role", c.name as company, e."startDate"
FROM experiences e
JOIN users u
ON e."userId"=u.id
JOIN roles r
ON e."roleId"=r.id
JOIN companies c
ON e."companyId"=c.id
WHERE e."userId"=50 AND e."endDate" IS NULL;

-- BONUS

SELECT s.id, s.name as school, cou.name as course, com.name as company, r.name as "role"
FROM  applicants a
JOIN users u
ON a."userId"=u.id
JOIN educations e
ON u.id=e."userId"
JOIN schools s
ON e."schoolId"=s.id
JOIN courses cou 
ON e."courseId"=cou.id
JOIN jobs j
ON a."jobId"=j.id
JOIN companies com
ON j."companyId"=com.id
JOIN roles r
ON j."roleId"=r.id
WHERE r.name='Software Engineer'
AND j."companyId"=10
AND j.active=true;
