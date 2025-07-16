-- 4. Existuje rok, kdy ceny potravin rostly výrazně více než mzdy (o 10 % nebo více)?

WITH yearly_avgs AS (
    SELECT
        year,
        AVG(avg_price) AS avg_price,
        AVG(avg_gross_salary) AS avg_salary
    FROM v_sulcova_renata_project_sql_primary_final vsrpspf 
    GROUP BY year
),
growth AS (
    SELECT
        y1.year,
        ROUND(((y1.avg_price - y0.avg_price) / y0.avg_price) * 100, 2) AS price_growth_pct,
        ROUND(((y1.avg_salary - y0.avg_salary) / y0.avg_salary) * 100, 2) AS salary_growth_pct
    FROM yearly_avgs y1
    JOIN yearly_avgs y0 ON y1.year = y0.year + 1
)
SELECT *
FROM growth
WHERE price_growth_pct - salary_growth_pct >= 10;

-- Cílem porovnat meziroční růst průměrné ceny vs. průměrné mzdy v každém roce.
-- Výstupem jsou roky, kdy cenový růst překonal růst mezd o 10 % a více.

-- Příkaz je složen z několika částí:
-- 1. Průměrné roční ceny a mzdy (yearly_avgs)
-- 2. Procentuální meziroční růst cen a mezd (growth)
-- 3. Výsledná tabulka, která zobrazuje roky, kde ceny vzorstly o 10 % rychleji než mzdy

-- VÝSLEDEK: Výsledná tabulka je prázdná, tj. v analyzovaném období nebyl rok, kdy by ceny potravin překonaly růst mezd o více než 10 %. Největší zjištěný rozdíl byl v roce 2013, kdy ceny potravin rostly a mzdy mírně klesly, rozdíl byl 6.66 %, což je ale stále niží než 10 % (lze zjistit odstraněním "WHERE price_growth_pct - salary_growth_pct >= 10;" z příkazu).