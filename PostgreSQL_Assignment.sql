
-- Problem X
-- rangers table create
CREATE TABLE rangers(
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,    
    region VARCHAR(100)
);
-- species table create
CREATE TABLE species(
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100),
    scientific_name VARCHAR(100),
    discovery_date DATE,
    conservation_status VARCHAR(50)
);
-- sightings table create
CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT NOT NULL,
    species_id INT NOT NULL,
    sighting_time TIMESTAMP,
    location VARCHAR(255),
    notes TEXT,
    FOREIGN KEY (ranger_id) REFERENCES rangers(ranger_id),
    FOREIGN KEY (species_id) REFERENCES species(species_id)
);
-- Insert data into rangers table
INSERT INTO rangers (name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');

-- Insert data into species table
INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endagered'),
('Bengal Tiger', 'Panthera tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas Maximus indicus', '1758-01-01', 'Endangered');

-- Insert data into sightings table
INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

SELECT * FROM rangers;
SELECT * FROM species;  
SELECT * FROM sightings;

DROP TABLE sightings;

--problem 1
INSERT INTO rangers (name, region) VALUES('Derek Fox','Coastal Plains');

--problem 2
SELECT count(DISTINCT species_id) AS unique_species_count FROM sightings;
--problem 3
SELECT * FROM sightings WHERE location LIKE '%Pass%';

--problem 4
SELECT r.name,COUNT(*) as total_sightings FROM sightings as s JOIN rangers as r ON s.ranger_id = r.ranger_id
 GROUP BY r.name ORDER BY r.name ASC;
--problem 5
SELECT sp.common_name FROM sightings as si RIGHT JOIN species as sp ON si.species_id = sp.species_id WHERE si.species_id IS Null;
--problem 6

SELECT sp.common_name, si.sighting_time, r.name FROM 
sightings as si 
JOIN species as sp ON si.species_id = sp.species_id 
JOIN rangers as r ON si.ranger_id = r.ranger_id
ORDER BY si.sighting_time DESC LIMIT 2;

--problem 7
SELECT * FROM species;
UPDATE species SET conservation_status = 'Historic' WHERE discovery_date < '1800-01-01';
-- Problem 8
SELECT 
    sighting_id,
    CASE 
        WHEN extract(hour FROM sighting_time) < 12 THEN 'Morning'
        WHEN extract(hour FROM sighting_time) < 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sightings;

-- Problem 9

DELETE FROM rangers WHERE NOT EXISTS(
    SELECT 1 FROM sightings WHERE sightings.ranger_id = rangers.ranger_id
);

