----------------------------------------------
-- 1

SELECT COUNT("endDate") AS "currentExperiences"
FROM experiences;

----------------------------------------------
-- 2

SELECT users.id, COUNT(educations.id) AS educations FROM users
JOIN educations
ON users.id = educations."userId"
GROUP BY users.id;

----------------------------------------------
-- 3

SELECT users.name AS writer, count(testimonials.id) AS "testimonailCount"
FROM users
JOIN testimonials
ON users.id = testimonials."writerId"
WHERE users.id = 435
GROUP BY users.id;

----------------------------------------------
-- 4

SELECT MAX(jobs.salary) AS "maximumSalary", roles.name AS "role"
FROM jobs
JOIN roles
ON jobs."roleId" = roles.id
WHERE jobs.active = true
GROUP BY roles.name
ORDER BY "maximumSalary" ASC;

----------------------------------------------
-- BÔNUS

SELECT schools.name AS school, 
       courses.name AS course,
       COUNT(educations."userId") as "studentsCount",
       educations.status AS "role"
FROM courses 
JOIN educations
ON courses.id = educations."courseId"
JOIN schools
ON educations."schoolId" = schools.id
WHERE educations.status = 'ongoing' OR educations.status = 'finished'
GROUP BY schools.name, courses.name, educations.status
ORDER BY "studentsCount" DESC
LIMIT 3;

----------------------------------------------
