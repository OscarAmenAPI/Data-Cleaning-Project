-- Cleaned table
SELECT
	incident_id,

	CASE 
		WHEN TRIM(crime_type) IN ('asslt', 'ASSAULT') THEN 'Assault'
		WHEN TRIM(crime_type) IN ('D.U.I.', 'DUI', 'DUII', 'DWI') THEN 'DUI'
		WHEN TRIM(crime_type) IN ('FRAUD', 'Fraudulent Activity', 'Fraud') THEN 'Fraud'
		WHEN TRIM(crime_type) IN ('Arson', 'ARSON', 'Fire Setting', 'arson') THEN 'Arson'
		ELSE TRIM(UPPER(LEFT(crime_type, 1))) + LOWER(SUBSTRING(crime_type, 2, LEN(crime_type)))
	END AS crime_type,

	city,
	state,
	address,
	latitude,
	longitude,
	incident_datetime,
	officer_id,
	TRIM(UPPER(LEFT(officer_first_name, 1))) + LOWER(SUBSTRING(officer_first_name, 2, LEN(officer_first_name))) AS officer_first_name,
	TRIM(UPPER(LEFT(officer_last_name, 1))) + LOWER(SUBSTRING(officer_last_name, 2, LEN(officer_last_name))) AS officer_last_name,
	badge_number,
	suspect_id,
	TRIM(UPPER(LEFT(suspect_first_name, 1))) + LOWER(SUBSTRING(suspect_first_name, 2, LEN(suspect_first_name))) AS suspect_first_name,
	TRIM(UPPER(LEFT(suspect_last_name, 1))) + LOWER(SUBSTRING(suspect_last_name, 2, LEN(suspect_last_name))) AS suspect_last_name,

	CASE
		WHEN TRY_CAST(suspect_age AS int) BETWEEN 0 AND 120
			THEN TRY_CAST(suspect_age AS int)
		ELSE NULL
	END AS suspect_age,

	CASE
		WHEN district IN ('Southwest', 'southwest') THEN 'Southwest'
		WHEN district IN ('Southeast', 'southeast') THEN 'Southeast'
		WHEN district IN ('sou', 'SOUTH', 'south', 'South', 'Sou') THEN 'South'
		WHEN district IN('Northwest', 'northwest', 'NORTHWEST') THEN 'Northwest'
		WHEN district IN('Northeast', 'northeast', 'NORTHEAST') THEN 'Northeast'
		WHEN district IN('NORTH', 'north', 'NOR', 'nor', 'Nor') Then 'North'
		WHEN district IN('WEST', 'west', 'West') THEN 'West'
		WHEN district IN('EAST', 'East', 'east') THEN 'East'
		WHEN district IN('CENTRAL', 'Central', 'central', 'cen', 'Cen') THEN 'Central'
		WHEN district IN('Mid', 'Midtown', 'MIDTOWN', 'midtown') THEN 'Midtown'
		WHEN district IS NULL 
			OR TRIM(district) = ' ' 
			OR UPPER(TRIM(district)) = 'NULL' THEN 'Unknown'
		ELSE 'Unkown'
	END AS district,


	CASE
		WHEN suspect_gender IN ('F', 'female') THEN 'Female'
		WHEN suspect_gender IN ('M', 'MALE') THEN 'Male'
		WHEN suspect_gender IS NULL OR 
			TRIM(suspect_gender) = ' ' THEN 'Unknown'
		ELSE 'Unknown'
	END as suspect_gender_standardized,

	TRIM(UPPER(LEFT(suspect_race, 1))) + LOWER(SUBSTRING(suspect_race, 2, LEN(suspect_race))) AS suspect_race,

	victim_id,

	TRIM(UPPER(LEFT(victim_first_name, 1))) + LOWER(SUBSTRING(victim_first_name, 2, LEN(victim_first_name))) AS victim_first_name,
	TRIM(UPPER(LEFT(victim_last_name, 1))) + LOWER(SUBSTRING(victim_last_name, 2, LEN(victim_last_name))) AS victim_last_name,

	CASE
		WHEN TRY_CAST(victim_age AS int) BETWEEN 0 AND 120
			THEN TRY_CAST(victim_age AS int)
		ELSE NULL
	END AS victim_age,

	CASE
		WHEN victim_gender IN ('F', 'female', 'f') THEN 'Female'
		WHEN victim_gender IN ('M', 'MALE', 'm') THEN 'Male'
		WHEN victim_gender IN ('other', 'OTHER', 'Other') THEN 'Other'
		WHEN victim_gender IS NULL OR 
			TRIM(victim_gender) = ' ' THEN 'Unknown'
		ELSE 'Unknown'
	END as victim_gender_standardized,


	CASE
    WHEN LEN(
        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(TRIM(victim_phone), '(', ''),
                ')', ''),
            '-', ''),
        ' ', '')
    ) = 10
    THEN REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(TRIM(victim_phone), '(', ''),
                ')', ''),
            '-', ''),
        ' ', '')
    ELSE NULL
END AS phone_clean,

TRIM(UPPER(LEFT(weapon_used, 1))) + LOWER(SUBSTRING(weapon_used, 2, LEN(weapon_used))) AS weapon_used,

CASE
	WHEN severity IN ('1', '2', 'Low') THEN 'Low'
	WHEN severity IN ('3', 'Med', 'MEDIUM') THEN 'Medium'
	WHEN severity IN ('high', '4') THEN 'High'
	WHEN severity IN ('Critical', 'Crit') THEN 'Critical'
	ELSE 'Unkown'
END AS severity,

CASE
	WHEN case_status IN ('Pending', 'Pendng') THEN 'Pending'
	WHEN case_status IN ('CLOSED') THEN 'Closed'
	WHEN case_status IN ('Investigation', 'under investigation') THEN 'Under Investigation'
	ELSE TRIM(UPPER(LEFT(case_status, 1))) + LOWER(SUBSTRING(case_status, 2, LEN(case_status)))
END as case_status,

CASE
	WHEN resolution IN ('warning', 'Warning Issued') THEN 'Warning Issued'
	WHEN resolution IN ('Case Dismissed', 'Dismissed') THEN 'Dismissed'
	WHEN resolution IN ('Arres Made', 'arrest made') THEN 'Arrest Made'
	ELSE TRIM(UPPER(LEFT(resolution, 1))) + LOWER(SUBSTRING(resolution, 2, LEN(resolution)))
END AS resolution


FROM crimemessy