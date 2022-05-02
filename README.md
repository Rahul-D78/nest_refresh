## Refreshing NestJS concepts

docker run --name prod-postgres -p 5432:5432  -e POSTGRES_PASSWORD=pass -d postgres
docker exec -it <container-id> sh
su postgres
psql

```sql
create database devdb;
create user devuser with encrypted password 'devpass';
grant all privileges on database devdb to devuser;
```