## Architecture Overview
This project uses a multi-layer data warehouse architecture.
It is designed to process data, store history, and support analytical reports.

The architecture is divided into layers for raw data ingestion, core data integration, and business analytics.

## Layers
The data warehouse has three main layers:
- Staging (Raw) Layer
- Core Layer (Data Vault 2.0)
- Business Layer

### Staging (Raw) Layer
The Staging (Raw) Layer stores raw data from source systems.
Data is loaded as-is, without business logic or aggregations.
This layer is used as a technical buffer for further processing.

### Core Layer (Data Vault 2.0)
The Core Layer is built using the Data Vault 2.0 methodology.
It is used to integrate data and store full history.

The Core Layer includes:
* Hubs — store business keys
* Links — store relationships between entities
* Satellites — store changing attributes and data history (SCD Type 2)

This model allows adding new sources and attributes without changing existing tables.

### Business Layer
The Business Layer is used for analytics and reporting.
Data marts are built from the Core Layer using the Star Schema.

In this layer:
* Links are used to build fact tables
* Satellite attributes are used to build dimension tables
* The data is optimized for BI tools and analytical queries

## Data Flow
The data flow is:
1. Data is loaded into the Staging Layer from different sources (databases, APIs)
2. Data is transformed and loaded into the Core Layer to store history
3. Data is loaded from the Core Layer into the Business Layer for analytics

   
## Transformation Strategy
Data transformation is done inside the data warehouse using the ELT approach.
Raw data is loaded first, and then transformed using SQL.
This approach works for both cloud and on-premise data warehouses.
