## link_rental

The table captures the fact of a film rental and represents the relationship between the customer and the film inventory item.

---

## Metadata

| Attribute    | Value                                                                                                                                                                                                |
| ------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Object       | Customer–Film Inventory relationship (rental fact)                                                                                                                                                   |
| Schema       | core                                                                                                                                                                                                 |
| Primary Key  | link_rental_hk                                                                                                                                                                                       |
| Related Hubs | Hub_Customer, Hub_Staff, HUB_INVENTORY                                                                                                                                                               |
| Repository   | <a href="https://github.com/Niginairgash/cdw-elt-data-vault/blob/main/sql/core/load/links/link_rental.sql">link_rental</a> |

---

## Attribute Structure

| Attribute      | Data Type | Description                |
| -------------- | --------- | -------------------------- |
| link_rental_hk | UUID      | Surrogate key of the link  |
| customer_hk    | UUID      | Reference to Hub_Customer  |
| inventory_hk   | UUID      | Reference to Hub_Inventory |
| staff_hk       | UUID      | Reference to Hub_Staff     |
| load_dts       | TIMESTAMP | Load timestamp             |
| record_source  | VARCHAR   | Data source                |
