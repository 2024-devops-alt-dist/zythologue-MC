--Lister les bières par taux d'alcool, de la plus légère à la plus forte.
select * from beers
order by abv asc;

--Afficher le nombre de bières par catégorie.
select count(beers.id),
       breweries.name as "brewery name"
from beers
         inner join breweries
                    on beers.id_brewery = breweries.id
group by breweries.name, beers.name;

--Trouver toutes les bières d'une brasserie donnée.
select beers.name as beer_name, breweries.name as brewery_name
from beers
         inner join breweries
                    on beers.id_brewery = breweries.id
where beers.id_brewery = 1;

--Lister les utilisateurs et le nombre de bières qu'ils ont ajoutées à leurs favoris.
select count(users.id),
       users.first_name as nom
from favorites
         inner join users
                    on favorites.id_user = users.id
group by users.id;

--Ajouter une nouvelle bière à la base de données.
insert into beers (name, description, abv, color, quantity, id_category, id_brewery)
values ('Golden Pale Ale', 'Smooth and light golden pale ale.', 5, 'Golden', 100, 1, 1);

--Afficher les bières et leurs brasseries, ordonnées par pays de la brasserie.
select beers.name as "beer's name", breweries.name as "brewery's name", breweries.country as brewery_country
from beers
         inner join breweries
                    on beers.id_brewery = breweries.id
order by country;

--Lister les bières avec leurs ingrédients.
select beers.name as beer_name, ingredients.name as ingredients_name
from beers_has_ingredients
         inner join beers
                    on beers.id = beers_has_ingredients.id_beer
         inner join ingredients
                    on ingredients.id = beers_has_ingredients.id_ingredient;

--Afficher les brasseries et le nombre de bières qu'elles produisent, pour celles ayant plus de 5 bières.
select count(beers.id),
       breweries.name as "brewery's name"
from beers
         inner join breweries
                    on beers.id_brewery = breweries.id
group by breweries.name
having count(beers.id) > 5
order by breweries.name asc;

--Lister les bières qui n'ont pas encore été ajoutées aux favoris par aucun utilisateur.
select beers.name
from beers
         left join favorites
                   on beers.id  = favorites.id_beer
where favorites.id_beer is null;

--Trouver les bières favorites communes entre deux utilisateurs.
select beers.name as "beers's name"
from favorites f1
         inner join beers
                    on beers.id = f1.id_beer
         inner join users
                    on users.id = f1.id_user
         inner join favorites f2
                    on f1.id_beer = f2.id_beer
where f1.id_user = 1
  and f2.id_user = 2;

--Afficher les brasseries dont les bières ont une moyenne de notes supérieure à une certaine valeur.
select
    avg(stars), breweries.name as "brewery's name"
from reviews
         join beers
              on beers.id = reviews.id_beer
         join breweries
              on breweries.id = beers.id_brewery
group by breweries.name
having avg(stars) > 2.5;

--Mettre à jour les informations d'une brasserie.
update breweries
set name='Basque Brewery'
where id = 1;

select name from breweries where id=1;

--Supprimer les photos d'une bière en particulier.
delete
from photos
where id_beer = 1;

select * from photos;