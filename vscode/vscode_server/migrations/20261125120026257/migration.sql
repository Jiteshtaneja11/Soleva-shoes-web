BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "newsletter_subscriber" (
    "id" bigserial PRIMARY KEY,
    "email" text NOT NULL,
    "subscribedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "newsletter_email_unique_idx" ON "newsletter_subscriber" USING btree ("email");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "product" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "slug" text NOT NULL,
    "brand" text NOT NULL,
    "category" text NOT NULL,
    "gender" text NOT NULL,
    "description" text NOT NULL,
    "imageUrl" text NOT NULL,
    "secondaryImageUrl" text NOT NULL,
    "price" double precision NOT NULL,
    "originalPrice" double precision,
    "rating" double precision NOT NULL,
    "reviewCount" bigint NOT NULL,
    "colors" text NOT NULL,
    "sizes" text NOT NULL,
    "stock" bigint NOT NULL,
    "featured" boolean NOT NULL,
    "trending" boolean NOT NULL,
    "newArrival" boolean NOT NULL,
    "published" boolean NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "product_slug_unique_idx" ON "product" USING btree ("slug");
CREATE INDEX "product_featured_idx" ON "product" USING btree ("featured");


--
-- MIGRATION VERSION FOR vscode
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('vscode', '20261125120026257', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261125120026257', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260824182259319', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260824182259319', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20261015164015382', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261015164015382', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20260924105232991', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260924105232991', "timestamp" = now();


COMMIT;
