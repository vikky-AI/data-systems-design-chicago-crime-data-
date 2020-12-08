use crime_portal;

/*********************************************************************************************************************/

SELECT 
    COUNT(1), b.ward_no, c.primary_type
FROM
    crimetable a
        INNER JOIN
    ward b ON a.ward_id = b.ward_id
        INNER JOIN
    IURC c ON a.IURC_id = c.IURC_id
GROUP BY b.ward_no , c.primary_type
ORDER BY b.ward_no;

/*********************************************************************************************************************/
SELECT 
    COUNT(1), b.community_name,b.community_id,c.primary_type
FROM
    crimetable a
        INNER JOIN
    community b ON a.community_id = b.community_id
        INNER JOIN
    IURC c ON a.IURC_id = c.IURC_id
GROUP BY b.community_name ,b.community_id, c.primary_type
ORDER BY b.community_id;

/*********************************************************************************************************************/
SELECT 
    COUNT(1), d.district_name,c.primary_type
FROM
    crimetable a
        INNER JOIN
    beats b ON a.beat_id = b.beat_id
        INNER JOIN
    IURC c ON a.IURC_id = c.IURC_id
        inner join 
    police_districts d
    on b.pd_id=d.pd_id
GROUP BY d.district_name , c.primary_type
ORDER BY d.district_name;

/*********************************************************************************************************************/
SELECT 
    COUNT(1), a.year, b.primary_type
FROM
    crimetable a
        INNER JOIN
    IURC b ON a.IURC_id = b.IURC_id
GROUP BY a.year , b.primary_type
ORDER BY a.year;

/*********************************************************************************************************************/
SELECT 
    COUNT(1), c.location_type, b.primary_type
FROM
    crimetable a
        INNER JOIN
    IURC b ON a.IURC_id = b.IURC_id
    inner join 
    location c on c.location_id=a.location_id
GROUP BY c.location_type , b.primary_type
ORDER BY c.location_type;

SELECT 
    a.year, a.domestic, a.arrest, b.primary_type
FROM
    crimetable a
        INNER JOIN
    IURC b ON a.IURC_id = b.IURC_id;

/*********************************************************************************************************************/

SELECT 
    COUNT(1), month(a.data_date) as Month, b.primary_type
FROM
    crimetable a
        INNER JOIN
    IURC b ON a.IURC_id = b.IURC_id
GROUP BY Month , b.primary_type
ORDER BY Month;

/*********************************************************************************************************************/
# crime on specific/national holidays
SELECT 
    DAY(a.data_date) EVE, b.Primary_type, a.year, c.ward_no
FROM
    crimetable a
        INNER JOIN
    IURC b ON a.IURC_id = b.IURC_id
        INNER JOIN
    ward c ON a.ward_id = c.ward_id
WHERE
    data_date LIKE '%-01-01'
        OR data_date LIKE '%-01-05'
        OR data_date LIKE '%-07-04'
        OR data_date LIKE '%-11-11'
        OR data_date LIKE '%-12-25'
ORDER BY MONTH(data_date);
   


/*********************************************************************************************************************/
DROP VIEW IF EXISTS crime_school;
CREATE VIEW crime_portal.crime_school AS
    SELECT 
        chicago_schools.id_schools,
        chicago_schools.school_name,
        chicago_schools.ward_id,
        iurc.primary_type,
        location.location_type,
        community.community_name,
        police_districts.district_name,
        police_districts.address,
        police_districts.phone
    FROM
        crimetable
            INNER JOIN
        iurc ON crimetable.IURC_id = iurc.IURC_id
            INNER JOIN
        location ON crimetable.location_id = location.location_id
            INNER JOIN
        community ON crimetable.community_id = community.community_id
            INNER JOIN
        chicago_schools ON crimetable.community_id = chicago_schools.community_id
            INNER JOIN
        beats ON crimetable.beat_id = beats.beat_id
            INNER JOIN
        police_districts ON beats.pd_id = police_districts.pd_id;
        
/**********************************************************************************************************/

SELECT
school_name,
id_schools,
community_name,
location_type,
district_name
FROM
crime_school
WHERE  primary_type like '%KIDNAPPING%';


/***************************************************/
SELECT
distinct
school_name,
id_schools,
community_name,
location_type,
district_name
FROM
crime_school
WHERE  primary_type like '%NARCOTICS%';


/**********************************************************************/

SELECT
school_name,
id_schools,
community_name,
location_type,
address,
district_name
FROM
crime_school
WHERE  primary_type like '%NARCOTICS%';

/**********************************************************************/

select * from crime_school;        