-- top 5 oldest users

SELECT username,created_at FROM users ORDER BY created_at LIMIT 5 ;

-- the day of the week and the corresponding number of  users registered

SELECT dayname(created_at) AS day_of_the_week,COUNT(username) AS user_count FROM users GROUP BY dayname(created_at) ORDER BY COUNT(username) DESC ;

-- users who have never posted a photo

SELECT u.id,u.username,u.created_at FROM users u  LEFT JOIN photos p ON u.id=p.user_id WHERE p.id IS NULL ;

-- top 2 users who got the most number of likes
SELECT u.id,u.username,COUNT(l.photo_id) AS number_likes FROM users u JOIN photos p ON u.id=p.user_id JOIN likes l ON p.id=l.photo_id GROUP BY l.photo_id
 ORDER BY COUNT(l.photo_id) DESC LIMIT 2 ;
 
 -- How many times does an average user post?
 SELECT ((SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users )) AS average_posts;
 
 -- top 5 most commonly used hashtags 
 SELECT tag_name,COUNT(t.id) as number_used FROM tags t JOIN photo_tags p ON t.id=p.tag_id GROUP BY t.id  ORDER BY COUNT(t.id) DESC LIMIT 5;
 
 -- users who have liked every single photo(can be used for bot detection)
 SELECT u.username,COUNT(*) as num_likes FROM users u JOIN likes l ON u.id= l.user_id GROUP BY l.user_id HAVING num_likes = (SELECT COUNT(*) FROM photos);
