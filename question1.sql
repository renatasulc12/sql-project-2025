-- 1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

-- Tab. 1: ROČNÍ PRŮMĚRNÉ MZDY VŠECH ODVĚTVÍ
-- Vytvořím tabulku, která zobrazuje průměrné mzdy jednotlivých odvětví podle jednotlivých let. Ať nemusím neustále psát SELECT, použiji VIEW.

CREATE OR REPLACE VIEW v_avg_salary_by_industry AS
SELECT
    industry,
    year,
    ROUND(AVG(avg_gross_salary), 2) AS avg_salary
FROM v_sulcova_renata_project_sql_primary_final
GROUP BY industry, year;

-- Kontrola VIEW.
SELECT *
FROM v_avg_salary_by_industry

-- Tab. 2: MEZIROČNÍ POROVNÁNÍ MEZD:
-- Tabulku upravím tak, aby došlo k srovnání mzdy v aktuálním (current) a předchozím (previous) roce.
-- Vypočítám relativní změnu mezd (current/previous year) - pokud je koeficient vyšší než 1, došlo k nárustu mzdy v daném období, pokud nižší než 1, tak k jejímu poklesu.
-- V posledním sloupečku vidím komentár, zda došlo k růstu/stagnaci/poklesu mzdy.

SELECT 
    current.industry,
    current.year,
    current.avg_salary AS avg_wage,
    previous.year AS prev_year,
    previous.avg_salary AS prev_avg_wage,
    ROUND(current.avg_salary / previous.avg_salary, 3) AS relative_change,
    CASE
        WHEN current.avg_salary < previous.avg_salary THEN 'meziroční pokles'
        WHEN current.avg_salary = previous.avg_salary THEN 'meziroční stagnace'
        ELSE 'meziroční růst'
    END AS wages_trend
FROM v_avg_salary_by_industry current
JOIN v_avg_salary_by_industry previous 
	ON current.industry = previous.industry
    AND current.year = previous.year + 1
ORDER BY current.industry, current.year;

-- Tab. 3: ODVĚTVÍ, KDE MZDA KLESLA:
-- Taxativní výčet odvětví, kde alespoň jednou došlo k poklesu mezd.
-- Používám DISTINCT, takže se každé odvětví objeví jen jednou, i když poklesů mohlo být více.

SELECT DISTINCT current.industry
FROM v_avg_salary_by_industry current
JOIN v_avg_salary_by_industry previous
    ON current.industry = previous.industry
    AND current.year = previous.year + 1
WHERE current.avg_salary < previous.avg_salary
ORDER BY current.industry;