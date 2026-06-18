# Copilot Review Instructions

When reviewing pull requests in this repository, apply the following rules.

## Version bumps that require MySQL init data sync

This repository is a Docker Compose packaging repo for a fleet/vehicle tracking platform. Backend and frontend version variables in `default.env` / `default.en.env` map to application releases that may introduce new database migrations or seed-data changes.

If a PR changes either of these version variables, the author must also review and update the corresponding MySQL initialization scripts under `mysql8/initdb/`:

- `BUS_WEB_VERSION` — may affect the `cbus` database. Verify that `mysql8/initdb/03-cbus-init-table.sql` and `mysql8/initdb/04-cbus-init-data.sql` still match the expected schema and seed data for the new version.
- `TRACK_MAINTAIN_VERSION` — may affect the `maintain` database. Verify that `mysql8/initdb/01-maintain-init-table.sql` and `mysql8/initdb/02-maintain-init-data.sql` still match the expected schema and seed data for the new version.

Do not approve the PR until:

1. The init SQL scripts are confirmed to be consistent with the new version, OR
2. The author explicitly confirms that no schema/seed changes are required for this version bump.

## General SQL init validation

If `mysql8/initdb/*.sql` is modified, run `node scripts/check-init-sql.js` to ensure every `INSERT INTO ... VALUES` statement has the same number of values as the corresponding `CREATE TABLE` has columns.

## Compose validation

Any change to `compose.yml`, `compose*.yml`, or included compose fragments should be validated with `docker compose config` before merging.
