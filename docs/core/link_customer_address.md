## link_customer_address

The table represents the relationship between customers and their addresses.
It is used to capture the business relationship between the **Customer** and **Address** entities.

---

## Metadata

| Attribute    | Value                                                                                                      |
| ------------ | ---------------------------------------------------------------------------------------------------------- |
| Object       | Customer–Address relationship                                                                              |
| Schema       | core                                                                                                       |
| Primary Key  | link_customer_address_hk                                                                                   |
| Related Hubs | Hub_Customer, Hub_Address                                                                                  |
| Repository   |<a href='https://github.com/Niginairgash/cdw-elt-data-vault/blob/main/sql/core/ddl/links/link_customer_address.sql'>link_customer_address</a> |

---

## Attribute Structure

| Attribute                | Data Type | Description               |
| ------------------------ | --------- | ------------------------- |
| link_customer_address_hk | UUID      | Surrogate key of the link |
| customer_hk              | UUID      | Customer identifier       |
| address_hk               | UUID      | Address identifier        |
| load_dts                 | TIMESTAMP | Load timestamp            |
| record_source            | VARCHAR   | Data source               |
