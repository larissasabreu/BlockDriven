CREATE TABLE categories (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL UNIQUE
);

CREATE TABLE countries (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL UNIQUE
);

CREATE TABLE movies (
	id SERIAL PRIMARY KEY,
	title TEXT NOT NULL UNIQUE,
	category_id INTEGER REFERENCES "categories"("id") NOT NULL
);

CREATE TABLE actors (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL UNIQUE,
	born DATE NOT NULL,
	country_id INTEGER REFERENCES "countries"("id") NOT NULL
);

CREATE TABLE casts (
	movie_id INTEGER REFERENCES "movies"("id") NOT NULL,
	actor_id INTEGER REFERENCES "actors"("id") NOT NULL,
	country_id INTEGER REFERENCES "countries"("id") NOT NULL
);

CREATE TABLE discs (
	id SERIAL PRIMARY KEY,
	movie_id INTEGER REFERENCES "movies"("id") NOT NULL, 
	registry INTEGER NOT NULL UNIQUE,
	code INTEGER NOT NULL UNIQUE
);

CREATE TABLE phones (
	id SERIAL PRIMARY KEY,
	phone_1 VARCHAR(11) NOT NULL, --DDD + número = 11
	phone_2 VARCHAR(11) NOT NULL --DDD + número = 11
);

CREATE TABLE cities (
	id SERIAL PRIMARY KEY,
	state TEXT NOT NULL,
	city TEXT NOT NULL
);

CREATE TABLE address (
	id SERIAL PRIMARY KEY, 
	state TEXT NOT NULL,
	city TEXT NOT NULL,
	street TEXT NOT NULL,
	house_number TEXT NOT NULL,
	complement TEXT,
	CEP VARCHAR(8)
);

CREATE TABLE customers (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL UNIQUE,
	phones_id INTEGER REFERENCES "phones"("id") NOT NULL,
	address_id INTEGER REFERENCES "address"("id") NOT NULL,
	cpf VARCHAR(11) NOT NULL
);

CREATE TABLE ratings (
	id SERIAL PRIMARY KEY, 
	service_rating INTEGER NOT NULL,
	movie_rating INTEGER NOT NULL,
	movie_id INTEGER REFERENCES "movies"("id") NOT NULL,
	customer_id INTEGER REFERENCES "customers"("id") NOT NULL
);

CREATE TABLE rental (
	id SERIAL PRIMARY KEY,
	customer_id INTEGER REFERENCES "customers"("id") NOT NULL,
	movie_id INTEGER REFERENCES "movies"("id") NOT NULL,
	disc_id INTEGER REFERENCES "discs"("id") NOT NULL,
	rental_date TIMESTAMP NOT NULL DEFAULT NOW(),
	return_limit DATE NOT NULL,
	return_date DATE,
	rating_id INTEGER REFERENCES "ratings"("id"),
	fine INTEGER
);
