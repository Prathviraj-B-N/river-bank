## Migrations

install go package 
```brew install golang-migrate```

create migration
```migrate create -ext sql -dir . -seq init-schema```

create db inside container
```createdb --username=root --owner=root riverbank```
```psql riverbank```