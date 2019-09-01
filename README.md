# bi-realtime-data-source

## Pros
 - Ability do collect data from multiple mysql, postgres, mongo DBs in one place
 - Real time anonymization and access controll using views
 - Easy to develop
 
## Cons
 - Lack of administrative experience with foreign data wrappers
 - Unknown performance issues "on scale"
 
 ## How it works
  - First, we are creating connection of Postgres instance using "Foreign Data Wrapper" for MySQL with MariaDB instance. 
  - Next is to create foreign table with particular columns supplied using connection with MariaDB.
  - Last, we are creating view in separate schema dedicated for BI (that step allows to apply functions -  f.ex. anonymize data)
