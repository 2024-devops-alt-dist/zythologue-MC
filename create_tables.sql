DROP TABLE IF EXISTS users, breweries, categories, ingredients, beers, photos, beers_has_ingredients, reviews, favorites CASCADE;

CREATE TABLE users (
                       id SERIAL PRIMARY KEY,
                       first_name VARCHAR(100) NOT NULL,
                       email VARCHAR(100) NOT NULL,
                       password VARCHAR(100) NOT NULL
);

CREATE TABLE breweries (
                           id SERIAL PRIMARY KEY,
                           name VARCHAR(100) NOT NULL,
                           address VARCHAR(255) NOT NULL,
                           opening_hours TIMESTAMPTZ NOT NULL,
                           country VARCHAR(100) NOT NULL,
                           description VARCHAR(1000) NOT NULL
);

CREATE TABLE categories (
                            id SERIAL PRIMARY KEY,
                            name VARCHAR(100) NOT NULL,
                            description VARCHAR(1000) NOT NULL
);

CREATE TABLE ingredients (
                             id SERIAL PRIMARY KEY,
                             name VARCHAR(100) NOT NULL,
                             type VARCHAR(100)
);

CREATE TABLE beers (
                       id SERIAL PRIMARY KEY,
                       name VARCHAR(100) NOT NULL,
                       description VARCHAR(1000) NOT NULL,
                       abv INT NOT NULL,
                       color VARCHAR(100),
                       quantity INT NOT NULL,
                       id_category INT NOT NULL,
                       id_brewery INT NOT NULL,
                       CONSTRAINT fk_category FOREIGN KEY (id_category) REFERENCES categories (id),
                       CONSTRAINT fk_brewery FOREIGN KEY (id_brewery) REFERENCES breweries (id)
);

CREATE TABLE photos (
                        id SERIAL PRIMARY KEY,
                        url VARCHAR(255) NOT NULL,
                        title VARCHAR(100) NOT NULL,
                        id_beer INT NOT NULL,
                        CONSTRAINT fk_beer FOREIGN KEY (id_beer) REFERENCES beers (id)
);

CREATE TABLE beers_has_ingredients (
                                       id_beer INT NOT NULL,
                                       id_ingredient INT NOT NULL,
                                       PRIMARY KEY (id_beer, id_ingredient),
                                       CONSTRAINT fk_beer FOREIGN KEY (id_beer) REFERENCES beers (id),
                                       CONSTRAINT fk_ingredient FOREIGN KEY (id_ingredient) REFERENCES ingredients (id)
);

CREATE TABLE reviews (
                         id_beer INT NOT NULL,
                         id_user INT NOT NULL,
                         name VARCHAR(100) NOT NULL,
                         description VARCHAR(1000) NOT NULL,
                         stars INT,
                         PRIMARY KEY (id_beer, id_user),
                         CONSTRAINT fk_beer FOREIGN KEY (id_beer) REFERENCES beers (id),
                         CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES users (id)
);

CREATE TABLE favorites (
                           id_beer INT NOT NULL,
                           id_user INT NOT NULL,
                           PRIMARY KEY (id_beer, id_user),
                           CONSTRAINT fk_beer FOREIGN KEY (id_beer) REFERENCES beers (id),
                           CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES users (id)
);



-- Insertion de données dans la table users
INSERT INTO users (first_name, email, password)
VALUES
    ('Alice', 'alice@example.com', 'password123'),
    ('Bob', 'bob@example.com', 'securepwd'),
    ('Charlie', 'charlie@example.com', 'mypassword'),
    ('David', 'david@example.com', 'david2024'),
    ('Eve', 'eve@example.com', 'evepassword'),
    ('Frank', 'frank@example.com', 'frank1234'),
    ('Grace', 'grace@example.com', 'gracepass'),
    ('Hannah', 'hannah@example.com', 'hannah2024'),
    ('Ian', 'ian@example.com', 'ian12345'),
    ('Jack', 'jack@example.com', 'jackson2024'),
    ('Kara', 'kara@example.com', 'karapass'),
    ('Leo', 'leo@example.com', 'leopassword'),
    ('Mona', 'mona@example.com', 'monapass123'),
    ('Nina', 'nina@example.com', 'nina2024'),
    ('Oscar', 'oscar@example.com', 'oscarpass'),
    ('Paul', 'paul@example.com', 'paulpassword'),
    ('Quincy', 'quincy@example.com', 'quincy123'),
    ('Rita', 'rita@example.com', 'ritapass'),
    ('Steve', 'steve@example.com', 'steve2024'),
    ('Tina', 'tina@example.com', 'tina1234'),
    ('Uma', 'uma@example.com', 'umapass'),
    ('Victor', 'victor@example.com', 'victor2024'),
    ('Wendy', 'wendy@example.com', 'wendypass'),
    ('Xander', 'xander@example.com', 'xander1234'),
    ('Yara', 'yara@example.com', 'yara2024'),
    ('Zane', 'zane@example.com', 'zanepass');

-- Insertion de données dans la table breweries
INSERT INTO breweries (name, address, opening_hours, country, description)
VALUES
    ('Golden Brewery', '123 Brewery Lane, BeerTown', '2024-01-01 09:00:00', 'USA', 'Known for its golden ales and rich history.'),
    ('Hoppy Heaven', '456 Hop Road, BrewCity', '2024-01-01 10:00:00', 'Canada', 'Famous for hop-forward IPAs.'),
    ('Yeast Masters', '789 Yeast Street, AleVille', '2024-01-01 11:00:00', 'Belgium', 'Traditional Belgian styles with a modern twist.'),
    ('Brewtopia', '101 Craft Street, BrewCity', '2024-01-01 08:00:00', 'UK', 'A blend of new age and classic brewing techniques.'),
    ('Cerveza Magic', '202 Ale Blvd, LagerTown', '2024-01-01 07:00:00', 'Mexico', 'Known for its light and refreshing lagers.'),
    ('Brewed Delights', '303 Hop Lane, Craftville', '2024-01-01 09:30:00', 'Australia', 'Innovative brewing, with a focus on seasonal flavors.'),
    ('Foamy Peaks', '404 Foam Street, BeerCity', '2024-01-01 08:30:00', 'USA', 'Specializes in foamy, rich ales.'),
    ('Craft Brewers Co.', '505 Craft Blvd, BrewTown', '2024-01-01 09:00:00', 'Germany', 'German lagers perfected.'),
    ('Tropical Brews', '606 Palm Avenue, TropicCity', '2024-01-01 07:30:00', 'Brazil', 'Fruity tropical ales and lagers.'),
    ('Northern Lights Brewing', '707 Aurora Lane, IceVille', '2024-01-01 10:00:00', 'Norway', 'Bright and crisp arctic-inspired beers.');

-- Insertion de données dans la table categories
INSERT INTO categories (name, description)
VALUES
    ('IPA', 'India Pale Ale, hoppy and aromatic.'),
    ('Stout', 'Dark, rich, and creamy.'),
    ('Lager', 'Light and crisp.'),
    ('Pilsner', 'Crisp, refreshing, and slightly bitter.'),
    ('Wheat Beer', 'Smooth, light, and refreshing with a slightly cloudy appearance.'),
    ('Porter', 'Full-bodied, with flavors of chocolate and coffee.'),
    ('Sour', 'Tart and tangy beer style.'),
    ('Amber Ale', 'Balanced, rich, and malty.'),
    ('Session Ale', 'Low ABV, easy-drinking beer.'),
    ('Barleywine', 'Strong, malty, and complex.');

-- Insertion de données dans la table ingredients
INSERT INTO ingredients (name, type)
VALUES
    ('Barley', 'Grain'),
    ('Hops', 'Flavoring'),
    ('Yeast', 'Fermentation'),
    ('Wheat', 'Grain'),
    ('Oats', 'Grain'),
    ('Coriander', 'Flavoring'),
    ('Orange Peel', 'Flavoring'),
    ('Rye', 'Grain'),
    ('Honey', 'Adjunct'),
    ('Coffee', 'Flavoring');

-- Insertion de données dans la table beers
INSERT INTO beers (name, description, abv, color, quantity, id_category, id_brewery)
VALUES
    ('Golden Ale', 'Smooth and light golden ale.', 5, 'Golden', 100, 1, 1),
    ('Dark Stout', 'Rich, creamy, and robust stout.', 8, 'Black', 50, 2, 2),
    ('Crisp Lager', 'Light and refreshing lager.', 4, 'Pale', 200, 3, 3),
    ('Hoppy IPA', 'Bitter and hop-forward IPA with citrus notes.', 6, 'Amber', 150, 1, 4),
    ('Belgian Tripel', 'Strong and fruity with a touch of spice.', 9, 'Golden', 80, 5, 5),
    ('Chocolate Porter', 'Rich porter with hints of chocolate and coffee.', 7, 'Dark Brown', 120, 6, 6),
    ('Summer Ale', 'Light and citrusy ale perfect for warm days.', 4.5, 'Golden', 130, 9, 7),
    ('Tropical IPA', 'Tropical fruit flavors with a hoppy finish.', 6.5, 'Amber', 140, 1, 8),
    ('Arctic Lager', 'Bright and crisp lager inspired by arctic regions.', 4, 'Pale', 180, 3, 9),
    ('Fruity Wheat Beer', 'Smooth wheat beer with hints of citrus and spice.', 5.5, 'Light', 90, 5, 10);

-- Insertion de données dans la table photos
INSERT INTO photos (url, title, id_beer)
VALUES
    ('golden_ale.jpg', 'Golden Ale Picture', 1),
    ('dark_stout.jpg', 'Dark Stout Picture', 2),
    ('crisp_lager.jpg', 'Crisp Lager Picture', 3),
    ('hoppy_ipa.jpg', 'Hoppy IPA Picture', 4),
    ('belgian_tripel.jpg', 'Belgian Tripel Picture', 5),
    ('chocolate_porter.jpg', 'Chocolate Porter Picture', 6),
    ('summer_ale.jpg', 'Summer Ale Picture', 7),
    ('tropical_ipa.jpg', 'Tropical IPA Picture', 8),
    ('arctic_lager.jpg', 'Arctic Lager Picture', 9),
    ('fruity_wheat_beer.jpg', 'Fruity Wheat Beer Picture', 10);

-- Insertion de données dans la table beers_has_ingredients
INSERT INTO beers_has_ingredients (id_beer, id_ingredient)
VALUES
    (1, 1), (1, 2), (2, 1), (2, 3), (3, 2), (3, 3), (4, 2), (4, 5),
    (5, 1), (5, 4), (6, 1), (6, 2), (7, 2), (7, 6), (8, 2), (8, 9),
    (9, 1), (9, 8), (10, 1), (10, 7);

-- Insertion de données dans la table reviews
INSERT INTO reviews (id_beer, id_user, name, description, stars)
VALUES
    (1, 1, 'Great Golden Ale', 'Perfect balance of flavors.', 5),
    (2, 2, 'Dark and Delicious', 'A stout lover’s dream.', 4),
    (3, 3, 'Crisp and Refreshing', 'Ideal for summer days.', 5);

INSERT INTO favorites (id_beer, id_user)
VALUES
    (1, 1), (2, 1), (3, 1), (4, 1), (5, 1),
    (2, 2), (3, 2), (4, 2), (6, 2), (7, 2),
    (1, 3), (2, 3), (3, 3), (8, 3), (9, 3),
    (5, 4), (6, 4), (7, 4), (8, 4), (10, 4),
    (1, 5), (2, 5), (6, 5), (7, 5), (9, 5),
    (3, 6), (4, 6), (5, 6), (8, 6), (10, 6),
    (1, 7), (2, 7), (9, 7), (10, 7);
   
