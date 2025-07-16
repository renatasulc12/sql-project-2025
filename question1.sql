-- 1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

SELECT
    industry,
    year,
    ROUND(AVG(avg_gross_salary), 2) AS avg_salary
FROM v_sulcova_renata_project_sql_primary_final vsrpspf
GROUP BY industry, year
ORDER BY industry, year;

-- Cílem je zjistit vývoj průměrné hrubé mzdy (avg_salary) v čase pro každé období.
-- Výstupem je seznam odvětvi s vývojem průměrných mezd za jednotlivé roky.
-- Mzdy stoupají nebo klesají??