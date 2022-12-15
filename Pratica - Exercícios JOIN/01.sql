SELECT users.id as id, users.name as name, cities.name as city 
FROM users 
JOIN cities ON cities.id = users."cityId" 
WHERE cities.name ='Rio de Janeiro';

