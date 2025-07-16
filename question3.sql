-- 3. Která kategorie potravin zdražuje nejpomaleji?

WITH price_by_year AS (
    SELECT
        food_item,
        year,
        ROUND(AVG(avg_price), 2) AS avg_price
    FROM v_sulcova_renata_project_sql_primary_final
    GROUP BY food_item, year
),
price_growth AS (
    SELECT
        p1.food_item,
        p1.year,
        ((p1.avg_price - p0.avg_price) / p0.avg_price) * 100 AS price_growth_pct
    FROM price_by_year p1
    JOIN price_by_year p0 ON p1.food_item = p0.food_item AND p1.year = p0.year + 1
)
SELECT
    food_item,
    ROUND(AVG(price_growth_pct), 2) AS avg_yearly_price_growth_pct
FROM price_growth
GROUP BY food_item
ORDER BY avg_yearly_price_growth_pct ASC
LIMIT 1;

-- Příkaz je složen z několika částí:
-- 1. Ceny potravin po letech (price_by_year)
-- 2. Meziroční růst cen pro jednotlivé potraviny (price_growth) - výsledkem je procentuální změna ceny, tj. -1.92 (pokles o 1.92 %)
-- Vzorec: procentuální meziroční růst = (aktuální cena - předchozí cena) / předchozí cena * 100
-- 3. Průměrný meziroční růst pro jednotlivé potraviny (avg_yearly_price_growth) = jak rychle zdražují jednotlivé potraviny v procentech