## PR Checklist

- [ ] I have run `docker compose config` and the compose configuration resolves without errors.
- [ ] If I changed `BUS_WEB_VERSION`, I verified whether `mysql8/initdb/03-cbus-init-table.sql` and `mysql8/initdb/04-cbus-init-data.sql` need to be updated for the new version.
- [ ] If I changed `TRACK_MAINTAIN_VERSION`, I verified whether `mysql8/initdb/01-maintain-init-table.sql` and `mysql8/initdb/02-maintain-init-data.sql` need to be updated for the new version.
- [ ] If I changed `mysql8/initdb/*.sql`, I ran `node scripts/check-init-sql.js` and fixed any column/value mismatches.
- [ ] I exported `docker compose config > compose-stack.yaml` and reviewed the diff before submitting.
