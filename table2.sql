CREATE OR REPLACE VIEW v_sulcova_renata_project_sql_secondary_final AS
SELECT
    e.country,
    e.year,
    ROUND(e.gdp::numeric, 2) AS gdp,
    ROUND(e.gini::numeric, 2) AS gini,
    ROUND(e.population::numeric, 0) AS population
FROM economies e
JOIN countries c ON e.country = c.country
WHERE c.continent = 'Europe'
AND e.year IN (
    SELECT DISTINCT year FROM v_sulcova_renata_project_sql_primary_final
  )
ORDER BY e.year, e.country;

-- 1. Připojení (join) tabulek economies a countries podle názvu státu
-- 2. Vyfiltrování dat podle kontinentu (Europe) a roku, který je v primární tabulce
-- 3. Výběr správných sloupců k zodpovězení výzkumné otázky č. 5
