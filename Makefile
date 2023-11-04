createdb:
	docker exec -it riverbank-db createdb --username=root --owner=root riverbank

dropdb:
	docker exec -it riverbank-db dropdb riverbank

initPostgres:
	docker run --name riverbank-db-test -p 5432:5432 -e POSTGRES_PASSWORD=1234 -e POSTGRES_USER=root -d postgres:alpine3.18

migrateup:
	migrate -path db/migration/ -database "postgresql://root:1234@localhost:5432/riverbank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration/ -database "postgresql://root:1234@localhost:5432/riverbank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: createdb dropdb initPostgres migrateup migratedown