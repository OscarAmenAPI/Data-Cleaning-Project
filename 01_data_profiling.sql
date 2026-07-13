SELECT TOP 100 *
FROM crimemessy;

SELECT COUNT(*) AS total_rows
FROM crimemessy;

SELECT crime_type, COUNT(*) AS row_count
FROM crimemessy
GROUP BY crime_type
ORDER BY row_count DESC;

SELECT district, COUNT(*) AS row_count
FROM crimemessy
GROUP BY district
ORDER BY row_count DESC;

SELECT suspect_gender, COUNT(*) AS row_count
FROM crimemessy
GROUP BY suspect_gender
ORDER BY row_count DESC;

SELECT severity, COUNT(*) AS row_count
FROM crimemessy
GROUP BY severity
ORDER BY row_count DESC;

SELECT case_status, COUNT(*) AS row_count
FROM crimemessy
GROUP BY case_status
ORDER BY row_count DESC;

SELECT resolution, COUNT(*) AS row_count
FROM crimemessy
GROUP BY resolution
ORDER BY row_count DESC;