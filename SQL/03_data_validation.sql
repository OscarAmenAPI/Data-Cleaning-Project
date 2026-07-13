-- Compare row counts

SELECT COUNT(*) AS raw_rows
FROM crimemessy;

SELECT COUNT(*) AS cleaned_rows
FROM crime_clean;


-- Check duplicate incident IDs

SELECT
    incident_id,
    COUNT(*) AS duplicate_count
FROM crime_clean
GROUP BY incident_id
HAVING COUNT(*) > 1;


-- Check standardized crime types

SELECT
    crime_type,
    COUNT(*) AS row_count
FROM crime_clean
GROUP BY crime_type
ORDER BY row_count DESC;


-- Check standardized districts

SELECT
    district,
    COUNT(*) AS row_count
FROM crime_clean
GROUP BY district
ORDER BY row_count DESC;


-- Check gender values

SELECT
    suspect_gender_standardized,
    COUNT(*) AS row_count
FROM crime_clean
GROUP BY suspect_gender_standardized;


SELECT
    victim_gender_standardized,
    COUNT(*) AS row_count
FROM crime_clean
GROUP BY victim_gender_standardized;


-- Check invalid ages

SELECT *
FROM crime_clean
WHERE suspect_age < 0
   OR suspect_age > 120
   OR victim_age < 0
   OR victim_age > 120;


-- Check invalid arrest counts

SELECT *
FROM crime_clean
WHERE num_arrests < 0
   OR num_arrests > 5;


-- Check severity values

SELECT
    severity,
    COUNT(*) AS row_count
FROM crime_clean
GROUP BY severity;


-- Check case status values

SELECT
    case_status,
    COUNT(*) AS row_count
FROM crime_clean
GROUP BY case_status;


-- Check resolution values

SELECT
    resolution,
    COUNT(*) AS row_count
FROM crime_clean
GROUP BY resolution;