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

--- Fixing inconsistent data AND Categorize clean ---
SELECT 
    -- 1. Cleans Gender
    CASE 
        WHEN TRIM(UPPER(Gender)) IN ('MALE', 'M') THEN 'Male'
        WHEN TRIM(UPPER(Gender)) IN ('FEMALE', 'F') THEN 'Female'
        ELSE INITCAP(TRIM(Gender))
    END AS Gender,

    -- 2. Cleans Funding
    CASE 
        WHEN TRIM(UPPER(Payment_Method)) = 'MEDICAL AID' THEN 'Medical Aid'
        WHEN TRIM(UPPER(Payment_Method)) IN ('GOVERNMENT', 'GOV') THEN 'Government'
        ELSE INITCAP(TRIM(Payment_Method))
    END AS Payment_Method,

    -- 3. Cleans Outcome
    CASE 
        WHEN TRIM(LOWER(Outcome)) = 'discharged' THEN 'Discharged'
        WHEN TRIM(LOWER(Outcome)) = 'TRANSFERRED' THEN 'Transferred'
        ELSE INITCAP(TRIM(Outcome))
    END AS Outcome,

    -- 4. Expands Province Abbreviations & Fixes Ward Spacing/Casing
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






