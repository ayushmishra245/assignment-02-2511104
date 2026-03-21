## Storage Systems

For this hospital network, I would use a hybrid architecture with multiple specialized storage systems because each of the four goals has different workload characteristics. A relational database (such as MySQL or PostgreSQL) would be used for the core hospital transaction system, including admissions, discharges, appointments, treatments, prescriptions, and billing. This is the best fit because these workflows require ACID compliance, strong consistency, and reliable low-latency writes.

A data lakehouse would be used to store historical and real-time clinical data, especially ICU vitals and semi-structured medical records. ICU devices generate continuous streaming data at high frequency, and a lakehouse can scale efficiently for both raw ingestion and downstream processing. It also supports machine learning pipelines by storing both raw and curated datasets in one environment.

A data warehouse would be used for management reporting such as monthly bed occupancy, department-wise costs, utilization trends, and other executive dashboards. This system is optimized for OLAP workloads, large-scale aggregation, and fast analytical reporting across historical data.

A vector database would be used for the doctor query use case. Clinical notes, discharge summaries, prescriptions, and patient history can be converted into embeddings and stored as vectors so that doctors can ask natural language questions such as “Has this patient had a cardiac event before?” and retrieve semantically relevant information. Finally, the readmission risk model would consume curated historical data from the relational database and lakehouse through a feature engineering pipeline to generate predictive risk scores.

## OLTP vs OLAP Boundary

The OLTP boundary ends at the relational database layer. This is where day-to-day operational hospital transactions occur, including patient registration, appointments, admissions, treatments, prescriptions, and billing. These processes must prioritize transactional integrity, concurrency control, and immediate consistency because they directly affect patient care and hospital operations.

The OLAP boundary begins when operational and streaming data is extracted from the relational database and lakehouse into the analytical layer. At this point, the focus shifts from transaction processing to analytics, reporting, and AI-driven insights. The data warehouse is the primary OLAP system because it supports aggregated reporting and management dashboards. The vector database and readmission model also sit outside the OLTP boundary because they are not used for core transactions; instead, they support semantic retrieval and predictive analytics on top of operational data.

## Trade-offs

The most significant trade-off in this design is architectural complexity. Using separate systems for transactions, streaming storage, analytics, and semantic search creates a strong fit-for-purpose architecture, but it also increases integration effort, operational overhead, and the risk of data duplication or freshness gaps between systems.

To mitigate this, the hospital should implement standardized ETL/ELT pipelines, consistent patient and encounter identifiers across all systems, and strong data governance for access control and auditability. Near-real-time refresh policies should be defined for the warehouse and vector database, while model retraining and monitoring should be automated. This reduces synchronization risk while preserving the performance and scalability benefits of a multi-system architecture.