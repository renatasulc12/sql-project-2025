CREATE OR REPLACE VIEW v_sulcova_renata_project_sql_primary_final vsrpspf AS
SELECT
    cp.payroll_year AS year,
    cp.industry_branch_code AS industry_code,
    cpib.name AS industry,
    cprc.code AS food_item_code,
    cprc.name AS food_item,
    ROUND(AVG(cp.value)::numeric,2) AS avg_gross_salary,
    ROUND(AVG(cpr.value)::numeric,2) AS avg_price
FROM czechia_payroll cp
JOIN czechia_payroll_value_type cpvt ON cp.value_type_code = cpvt.code
JOIN czechia_payroll_industry_branch cpib ON cp.industry_branch_code = cpib.code
JOIN czechia_price cpr ON EXTRACT(YEAR FROM cpr.date_from) = cp.payroll_year
JOIN czechia_price_category cprc ON cpr.category_code = cprc.code
WHERE cpvt.code = 5958
GROUP BY cp.payroll_year, cp.industry_branch_code, cpib.name, cprc.code, cprc.name;

-- 1. Výběr správného value_type_code z tabulky czechia_payroll - 5958 (Průměrná hrubá mzda)
-- 2. Připojení příslušných číselníků z tabulek czechia_value_type, czechia_payroll_industry_branch a czechia_price_category
-- 3. Propojení mezd s cenami potravin z tabulky czechia_price podle roku - užití fce EXTRACT (year from date value)
-- 4. Výběr vhodných sloupců potřebných k vyřešení výzkumných otázek
