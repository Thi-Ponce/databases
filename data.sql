INSERT INTO
  animals(
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES
  ('Agumon', '2022-02-03', 0, TRUE, 10.23);

INSERT INTO
  animals(
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES
  ('Gabumon', '2018-11-15', 2, TRUE, 8);

  INSERT INTO
  animals(
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES
  ('Pikachu', '2021-01-07', 1, FALSE, 15.04);

  INSERT INTO
  animals(
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES
  ('Devimon', '2017-05-12', 5, TRUE, 11);

  INSERT INTO
  animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES
  ('Charmander', '2020-2-8', 0, FALSE, -11),
  ('Plantmon', '2021-11-15', 2, TRUE, -5.7),
  ('Squirtle', '1993-4-2', 3, FALSE, -12.13),
  ('Angemon', '2005-6-12', 1, TRUE, -45),
  ('Boarmon', '2005-6-7', 7, TRUE, 20.4),
  ('Blossom', '1998-10-13', 3, TRUE, 17),
  ('Ditto', '2022-5-14', 4, TRUE, 22);

INSERT INTO
  owners(full_name, age)
VALUES
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);

INSERT INTO
  species(name)
VALUES
  ('Pokemon'),
  ('Digimon');

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';

UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';

UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';

INSERT INTO
  vets(name, age, date_of_graduation)
VALUES
  ('William Thatcher', 45, '2000-4-23'),
  ('Maisy Smith', 26, '2019-1-17'),
  ('Stephanie Mendez', 64, '1981-5-4'),
  ('Jack Harkness', 38, '2008-6-8');

INSERT INTO specializations (vet_id, species_id) VALUES (1, 1);

INSERT INTO specializations (vet_id, species_id) VALUES (3, 1);

INSERT INTO specializations (vet_id, species_id) VALUES (3, 2);

INSERT INTO specializations (vet_id, species_id) VALUES (4, 2);

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (1, 1, '2020-05-24');

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (1, 3, '2020-07-22');

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (2, 4, '2021-02-02');

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (3, 2, '2020-01-05');

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (3, 2, '2020-03-08');

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (3, 2, '2020-05-14');

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (4, 3, '2021-05-04');

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (5, 4, '2021-02-24');

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (6, 2, '2019-12-21');

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (6, 1, '2020-08-10');

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (6, 2, '2021-04-07');

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (7, 3, '2019-09-29');

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (8, 4, '2020-10-03');

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (8, 4, '2020-11-04');

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (9, 2, '2019-01-24');

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (9, 2, '2019-05-15');

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (9, 2, '2020-02-27');

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (9, 2, '2020-08-03');

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (10, 3, '2020-05-24');

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (10, 1, '2021-01-11');