use mavenmovies;
#Write a SQL query to count the number of characters except the spaces for each actor.
# Return first 10 actors name length along with their name.

select* from actor;
# here as per my understanding ,i saw above two question  so i used two  first is length() function and
# other is limit clause.  
select first_name,last_name, length( first_name )+ length(last_name ) from actor;
select first_name ,last_name from actor limit 10;

 
#List all Oscar awardees(Actors who received Oscar award) with their full names and length of their names.
select *from actor_award;
#here i used length () function for counting the length of full names and also used where clause for filtering.
select first_name,last_name ,awards,length(first_name)+length(last_name) as  length  from actor_award 
where awards= 'oscar';


#Find the actors who have acted in the film ‘Frost Head’.
select* from actor;
select* from film;
select * from film_actor;
# here i used inner join for getting the output.
select first_name ,last_name , title from actor  inner join  film_actor on actor.actor_id =film_actor.actor_id 
inner join film on film.film_id = film_actor.film_id
where title= 'frost head';


#Pull all the films acted by the actor ‘Will Wilson’.
select * from film;
select * from actor;
select* from film_actor;
# i used inner join among three tables.
select title , first_name,last_name from film inner join film_actor on film.film_id=film_actor.film_id  inner join
 actor on actor.actor_id=film_actor.actor_id
where actor.first_name= 'will' and actor.last_name='wilson';
 


#Pull all the films which were rented and return in the month of May.
select * from rental;
select * from film;
select * from inventory;
# i used inner join and month () function for gettin output.
select rental_date,return_date, title from film join inventory on film.film_id= inventory.film_id
 join  rental on rental.inventory_id = inventory.inventory_id 
 where month(rental.rental_date)=5 and month(rental.return_date)=5;
 
 
 #Pull all the films with ‘Comedy’ category.
 select* from film;
 select* from category;
 select*from film_category;
  # i used inner join and where clause for filtering.
 select name,title from film inner join film_category on film.film_id= film_category.film_id 
 inner join category on category.category_id=film_category.category_id
 where category.name='comedy';
 
 
 
 


