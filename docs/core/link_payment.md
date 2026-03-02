## link_payment

The `link_payment` table captures the fact of a payment transaction and represents the relationship between the customer, the staff member, and the rental event.

In the model, a payment is considered a business event that logically depends on the rental event. For this reason, `link_payment` contains a reference to `link_rental`.

In the **Data Vault** architecture, a Link table may participate in another relationship if this reflects real business logic and the sequence of business events within the process.

---

## Metadata

| Attribute    | Value                                                                                             |
| ------------ | ------------------------------------------------------------------------------------------------- |
| Object       | Payment relationship with business entities                                                       |
| Schema       | core                                                                                              |
| Primary Key  | link_payment_hk                                                                                   |
| Related Hubs | Hub_Customer, Hub_Staff, Link_Rental                                                              |
| Repository   | <a href="https://github.com/Niginairgash/cdw-elt-data-vault/blob/main/sql/core/load/links/link_payment.sql">link_payment</a> |

---

## Attribute Structure

| Attribute       | Data Type | Description               |
| --------------- | --------- | ------------------------- |
| link_payment_hk | UUID      | Surrogate key of the link |
| customer_hk     | UUID      | Reference to Hub_Customer |
| staff_hk        | UUID      | Reference to Hub_Staff    |
| link_rental_hk  | UUID      | Reference to Link_Rental  |
| load_dts        | TIMESTAMP | Load timestamp            |
| record_source   | VARCHAR   | Data source               |

---

Separating business events into distinct Link tables ensures model flexibility and allows the structure to scale without modifying existing Hubs.
