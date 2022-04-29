CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    date_of_birth DATA,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    PRIMARY KEY(id)
);

ALTER TABLE IF EXISTS animals
    ADD COLUMN species character varying;

CREATE TABLE owners(
    id serial PRIMARY KEY,
    full_name character varying(100),
    age INT
);

CREATE TABLE species(
    id serial PRIMARY KEY,
    name character varying(100)
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD species_id INT REFERENCES species(id);

ALTER TABLE animals
ADD owner_id INT REFERENCES owners(id);