## <center> A Quick Sentry Tutorial </center>

* This tutorial assumes:
  * Your cluster has been Kerberized
  * You're familiar with [HiveQL syntax for Sentry](https://www.cloudera.com/documentation/enterprise/latest/topics/sg_hive_sql.html)

### Configure Sentry to recognize this account as an administrator
* Add your test user's primary  group to the `sentry.service.admin.group` list in CM
* Restart Sentry, Hue, Hive, and Impala services
    * It should not be necessary to restart HDFS or YARN

### Verify user privileges
* Authenticate your user as a Kerberos principal 
* Use `beeline` to confirm your principal sees no tables
    * `!connect jdbc:hive2://localhost:10000/default;principal=hive/fdqn@REALM.COM`
        * Replace `fqdn` with your host's fully-qualified domain name 
    * Use your Linux account/password to authenticate when prompted
    * Enter `SHOW TABLES;`
    * The statement should return an empty set because no authorizations are in place
* Copy the transcript of this section to `security/labs/sentry-test.md`

### Create a Sentry role with full authorization 
* In `beeline`:
    * `CREATE ROLE sentry_admin;`
    * `GRANT ALL ON SERVER server1 TO ROLE sentry_admin;`
    * `GRANT ROLE sentry_admin TO GROUP {your_primary};`
    * `SHOW TABLES;`
* The statement should now return all tables

### Create additional test users
* Add new users to all cluster nodes
    * `$ sudo groupadd selector`
    * `$ sudo groupadd inserters`
    * `$ sudo useradd -u 1100 -g selector george`
    * `$ sudo useradd -u 1200 -g inserters ferdinand`
    * `$ kadmin.local: add_principal george`
    * `$ kadmin.local: add_principal ferdinand`

### Create test roles
* Login to `beeline` as your admin user
    * `CREATE ROLE reads;`
    * `CREATE ROLE writes;`

### Grant read privilege for all tables to `reads`
* `GRANT SELECT ON DATABASE default TO ROLE reads;`
* `GRANT ROLE reads TO GROUP selector;`

### Grant read privilege for `default.sample07` only to 'writes':
* `REVOKE ALL ON DATABASE default FROM ROLE writes;`
* `GRANT SELECT ON default.sample_07 TO ROLE writes;`
* `GRANT ROLE writes TO GROUP inserters;`

### `kinit` as george, then login to beeline
* `kinit` as `george`, login to beeline, and use `SHOW TABLES;`
    * `george` should be able to see all tables
* Repeat the process as `ferdinand`
    * `ferdinand` should see `sample_07` 
* Add the transcripts of these sessions to `security/labs/sentry-test.md`
