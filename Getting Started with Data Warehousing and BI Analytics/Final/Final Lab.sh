Task 1 - Design the dimension table MyDimDate

dateid
date
year
quarter
quartername
month
monthname
day
weekday
weekdayname


Task 2 - Design the dimension table MyDimWaste

wastetypeid
wastetype


Task 3 - Design the dimension table MyDimZone

zoneid
collectionzoneid
collectionzone
cityid
city


Task 4 - Design the fact table MyFactTrips

tripid
wastetypeid
wastecollected
zoneid
dateid


Task 5 - Create the dimension table MyDimDate

CREATE TABLE WRJ90196.MyDimDate (
	dateid INT NOT NULL,
	date DATE,
	year INT,
	quarter INT,
	quartername VARCHAR(6),
	month INT,
	monthname VARCHAR(6),
	day INT,
	weekday INT,
	weekdayname VARCHAR(6),
	PRIMARY KEY (dateid)
);


Task 6 - Create the dimension table MyDimWaste

CREATE TABLE WRJ90196.MyDimWaste (
	wastetypeid INT NOT NULL,
	wastetype VARCHAR(6),
	PRIMARY KEY (wastetypeid)
);


Task 7 - Create the dimension table MyDimZone

CREATE TABLE WRJ90196.MyDimZone (
	zoneid INT NOT NULL,
	collectionzoneid INT,
	collectionzone VARCHAR(6),
	cityid INT,
	city VARCHAR(8),
	PRIMARY KEY (zoneid)
);


Task 8 - Create the fact table MyFactTrips

CREATE TABLE WRJ90196.MyFactTrips (
	tripid INT NOT NULL,
	wastetypeid INT,
	wastecollected DECIMAL(6,2),
	zoneid INT,
	dateid INT,
	PRIMARY KEY (tripid)
);


Task 13 - Create a grouping sets query

SELECT 
	F.STATIONID,
	T.TRUCKTYPE,
	SUM(F.WASTECOLLECTED) AS TOTALWASTECOLLECTED
FROM FACTTRIPS F
INNER JOIN DIMTRUCK T
	ON F.TRUCKID = T.TRUCKID
GROUP BY 
	F.STATIONID, 
	T.TRUCKTYPE
;


Task 14 - Create a rollup query

SELECT 
	D.YEAR,
	S.CITY,
	F.STATIONID,
	SUM(F.WASTECOLLECTED) AS TOTALWASTECOLLECTED
FROM FACTTRIPS F
INNER JOIN DIMDATE D
	ON F.DATEID = D.DATEID
INNER JOIN DIMSTATION S
	ON F.STATIONID = S.STATIONID
GROUP BY ROLLUP (
	D.YEAR,
	S.CITY,
	F.STATIONID
);


Task 15 - Create a cube query

SELECT 
	D.YEAR,
	S.CITY,
	F.STATIONID,
	AVG(F.WASTECOLLECTED) AS AVGWASTECOLLECTED
FROM FACTTRIPS F
INNER JOIN DIMDATE D
	ON F.DATEID = D.DATEID
INNER JOIN DIMSTATION S
	ON F.STATIONID = S.STATIONID
GROUP BY CUBE (
	D.YEAR,
	S.CITY,
	F.STATIONID
);


Task 16 - Create an MQT

CREATE TABLE MAXWASTESTATS (CITY, STATIONID, TRUCKTYPE,MAXWASTECOLLECTED) AS (
	SELECT
		S.CITY,
		F.STATIONID,
		T.TRUCKTYPE,
		MAX(F.WASTECOLLECTED) AS MAXWASTECOLLECTED
	FROM FACTTRIPS F
	INNER JOIN DIMSTATION S
		ON F.STATIONID = S.STATIONID
	INNER JOIN DIMTRUCK T
		ON F.TRUCKID = T.TRUCKID
GROUP BY 
	S.CITY,
	F.STATIONID,
	T.TRUCKTYPE
)
DATA INITIALLY DEFERRED
REFRESH DEFERRED
MAINTAINED BY SYSTEM
ENABLE QUERY OPTIMIZATION
;
