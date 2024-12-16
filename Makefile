createdb:
	docker exec -it postgres-db createdb  simple_bank

dropdb:
	docker exec -it postgres-db dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgres://root:password@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgres://root:password@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc: 
	sqlc generate

test:
	go test -v -cover ./...

.PHONY: createdb dropdb migrateup migratedown