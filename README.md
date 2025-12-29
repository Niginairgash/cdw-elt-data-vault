# Corporate Data Warehouse (ELT + Data Vault 2.0)

## Project Overview

In this project, data from multiple source systems is ingested into a staging (raw) layer using an ELT approach.

After ingestion, data is modeled according to the Data Vault 2.0 methodology and stored in the core layer in the form of hubs, links, and satellites to ensure historical data tracking.

Based on the Data Vault layer, analytical data marts are built using the Star Schema methodology to support reporting and analytical use cases.

Data loading is performed on a daily basis.

Apache Airflow is used for orchestration, managing task dependencies and execution order within the data pipelines, while all transformations are implemented inside the data warehouse using SQL.

## Why ELT
The ELT approach is chosen because it allows data transformations to be executed directly inside the data warehouse, utilizing the parallel processing capabilities of an MPP database.

By loading raw data first and applying transformations using SQL, the architecture simplifies data ingestion, enables efficient reprocessing, and supports incremental and historical data modeling.

This approach is well suited for large-scale analytical workloads where data volume and transformation complexity are handled by the data warehouse engine itself.

## Why Data Vault 2.0
Data Vault 2.0 is selected as the core data modeling methodology due to its scalability and ability to integrate data from multiple source systems without breaking the existing architecture.

The separation of data into hubs, links, and satellites allows new attributes and relationships to be added incrementally while preserving stable business keys and historical data.

This approach ensures full auditability and supports SCD Type 2 history tracking, making the core data warehouse resilient to changes in source systems and business requirements.

## Key Concepts
- ELT architecture
- Data Vault 2.0 (Hubs, Links, Satellites)
- SCD Type 2 history tracking
- SQL-driven transformations
- Separation of Raw, Core (Data Vault), and Business layers


