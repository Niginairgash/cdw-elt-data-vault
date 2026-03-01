
## link_film_actor

The table represents the relationship between films and actors.
It is used to capture the business relationship between the **Film** and **Actor** entities.

---

## Metadata

| Attribute    | Value                                                                                                                                                                                                        |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Object       | Film–Actor relationship                                                                                                                                                                                      |
| Schema       | core                                                                                                                                                                                                         |
| Primary Key  | link_film_actor_hk                                                                                                                                                                                           |
| Related Hubs | hub_film, hub_actor                                                                                                                                                                                          |
| Repository   | <a href= 'https://github.com/Niginairgash/cdw-elt-data-vault/blob/main/sql/core/load/links/link_film_actor.sql' >link_film_actor</a> |

---

## Attribute Structure

| Attribute          | Data Type | Description                              |
| ------------------ | --------- | ---------------------------------------- |
| link_film_actor_hk | UUID      | Surrogate key of the link                |
| film_hk            | UUID      | Film identifier, reference to HUB_FILM   |
| actor_hk           | UUID      | Actor identifier, reference to HUB_ACTOR |
| load_dts           | TIMESTAMP | Load timestamp                           |
| record_source      | VARCHAR   | Data source                              |
