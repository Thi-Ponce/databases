SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth >= '20160101' AND date_of_birth < '20200101';

SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = TRUE;

SELECT * FROM animals WHERE name <> 'Gabumon';

SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN;
UPDATE animals
SET species = 'unspecified';

SELECT name,species FROM animals;

ROLLBACK;

SELECT name,species FROM animals;

BEGIN;

UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon%';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

SELECT name,species FROM animals;

COMMIT;

SELECT name,species FROM animals;

BEGIN;

DELETE FROM animals;

SELECT * FROM animals;

ROLLBACK;

SELECT * FROM animals;

BEGIN;

DELETE FROM animals WHERE date_of_birth > '2022-1-1';

SELECT name, date_of_birth FROM animals;

SAVEPOINT SP1;

UPDATE animals
SET weight_kg = weight_kg * (-1);

SELECT name, weight_kg from animals;

ROLLBACK TO SP1;

UPDATE animals
SET weight_kg = weight_kg * (-1)
WHERE weight_kg < 0;

SELECT name, weight_kg from animals;

COMMIT TRANSACTION;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, COUNT(escape_attempts) as "Most escape" FROM animals GROUP BY neutered;

SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-1-1' AND '2000-12-31' GROUP BY species;

SELECT name, full_name as Owner FROM animals JOIN owners on animals.owner_id = owners.id WHERE full_name = 'Melody Pond';

SELECT A.name, S.name as Specie FROM animals as A JOIN species as S on A.species_id = S.i WHERE S.name = 'Pokemon';

SELECT full_name as Owner, name FROM animals RIGHT JOIN owners on animals.owner_id = owners.id;

SELECT COUNT(A.name), S.name as Species FROM species as S JOIN animals as A on S.id = A.species_id GROUP BY S.name;

SELECT A.name, full_name as Owner, S.name as Species FROM animals as A JOIN owners on A.owner_id = owners.id
JOIN species as S on A.species_id = S.id WHERE S.name = 'Digimon' AND full_name = 'Jennifer Orwell';

SELECT A.name, full_name as Owner, escape_attempts FROM animals as A JOIN owners on A.owner_id = owners.id
WHERE escape_attempts = 0 AND full_name = 'Dean Winchester';

SELECT COUNT(*), full_name as Owner FROM animals as A JOIN owners on A.owner_id = owners.id GROUP BY full_name
ORDER BY COUNT(*) desc LIMIT 1; 

SELECT animals.name as Animal, vets.name as Vet, visit_date FROM visits JOIN vets on visits.vet_id = vets.id
JOIN animals on visits.animal_id = animals.id WHERE vets.name = 'William Thatcher' ORDER BY visit_date desc LIMIT 1;

SELECT COUNT(DISTINCT animals.name) FROM visits JOIN vets on visits.vet_id = vets.id
JOIN animals on visits.animal_id = animals.id WHERE vets.name = 'Stephanie Mendez';

SELECT vets.name, species.name FROM vets LEFT JOIN specializations ON vets.id = vet_id LEFT JOIN species ON species_id=species.id
ORDER BY vets.name;

SELECT animals.name as Animal, vets.name as Vet, visit_date FROM visits JOIN vets on visits.vet_id = vets.id
JOIN animals on visits.animal_id = animals.id WHERE vets.name = 'Stephanie Mendez' AND visit_date BETWEEN '2020-4-1'
AND '2020-8-30';

SELECT COUNT(animals.name), animals.name FROM visits JOIN animals on visits.animal_id = animals.id
GROUP BY animals.name ORDER BY COUNT(animals.name) desc LIMIT 1;

SELECT animals.name as Animal, vets.name as Vet, visit_date FROM visits JOIN vets on visits.vet_id = vets.id
JOIN animals on visits.animal_id = animals.id WHERE vets.name = 'Maisy Smith' ORDER BY visit_date LIMIT 1;

SELECT
  visit_date,
  animals.name as "animal's name",
  animals.date_of_birth,
  animals.escape_attempts,
  animals.neutered,
  animals.weight_kg,
  vets.name as "vet's name",
  vets.age as "vet's age",
  vets.date_of_graduation
FROM visits JOIN vets on visits.vet_id = vets.id JOIN animals on visits.animal_id = animals.i ORDER BY visit_date desc LIMIT 1;

SELECT vet_specs.species_name, vet_specs.name, animals.name as "Animal Name" FROM visits
JOIN (
    SELECT vets.name, vets.id as vet_id, species.name as species_name, species.id as species_id FROM specializations
      JOIN vets on specializations.vet_id = vets.id
      JOIN species on specializations.species_id = species.id
  ) as vet_specs on visits.vet_id = vet_specs.vet_id
  JOIN animals on visits.animal_id = animals.id WHERE animals.species_id != vet_specs.species_id AND vet_specs.name != 'Stephanie Mendez';

SELECT specs.species_name, COUNT(specs.species_name) FROM visits
JOIN (
    SELECT animals.name, animals.id as animal_id, species.name as species_name, species.id as species_id
    FROM animals JOIN species on animals.species_id = species.id
  ) as specs on visits.animal_id = specs.animal_id
  JOIN vets on visits.vet_id = vets.id WHERE vets.name = 'Maisy Smith' GROUP BY specs.species_name ORDER BY COUNT(specs.species_name) desc LIMIT 1;