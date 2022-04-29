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

CREATE TABLE vets(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);

CREATE TABLE specializations(
    species_id INT,
    vet_id INT,
    FOREIGN KEY(species_id) references species(id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY(vet_id) references vets(id) ON DELETE SET NULL ON UPDATE CASCADE,
    PRIMARY KEY (species_id, vet_id)
);

CREATE TABLE visits(
    animal_id INT,
    vet_id INT,
    visit_date DATE,
    FOREIGN KEY(animal_id) references animals(id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY(vet_id) references vets(id) ON DELETE SET NULL ON UPDATE CASCADE
);