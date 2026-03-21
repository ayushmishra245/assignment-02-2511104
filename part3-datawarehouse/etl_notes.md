## ETL Decisions

### Decision 1 — Standardized inconsistent date formats
Problem: The raw retail_transactions.csv file contained multiple date formats such as YYYY-MM-DD, DD-MM-YYYY, and DD/MM/YYYY. This inconsistency can create errors during loading and makes time-based analysis unreliable.

Resolution: Before loading data into the warehouse, all dates were converted into a single standard format: YYYY-MM-DD. A separate dim_date table was then created using the cleaned dates, with attributes such as day, month, quarter, and year to support analytical reporting.

### Decision 2 — Standardized category values
Problem: The category column had inconsistent values and casing, including Electronics, electronics, Grocery, and Groceries. If loaded directly, this would split the same business category into multiple values and produce incorrect reporting.

Resolution: Category values were standardized before loading. All variations of electronics were converted to Electronics, and Grocery was standardized to Groceries. Clothing was kept in a consistent title-case format. This ensured accurate category-level aggregation in the data warehouse.

### Decision 3 — Resolved missing store city values
Problem: Some rows had NULL or blank values in the store_city column, even though the store_name was available. Missing city values would reduce the quality of store-level analysis and make the store dimension incomplete.

Resolution: Missing store_city values were filled by mapping each store_name to its correct city based on the known pattern in the dataset. For example, Chennai Anna was mapped to Chennai, Bangalore MG to Bangalore, Delhi South to Delhi, Mumbai Central to Mumbai, and Pune FC Road to Pune. This created a complete and consistent dim_store table for reporting.