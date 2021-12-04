-- #1 Total count of pokemon in each type.
SELECT Type_1 + ' & ' + Type_2 as Combination, COUNT(*) as Number
FROM Pokemon
GROUP BY Type_1 + ' & ' + Type_2
ORDER BY Number DESC

--#2 Total strength of pokemon in each type.
SELECT Type_1 + ' & ' + Type_2 as Combination, SUM(Total) as Strength
FROM Pokemon
GROUP BY Type_1 + ' & ' + Type_2
ORDER BY Strength DESC

--#3 Which pokemon type is the strongest.
SELECT Type_1 + ' & ' + Type_2, name, Total
FROM Pokemon
WHERE Total in (SELECT MAX(Total) FROM Pokemon)

--#4 Which pokemon type should we stay away from?
SELECT * 
FROM Pokemon
WHERE Type_1 = 'Poison' or Type_2 = 'Poison' 
OR Type_1 = 'Ghost' OR Type_2 = 'Ghost'

--#5 Which pokemon type has the most legendaries
SELECT  CONCAT(Type_1,' & ', Type_2) as Combination, SUM(CAST(Legendary as int)) as Legendary
FROM Pokemon
GROUP BY CONCAT(Type_1,' & ', Type_2)
ORDER BY Legendary DESC

--#6 which pokemon type doesn't have any legendaries
SELECT  CONCAT(Type_1,' & ', Type_2) as Combination, SUM(CAST(Legendary as int)) as Legendary
FROM Pokemon
GROUP BY CONCAT(Type_1,' & ', Type_2)
HAVING SUM(CAST(Legendary as int)) = 0
ORDER BY Legendary DESC

--#7 Strongest Legendary and non Legendary pokemon
SELECT Name, A.Total, A.Legendary
FROM Pokemon as A
JOIN (SELECT Legendary, MAX(Total) as Total from Pokemon GROUP BY Legendary) as B
ON A.Legendary = B.Legendary
AND A.Total = B.Total
ORDER BY Legendary


--#8 Fastest pokemons from each generations
SELECT Name, Speed, Generation, Legendary
FROM Pokemon as A
JOIN (SELECT Generation as Gen, MAX(Speed) as High_Speed FROM Pokemon GROUP BY Generation) as B
ON A.Generation = B.Gen
AND A.Speed = B.High_Speed
ORDER BY 3














