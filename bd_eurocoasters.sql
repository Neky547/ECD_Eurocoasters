-- Pays
CREATE TABLE pays (
pays_id INT AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(30) NOT NULL
);

-- Villes
CREATE TABLE villes (
ville_id INT AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(30),
fk_pays_id INT DEFAULT NULL REFERENCES pays(pays_id)
ON DELETE SET NULL
ON UPDATE CASCADE
);

-- Parcs
CREATE TABLE parcs (
parc_id INT AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(50),
date_ouverture DATE,
superficie INT,
fk_ville_id INT DEFAULT NULL REFERENCES villes(ville_id)
ON DELETE SET NULL
ON UPDATE CASCADE
);

-- Frequentations
CREATE TABLE frequentations (
annee DATE,
nombre_visiteurs INT,
fk_parc_id INT REFERENCES parcs(parc_id)
ON DELETE CASCADE
ON UPDATE CASCADE,
PRIMARY KEY (annee, fk_parc_id)
);

-- Constructeurs
CREATE TABLE constructeurs (
constructeur_id INT AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(30),
adresse VARCHAR(100),
url_site_web VARCHAR(100),
url_facebook VARCHAR(100),
url_instagram VARCHAR(100),
url_linked_in VARCHAR(100),
date_creation DATE,
fk_ville_id INT DEFAULT NULL REFERENCES villes(ville_id)
ON DELETE SET NULL
ON UPDATE CASCADE
);

-- Elements
CREATE TABLE elements (
element_id INT AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(50)
);

-- Rollercoasters
CREATE TABLE rollercoasters (
rollercoaster_id INT AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(50),
date_ouverture DATE,
hauteur DOUBLE(4,1),
structure ENUM('acier', 'bois') NOT NULL,
type ENUM('sit down', 'stand up', 'inverted', 'suspended', 'wing', 'bobsled', 'flying') DEFAULT NULL,
fk_constructeur_id INT DEFAULT NULL REFERENCES constructeurs(constructeur_id) ON DELETE SET NULL
ON UPDATE CASCADE,
fk_parc_id INT DEFAULT NULL REFERENCES parcs(parc_id)
ON DELETE SET NULL
ON UPDATE CASCADE
);

-- Compositions
CREATE TABLE Compositions (
fk_rollercoaster_id INT DEFAULT NULL REFERENCES rollercoasters(rollercoaster_id)
ON DELETE CASCADE
ON UPDATE CASCADE,
fk_element_id INT DEFAULT NULL REFERENCES elements(element_id)
ON DELETE RESTRICT
ON UPDATE CASCADE,
PRIMARY KEY (fk_rollercoaster_id, fk_element_id)
);






