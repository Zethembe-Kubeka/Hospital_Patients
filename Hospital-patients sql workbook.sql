-- Databricks notebook source
SELECT *
FROM hospital.patients.hospital_patients;

--Checking for number of records
SELECT COUNT(*)
FROM hospital.patients.hospital_patients;

-- Check each column for nulls / blanks
SELECT
    COUNT(*) AS total,
    SUM(CASE WHEN Patient_ID        = '' OR Patient_ID        IS NULL THEN 1 ELSE 0 END) AS missing_id,
    SUM(CASE WHEN Admission_Date    = '' OR Admission_Date    IS NULL THEN 1 ELSE 0 END) AS missing_admission,
    SUM(CASE WHEN Discharge_Date    = '' OR Discharge_Date    IS NULL THEN 1 ELSE 0 END) AS missing_discharge,
    SUM(CASE WHEN Diagnosis         = '' OR Diagnosis         IS NULL THEN 1 ELSE 0 END) AS missing_diagnosis,
    SUM(CASE WHEN Treatment_Cost_ZAR= '' OR Treatment_Cost_ZAR IS NULL THEN 1 ELSE 0 END) AS missing_cost,
    SUM(CASE WHEN Outcome           = '' OR Outcome           IS NULL THEN 1 ELSE 0 END) AS missing_outcome
FROM hospital.patients.hospital_patients;

---CATEGORIZE AGE 
SELECT 
    Age,
    CASE
        WHEN Age < 18 THEN 'Child' 
        WHEN Age BETWEEN 18 AND 35 THEN 'Young Adult' 
        WHEN Age BETWEEN 36 AND 55 THEN 'Adult' 
        WHEN Age BETWEEN 56 AND 75 THEN 'Senior' 
        WHEN Age > 75 THEN 'Elderly' 
        ELSE 'Unknown' 
    END AS Age_group
FROM hospital.patients.hospital_patients;

--- Fixing inconsistent ---
SELECT 
    --  Cleans Gender
    CASE 
        WHEN TRIM(UPPER(Gender)) IN ('MALE', 'M') THEN 'Male'
        WHEN TRIM(UPPER(Gender)) IN ('FEMALE', 'F') THEN 'Female'
        ELSE INITCAP(TRIM(Gender))
    END AS Gender
FROM hospital.patients.hospital_patients;

--  Expands Province Abbreviations & Fixes Ward Spacing/Casing
SELECT
    CASE 
        -- Standard South African Province Abbreviations
        WHEN TRIM(UPPER(Province)) IN ('GP', 'GT') THEN 'Gauteng'
        WHEN TRIM(UPPER(Province)) IN ('KZN', 'NL') THEN 'KwaZulu-Natal'
        WHEN TRIM(UPPER(Province)) = 'WC' THEN 'Western Cape'
        WHEN TRIM(UPPER(Province)) = 'EC' THEN 'Eastern Cape'
        WHEN TRIM(UPPER(Province)) = 'FS' THEN 'Free State'
        WHEN TRIM(UPPER(Province)) = 'NW' THEN 'North West'
        WHEN TRIM(UPPER(Province)) = 'LP' THEN 'Limpopo'
        WHEN TRIM(UPPER(Province)) = 'MP' THEN 'Mpumalanga'
        WHEN TRIM(UPPER(Province)) = 'NC' THEN 'Northern Cape'
        -- Default for actual ward names: fixes weird casing and squashes double spaces
        ELSE INITCAP(REGEXP_REPLACE(TRIM(Province), '\\s+', ' '))
    END AS Province
FROM hospital.patients.hospital_patients;

--Fixing the date column--
SELECT
    COALESCE(
        TRY_TO_DATE(Admission_Date, 'MM-dd-yyyy'),
        TRY_TO_DATE(Admission_Date, 'dd MMM yyyy'),
        TRY_TO_DATE(Admission_Date, 'yyyy-MM-dd'),
        TRY_TO_DATE(Admission_Date, 'dd/MM/yyyy')
    ) AS Admission_Date,
    COALESCE(
        TRY_TO_DATE(Discharge_Date, 'MM-dd-yyyy'),
        TRY_TO_DATE(Discharge_Date, 'dd MMM yyyy'),
        TRY_TO_DATE(Discharge_Date, 'yyyy-MM-dd'),
        TRY_TO_DATE(Discharge_Date, 'dd/MM/yyyy')
    ) AS Discharge_Date
FROM hospital.patients.hospital_patients;

-- FINDING HOW LONG PATIENTS WERE ADMITTED FOR --
SELECT
    DATEDIFF(
        COALESCE(
            TRY_TO_DATE(Discharge_Date, 'MM-dd-yyyy'),
            TRY_TO_DATE(Discharge_Date, 'dd MMM yyyy'),
            TRY_TO_DATE(Discharge_Date, 'yyyy-MM-dd'),
            TRY_TO_DATE(Discharge_Date, 'dd/MM/yyyy')
        ),
        COALESCE(
            TRY_TO_DATE(Admission_Date, 'MM-dd-yyyy'),
            TRY_TO_DATE(Admission_Date, 'dd MMM yyyy'),
            TRY_TO_DATE(Admission_Date, 'yyyy-MM-dd'),
            TRY_TO_DATE(Admission_Date, 'dd/MM/yyyy')
        )
    ) AS Days_Admitted
FROM hospital.patients.hospital_patients;

--CLEANING WARD--
SELECT
    INITCAP(LTRIM(Ward)) AS Ward
FROM hospital.patients.hospital_patients;

--  CLEAN DIAGNOSIS
SELECT
    INITCAP(TRIM(diagnosis)) AS diagnosis
FROM hospital.patients.hospital_patients; 

-- CLEANING ATTENDING DOCTOR
SELECT
    INITCAP(TRIM(attending_doctor)) AS attending_doctor
FROM hospital.patients.hospital_patients;

--TREATMENT COST COLUMN
SELECT
    CAST(REGEXP_REPLACE(REGEXP_REPLACE(Treatment_Cost_ZAR, 'R', ''), ',', '') AS DECIMAL(12, 2)) AS Treatment_cost
FROM hospital.patients.hospital_patients;

-- CLEANING FUNDS COLUMN
SELECT
    CASE 
        WHEN TRIM(UPPER(Payment_Method)) = 'MEDICAL AID' THEN 'Medical Aid'
        WHEN TRIM(UPPER(Payment_Method)) IN ('GOVERNMENT', 'GOV') THEN 'Government'
        ELSE INITCAP(TRIM(Payment_Method))
    END AS Payment_Method
FROM hospital.patients.hospital_patients;

--  CLEANING THE OUTCOME COLUMN
SELECT
    CASE 
        WHEN TRIM(LOWER(Outcome)) = 'discharged' THEN 'Discharged'
        WHEN TRIM(LOWER(Outcome)) = 'TRANSFERRED' THEN 'Transferred'
        ELSE INITCAP(TRIM(Outcome))
    END AS Outcome
FROM hospital.patients.hospital_patients;























