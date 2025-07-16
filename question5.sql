-- 5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?

WITH czech_data AS (
  SELECT
    year,
    AVG(avg_gross_salary) AS avg_salary,
    AVG(avg_price) AS avg_price
  FROM v_sulcova_renata_project_sql_primary_final
  GROUP BY year
),
gdp_data AS (
  SELECT
    year,
    gdp
  FROM v_sulcova_renata_project_sql_secondary_final
  WHERE country = 'Czech Republic'
),
merged AS (
  SELECT
    c.year,
    c.avg_salary,
    c.avg_price,
    g.gdp
  FROM czech_data c
  JOIN gdp_data g ON c.year = g.year
),
growth AS (
  SELECT
    m1.year,
    ROUND(((m1.gdp - m0.gdp) / m0.gdp) * 100, 2) AS gdp_growth_pct,
    ROUND(((m1.avg_salary - m0.avg_salary) / m0.avg_salary) * 100, 2) AS salary_growth_pct,
    ROUND(((m1.avg_price - m0.avg_price) / m0.avg_price) * 100, 2) AS price_growth_pct
  FROM merged m1
  JOIN merged m0 ON m1.year = m0.year + 1
)
SELECT *
FROM growth
ORDER BY year;

-- Cílem je zjistit, zda při růstku/poklesu HDP vzroste/klesne mzda a cena potravim ve stejném či následujícím roce.
-- Data naznačují, že růst HDP obvykle souvisí s růstem mezd a mírným růstem cen potravin.
-- Přímou jednoznačnou závislost však nelze prokázat pouze z těchto dat, protože do vývoje cen vstupují i další faktory (např. světové ceny komodit, dovozní ceny, daňové změny).??