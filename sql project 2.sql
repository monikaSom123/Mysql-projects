##        SQL PROJECT 2.O       ##

use ig_clone;
# 2 We want to reward the user who has been around the longest, Find the 5 oldest users.
select * from users order by created_at limit 1;
select * from users order by created_at limit 5 ;


# 3 To understand when to run the ad campaign, figure out the day of the week most users register on? 
select dayname(created_at) as day ,count(*) as total from users group by day  order by total desc;


# 4 To target inactive users in an email ad campaign, find the users who have never posted a photo.
select  users.id , username from users left join photos  on users.id=photos.user_id where photos.id is null;


# 5 Suppose you are running a contest to find out who got the most likes on a photo. Find out who won? 
select* from users;
select* from likes;
select * from photos;
select users.username, photos.id, photos.image_url, count(*) as most_likes from photos join likes on likes.photo_id=photos.id 
join users on users.id=likes.user_id
 group by photos.id order by count(*) desc;
 
 # find out who won?
 select users.username, photos.id, photos.image_url, count(*) as most_likes from photos join likes on likes.photo_id=photos.id 
 join users on users.id=likes.user_id
 group by photos.id order by count(*) desc limit 1;
 
 
 # 6 To find out if there are bots, find users who have liked every single photo on the site
select users.id,username, count(users.id) as total_likes from users join likes on likes.user_id=users.id group by users.id having total_likes =
 (select count(*) from photos);


# 7 To know who the celebrities are, find users who have never commented on a photo.
select  users.username ,comments.id from users left  join comments on comments.user_id=users.id group by users.id having comments.id is null;


# 8 A brand wants to know which hashtag to use on a post, and find the top 5 most used hashtags.
select tag_name,count(tag_name) from tags join photo_tags on tags.id=photo_tags.tag_id group by tag_id order by count(tag_name)desc; 


# 9 The investors want to know how many times does the average user post.
select round((select count(*) from photos)/(select count(*) from users),2);


# 10 Now it's time to find both of them together, find the users who have never commented on any photo or have commented on every photo.
 SELECT tableA.total_A as without_commented ,tableB.total_B as with_commented
		FROM
	(
		SELECT COUNT(*) AS total_A FROM
       ( select  users.username,comments.id from users left  join comments on comments.user_id=users.id group by users.id 
       having comments.id is null) as without_comment
	) AS tableA
    
	JOIN
    (
	SELECT COUNT(*) AS total_B FROM
        (select  users.username,comments.id from users left  join comments on comments.user_id=users.id group by users.id
        having comments.id is  not null) as  with_comment
	)AS tableB;





