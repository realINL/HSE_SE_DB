# HW4
![](./screenshots/createContainers.png)
Создан docker-compose файл с тремя сервисами PostgreSQL и запущены контейнеры. 
![](./screenshots/connectToDG.png)
Через DataGrip удалось подключиться к БД.
![](./screenshots/tablesCreation.png)
SQL запросами (В папке SQL) были созданы таблицы и загружены данные.
![](./screenshots/removingConteiners.png)
Контейнеры были удалены.
![](./screenshots/result.png)
После повторного запуска и подключения к DataGrip можно наблюдать, что данные не сохранились, т.к. не были использованы volumes.