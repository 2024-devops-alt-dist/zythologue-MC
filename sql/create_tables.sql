DROP TABLE IF EXISTS users, breweries, categories, ingredients, beers, photos, beers_has_ingredients, reviews, favorites CASCADE;

CREATE TABLE users (
                       id SERIAL PRIMARY KEY,
                       first_name VARCHAR(100) NOT NULL,
                       email VARCHAR(100) NOT NULL,
                       password VARCHAR(100) NOT NULL,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE breweries (
                           id SERIAL PRIMARY KEY,
                           name VARCHAR(100) NOT NULL,
                           address VARCHAR(255) NOT NULL,
                           opening_hours TIMESTAMPTZ NOT NULL,
                           country VARCHAR(100) NOT NULL,
                           description VARCHAR(1000) NOT NULL,
                           created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                           updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories (
                            id SERIAL PRIMARY KEY,
                            name VARCHAR(100) NOT NULL,
                            description VARCHAR(1000) NOT NULL,
                            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ingredients (
                             id SERIAL PRIMARY KEY,
                             name VARCHAR(100) NOT NULL,
                             type VARCHAR(100),
                             created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                             updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
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
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       CONSTRAINT fk_category FOREIGN KEY (id_category) REFERENCES categories (id),
                       CONSTRAINT fk_brewery FOREIGN KEY (id_brewery) REFERENCES breweries (id)
);

CREATE TABLE photos (
                        id SERIAL PRIMARY KEY,
                        url VARCHAR(255) NOT NULL,
                        title VARCHAR(100) NOT NULL,
                        id_beer INT NOT NULL,
                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                        CONSTRAINT fk_beer FOREIGN KEY (id_beer) REFERENCES beers (id)
);

CREATE TABLE beers_has_ingredients (
                                       id_beer INT NOT NULL,
                                       id_ingredient INT NOT NULL,
                                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
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
                         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                         updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                         PRIMARY KEY (id_beer, id_user),
                         CONSTRAINT fk_beer FOREIGN KEY (id_beer) REFERENCES beers (id),
                         CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES users (id)
);

CREATE TABLE favorites (
                           id_beer INT NOT NULL,
                           id_user INT NOT NULL,
                           created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                           updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                           PRIMARY KEY (id_beer, id_user),
                           CONSTRAINT fk_beer FOREIGN KEY (id_beer) REFERENCES beers (id),
                           CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES users (id)
);