# SQL Projekt – Engeto

Tento projekt je součástí kurzu **ENGETO Datová Akademie** a je zaměřen na procvičení SQL dovedností včetně tvorby tabulek, manipulace s daty a analýzy pomocí SQL dotazů.

## Cíl projektu

Cílem projektu je analyzovat dostupnost základních potravin v České republice ve vztahu k vývoji mezd a ekonomickým ukazatelům.  
Součástí je i mezinárodní srovnání s dalšími evropskými státy.

---

## Struktura projektu (soubory)

- `question1.sql` – Skript pro výzkumnou otázku č. 1
- `question2.sql` – Skript pro výzkumnou otázku č. 2
- `question3.sql` – Skript pro výzkumnou otázku č. 3
- `question4.sql` – Skript pro výzkumnou otázku č. 4  
- `question5.sql` – Skript pro výzkumnou otázku č. 5
- `table1.sql` – Skript pro vytvoření primární tabulky
- `table2.sql` – Skript pro vytvoření sekundární tabulky

---

## Popis finálních tabulek

### Primární tabulka
**`v_sulcova_renata_project_sql_primary_final`**

#### Obsah:

- Průměrné hrubé mzdy v jednotlivých odvětvích v České republice.
- Průměrné ceny základních potravin.
- Agregace na roční úroveň.

#### Postup vytvoření:

- K nahlédnutí v přiloženém skriptu `table1.sql`.

---

### Sekundární tabulka
**`v_sulcova_renata_project_sql_secondary_final`**

#### Obsah:

- HDP (GDP), GINI koeficient a populace evropských států.
- Data jsou omezená na roky odpovídající primární tabulce.

#### Postup vytvoření:

- K nahlédnutí v přiloženém skriptu `table2.sql`.

---

## Výsledky výzkumných otázek

### 1️⃣ Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

**Odpověď:**  


---

### 2️⃣ Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období?

**Odpověď:**  
Za průměrnou mzdu je možné si v posledním roce koupit **více litrů mléka i kilogramů chleba** než na začátku sledovaného období.  
Chléb: 2006 - 1287.46 kg, 2018 - 1342.24 kg  
Mléko: 2006 - 1437.24 l, 2018 - 1641.57 l  

---

### 3️⃣ Která kategorie potravin zdražuje nejpomaleji (má nejnižší procentuální meziroční nárůst)?

**Odpověď:**  
Nejnižší průměrnou meziroční změnu ceny vykazuje **Cukr krystalový**.  
Cukr dokonce mírně zlevňoval - cena klesala v průměru o 1.92 % ročně.  
Dle dat nalezených na internetu může výsledek souviset se zrušením cukerných kvót v EU v roce 2017 a následným poklesem cen.  

---

### 4️⃣ Existuje rok, kdy byl meziroční růst cen potravin výrazně vyšší než růst mezd (více než o 10 %)?

**Odpověď:**  
Podle dat se v žádném sledovaném roce nestalo, že by růst cen potravin převýšil růst mezd o více než 10 %.  
Největší zjištěný rozdíl byl v roce 2013, kdy ceny potravin rostly a mzdy mírně klesly, rozdíl byl 6.66 %, což je ale stále niží než 10 % (lze zjistit odstraněním "WHERE price_growth_pct - salary_growth_pct >= 10;" z příkazu).  

---

### 5️⃣ Má výše HDP vliv na změny ve mzdách a cenách potravin?

**Odpověď:**  


---

## Autor

Renata Šulcová  
[GitHub: renatasulc12](https://github.com/renatasulc12)