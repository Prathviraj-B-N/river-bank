-- name: CreateAccount :one
INSERT INTO account (
  name, balance
) VALUES (
  $1, $2
)
RETURNING *;