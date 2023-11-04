CREATE TABLE "account" (
  "custid" bigserial PRIMARY KEY,
  "name" varchar NOT NULL,
  "balance" numeric NOT NULL DEFAULT 0,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "entry" (
  "id" bigserial PRIMARY KEY,
  "account_id" bigserial NOT NULL,
  "amount" numeric NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "transaction" (
  "id" bigserial PRIMARY KEY,
  "from_id" bigserial NOT NULL,
  "to_id" bigserial NOT NULL,
  "amount" numeric NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE INDEX ON "account" ("name");

CREATE INDEX ON "entry" ("account_id");

CREATE INDEX ON "transaction" ("from_id");

CREATE INDEX ON "transaction" ("to_id");

CREATE INDEX ON "transaction" ("from_id", "to_id");

ALTER TABLE "entry" ADD FOREIGN KEY ("account_id") REFERENCES "account" ("custid");

ALTER TABLE "transaction" ADD FOREIGN KEY ("from_id") REFERENCES "account" ("custid");

ALTER TABLE "transaction" ADD FOREIGN KEY ("to_id") REFERENCES "account" ("custid");
