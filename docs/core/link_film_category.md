## link_film_category

The table represents the relationship between films and categories.
It is used to capture the business relationship between the **Film** and **Category** entities.

---

## Metadata

| Attribute    | Value                                                                                                                                                                                                              |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Object       | Film–Category relationship                                                                                                                                                                                         |
| Schema       | core                                                                                                                                                                                                               |
| Primary Key  | link_film_category_hk                                                                                                                                                                                              |
| Related Hubs | hub_film, hub_category                                                                                                                                                                                             |
| Repository   | <a href='https://github.com/Niginairgash/cdw-elt-data-vault/blob/main/sql/core/load/links/link_film_category.sql'>link_film_category</a> |

---

## Attribute Structure

| Attribute             | Data Type | Description                                    |
| --------------------- | --------- | ---------------------------------------------- |
| link_film_category_hk | UUID      | Surrogate key of the link                      |
| film_hk               | UUID      | Film identifier, reference to HUB_FILM         |
| category_hk           | UUID      | Category identifier, reference to HUB_CATEGORY |
| load_dts              | TIMESTAMP | Load timestamp                                 |
| record_source         | VARCHAR   | Data source                                    |
