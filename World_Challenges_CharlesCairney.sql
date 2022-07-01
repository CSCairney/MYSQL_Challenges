USE world;
-- Question 1

SELECT COUNT(DISTINCT(city.name)) FROM city WHERE CountryCode = "USA";

-- Question 2

SELECT Population, LifeExpectancy FROM country WHERE Name = "Argentina";

-- Question 3

SELECT `Name`, LifeExpectancy FROM country
WHERE LifeExpectancy IS NOT NULL
ORDER BY LifeExpectancy desc
LIMIT 1;

-- Question 4

SELECT city.`name` FROM city
JOIN country
	ON city.ID = country.Capital
WHERE country.name = "Spain";

-- Question 5

SELECT `Language` FROM countrylanguage
JOIN country
	ON countrylanguage.CountryCode = country.Code
WHERE Region = "Southeast Asia";

-- Question 6

SELECT Name FROM city WHERE `Name` LIKE "F%" LIMIT 25;

-- Question 7

SELECT COUNT(city.Name) FROM city
	JOIN Country
		ON city.CountryCode = Country.Code
WHERE country.Name = "China";


-- Question 8

SELECT `Name`, Population FROM country
	HAVING population IS NOT NULL AND population !=0
    ORDER BY population asc
    LIMIT 1;

-- Question 9

SELECT COUNT(Distinct(Name)) FROM country;

-- Question 10

SELECT Name, SurfaceArea FROM Country
ORDER BY SurfaceArea desc
LIMIT 10;

-- Question 11

SELECT city.Name, city.Population FROM city
JOIN country
	ON city.CountryCode = country.code
WHERE country.name = "Japan" 
ORDER BY city.Population desc
LIMIT 5;

-- Question 12

UPDATE country
SET HeadOfState = REPLACE(HeadOfState, "Elisabeth II", "Elizabeth II");
SELECT `Code`, `Name` FROM country WHERE `HeadOfState` = "Elizabeth II";


-- Question 13

SELECT `Name` AS `Country`, `population`/`SurfaceArea` AS `Population-to-area Ratio` FROM country
WHERE `population`/`SurfaceArea` != 0
ORDER BY `population`/`SurfaceArea` asc
LIMIT 10;

-- Question 14

SELECT Distinct(`language`) FROM countrylanguage
ORDER BY language asc;

-- Question 15

SELECT `name` AS Country, `GNP` FROM country
ORDER BY `GNP` DESC
LIMIT 10;

-- Question 16

SELECT country.name, COUNT(cl.countrycode) FROM country
	JOIN countrylanguage cl
		ON cl.countrycode = country.code
	GROUP BY country.name
	ORDER BY COUNT(cl.countrycode) desc
    LIMIT 10;

-- Question 17

SELECT c.name, cl.Percentage FROM countrylanguage cl
	JOIN country c
		ON cl.CountryCode = c.Code
    WHERE language= "German" AND percentage > 50
    ORDER BY c.`name` asc;

-- Question 18

SELECT `Name`, LifeExpectancy  FROM country
	WHERE LifeExpectancy IS NOT NULL AND LifeExpectancy!=0
    ORDER BY LifeExpectancy asc
    LIMIT 1;

-- Question 19

SELECT GovernmentForm, COUNT(*) AS Occurrence FROM Country
	GROUP BY GovernmentForm
    ORDER BY Occurrence DESC
    LIMIT 3;

-- Question 20

SELECT COUNT(IndepYear) AS `Independent Countries` FROM Country
	WHERE IndepYear IS NOT NULL;
