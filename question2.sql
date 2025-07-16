-- 2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

SELECT
    year,
    food_item,
    ROUND(AVG(avg_gross_salary / avg_price), 2) AS units_affordable
FROM v_sulcova_renata_project_sql_primary_final vsrpspf 
WHERE food_item IN ('Chléb konzumní kmínový', 'Mléko polotučné pasterované')
AND year IN ('2006', '2018')
GROUP BY year, food_item
ORDER BY food_item, year;

-- Počet dostupných jednotek v daném období lze zjistit jednoduchým výpočtem - průměrná mzda / průměrná cena.