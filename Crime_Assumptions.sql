#Crimes Count per year
SELECT 
    COUNT(*) AS no_of_crimes, year
FROM
    crimetable
GROUP BY year
ORDER BY 1 DESC;

#community wise crimes count 
SELECT 
    COUNT(*) AS no_of_crimes, cm.community_name
FROM
    crimetable ct
        JOIN
    community cm USING (community_id)
GROUP BY ct.community_id
ORDER BY 1 DESC;

#community wise crimes count over the years
SELECT 
    COUNT(*) AS no_of_crimes, year, cm.community_name
FROM
    crimetable ct
        JOIN
    community cm USING (community_id)
GROUP BY ct.community_id , year
ORDER BY 1 DESC;

#Location wise crimes count 
SELECT 
    COUNT(*) AS no_of_crimes, loc.location_type
FROM
    crimetable ct
        JOIN
    location loc USING (location_id)
GROUP BY loc.location_id
ORDER BY 1 DESC;

#Location wise crimes count over the years
SELECT 
    COUNT(*) AS no_of_crimes, year, loc.location_type
FROM
    crimetable ct
        JOIN
    location loc USING (location_id)
GROUP BY loc.location_id , year
ORDER BY 1 DESC;
 
#District wise crime rates over years
SELECT 
    COUNT(*) AS no_of_crimes,
    year,
    ct.beat_id,
    pd.district_name,
    pd.address
FROM
    crimetable ct
        JOIN
    beats b USING (beat_id)
        JOIN
    police_districts pd USING (pd_id)
GROUP BY ct.beat_id , year
ORDER BY 1 DESC;



#Division of Types of Crimes
SELECT 
    COUNT(*) AS no_of_crime_types, primary_type, description
FROM
    crimetable ct
        JOIN
    iurc i USING (IURC_id)
GROUP BY ct.iurc_id
ORDER BY 1 DESC;
 
#Year wise Types of Crimes
SELECT 
    COUNT(*) AS no_of_crime_types,
    year,
    primary_type,
    description
FROM
    crimetable ct
        JOIN
    iurc i USING (IURC_id)
GROUP BY ct.iurc_id , year
ORDER BY 1 DESC;



