<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

# <center> <a name="cdh_security_section"/>CDH Security

* <a href="#security_review">Quick basics overview</a>
* <a href="#security_authentication">Strong Authentication</a>
* <a href="#security_authorization">Better Authorization</a>
* <a href="#security_encryption">Encryption</a>
* <a href="#security_visibility">Auditing &amp; Visibility</a>
* <a href="#security_cm_configuration">CM-based Configuration</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="security_review">Quick basics overview</a>

* **Perimeter**
    * Strong authentication
    * Network isolation, edge nodes
    * Firewalls, iptables
* **Access**
    * Authorization controls
    * Granular access to HDFS files, Hive/Impala objects
* **Data**
    * Encryption-at-rest
    * Encryption-in-transit
      * Transport Layer Security (TLS)
* **Visibility**
    * Auditing data practices without exposing content
    * Separation of concerns: storage management vs. data stewardship

---
<div style="page-break-after: always;"></div>

## <center> <a name="security_authentication"/>Strong Authentication: Kerberos</a>

* The Apache document ["Hadoop in Secure Mode"](http://hadoop.apache.org/docs/r2.6.0/hadoop-project-dist/hadoop-common/SecureMode.html) lists four needs for strong authentication:
    * Hadoop users
    * Hadoop services
    * HTTP-based consoles
    * Protecting data in-flight
* Linux supports [MIT Kerberos](http://web.mit.edu/kerberos/) natively
* Kerberos is the only authentication model Hadoop supports
    * In-transit encryption service hooks are available
    * Browser authentication supported by [HTTP SPNEGO](http://en.wikipedia.org/wiki/SPNEGO)
* LDAP/Active Directory integration is supported
    * Applying existing user databases to Hadoop cluster is a common ask
* [ELI5: Kerberos](http://www.roguelynn.com/words/explain-like-im-5-kerberos/): Great introduction / refresher to Kerberos concepts.        

---
<div style="page-break-after: always;"></div>

## <center> Active Directory Integration </center>

* Cloudera PS recommends Direct-to-AD integration as preferred practice.
* The alternative: a [one-way cross-realm trust to AD](http://www.cloudera.com/documentation/enterprise/latest/topics/cdh_sg_hadoop_security_active_directory_integrate.html)
    * Requires an MIT Kerberos implementation for the cluster
    * Localizes creation of service principals and keytabs
* Common sticking points
    * Administrator reluctance
    * Version / feature incompatibility
    * AD configurations that shouldn't be a problem

---
<div style="page-break-after: always;"></div>

## <center> Common Direct-to-AD Issues </center>

* Incorrect `/etc/krb5.conf` configuration
    * Test with `kinit` before integrating
* Required encryption types aren't supported
    * Again, make sure `/etc/krb5.conf` is right
    * Verify Unlimited Encryption Strength is enabled
* To get debug information on the command line:
    * `export KRB5_TRACE=/dev/stderr`
    * `export HADOOP_OPTS="-Dsun.security.krb5.debug=true"`
    * `export HADOOP_ROOT_LOGGER="DEBUG,console"`

---
<div style="page-break-after: always;"></div>

## <center> <a name="security_authorization">Fine-grained Authorization</a>

* <a href="#hdfs_perms_acls">HDFS permissions & ACLs</a>
    * File permissions for user-group-world may be too simple
    * You must support a list of groups, not just one
* [Apache Sentry (incubating)](https://sentry.incubator.apache.org/)
    * Protects data objects (`server, database, table, URI`) that are projected onto file content
    * Maps Linux/LDAP groups to roles that are configured with access privileges

---
<div style="page-break-after: always;"></div>

## <center> <a name="hdfs_perms_acls"/>[HDFS Permissions](http://hadoop.apache.org/docs/r2.6.0/hadoop-project-dist/hadoop-hdfs/HdfsPermissionsGuide.html) </center>

* HDFS permissions are mostly POSIX
    * Remember that `hdfs` is the HDFS superuser, not `root`
    * Execution bit on directories is a sticky bit
    * Apply to Linux user or short-name Kerberos principal
* [POSIX-style ACLs are supported](http://hadoop.apache.org/docs/r2.6.0/hadoop-project-dist/hadoop-hdfs/HdfsPermissionsGuide.html#ACLs_Access_Control_Lists)
    * But disabled by default (`dfs.namenode.acls.enabled`)
    * You can add permissions for users, groups, other, and apply a default _mask_
        * `chmod` operates on mask to calculate effective permissions
    * ACLs are best used to refine -- not replace -- file permissions
        * There is a measurable cost to storing and processing them

---
<div style="page-break-after: always;"></div>

## <center> [Apache Sentry Basics](http://blog.cloudera.com/blog/2013/07/with-sentry-cloudera-fills-hadoops-enterprise-security-gap/) </center>

* Originally a Cloudera project, now an [Apache-governed project](http://sentry.apache.org/)
    * Documentation not fully migrated to ASF
* Supports authorization for database objects
    * Objects: server, database, table, view, URI
    * Authorization privileges: `SELECT`, `INSERT`, `ALL`
* Sentry policies defines a role with privileges to an object
  * Ex. `GRANT SELECT ON default.table_07 TO ROLE analyst;`  
  * You can then assign a group (LDAP or Linux) to that role
  * `GRANT ROLE analyst to GROUP bi_team;`
  * Add or remove users in the group at any time
* Sentry can be enforced for Hive, Impala and/or Search
  * HiveServer2 is wired for Sentry
  * Search has a legacy form of implementation

---
<div style="page-break-after: always;"></div>

## <center> Sentry Design </center>

### <center> Graphic overview</center>

<center><img src="http://blog.cloudera.com/wp-content/uploads/2013/07/Untitled.png"></center>

---
<div style="page-break-after: always;"></div>

## <center> Sentry Design Notes

* Each service binds to a policy engine
  * `impalad` and `HiveServer2` have separate hooks
  * Cloudera Search uses `policy.ini` files
* Initial Sentry behavior: all access is denied
  * Rules are exceptions to default behavior
* Next step: synchronizing Sentry & HDFS
    * Goal: automate writing ACLs for grants and revocations
* A fully-formed [config example is here](http://www.cloudera.com/documentation/enterprise/latest/topics/cdh_sg_sentry.html#concept_iw1_5dp_wk_unique_1)
* You can also watch a short [video overview here](http://vimeo.com/79936560)

---
<div style="page-break-after: always;"></div>

## <center> Sentry and [HiveServer2](http://www.cloudera.com/documentation/enterprise/latest/topics/cdh_ig_hiveserver2_configure.html)

<center><img src="https://blogs.apache.org/sentry/mediaresource/1554e24d-1365-4feb-9d0d-5832ecb90628"></center>

---
<div style="page-break-after: always;"></div>

## <center> [The Sentry Service](http://www.cloudera.com/documentation/enterprise/latest/topics/cm_sg_sentry_service.html)

* Introduced in C5.1
* Uses database storage
* CDH had tools for migrating file-based authorizations to the database
    * `sentry --command config-tool --policyIni *policy_file* --import`
* Impala & Hive can use the db or policy files
* Cloudera Search can only use policy files

---
<div style="page-break-after: always;"></div>

## <center> <a name="security_encryption">In-flight Encryption </a></center>

* How-to is [documented here](http://blog.cloudera.com/blog/2013/03/how-to-set-up-a-hadoop-cluster-with-network-encryption/)
* Supports communication between web services (HTTPS)
* Uses `X.509` certificates for verifying server identity
* Can encrypt block data in transit, but it's expensive
  * See `dfs.encrypt.data.transfer` property
* Support for RPC data out of the box
* Available support for:
  * MR shuffling
  * HTTP-based UIs
  * NameNode data and `fsimage` transfers

---
<div style="page-break-after: always;"></div>

## <center>At-rest encryption</center>

* Must be transparent to Hadoop clients and services
  * Requires creation of an _encryption zone_
  * Each file is encrypted using a Data Encryption Key (DEK)
* HDFS Transparent Data Encryption
  * Physically separating key storage and data storage offers maximum protection
  * Imagine someone gets hold of a decommissioned DataNode
  * Key Trustee (KTS) & Key Management Server (KMS) provide off-cluster storage
* Navigator Encrypt supports Linux volume or file encryption

---
<div style="page-break-after: always;"></div>

## <center> <a name="security_visibility">Auditing &amp; Visibility</a></center>

* Provided by Cloudera Navigator
* Used to audit data access (filesystem, databases, log of queries run)
* Customizable reports for compliance checking
  * Example: list all failed access attempts each month
* Supports redaction of sensitive fields

---
<div style="page-break-after: always;"></div>

## <center> <a name="security_cm_configuration">Preparing a Kerberos Configuration</a>

* Know the [network ports that CDH and third-party software use](http://www.cloudera.com/documentation/enterprise/latest/topics/cdh_ig_ports_cdh5.html)
* Set up a dedicated Kerberos Domain Controller
* KRB5 MIT [instructions are here](http://web.mit.edu/Kerberos/krb5-1.8/krb5-1.8.6/doc/krb5-install.html#Realm-Configuration-Decisions)
* Cloudera [slightly higher-level instructions are here](https://www.cloudera.com/documentation/enterprise/latest/topics/cm_sg_intro_kerb.html)
* Or you can use [RedHat's documentation](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Managing_Smart_Cards/installing-kerberos.html)

---
<div style="page-break-after: always;"></div>

## <center>Potential problems</center>

* Does your KDC allows *renewable tickets*?
  * The default in Linux varies with the distribution. See [RHEL docs](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Deployment_Guide/Configuring_Domains-Setting_up_Kerberos_Authentication.html).
  * Add configuration for renewable tickets **before** you initialize the Kerberos database.
  * If you do it after starting the database, you can hack it by:
    1. Changing the `maxlife` for all principals using the `modprinc` command in `kadmin.local`, or
    2. Trash your KDB and make a new one
* Your Cloudera Manager user (`cloudera-scm`) will need administrative privileges to generate a principal for each Hadoop service.

---
<div style="page-break-after: always;"></div>

## <center>Common misconceptions</center>

* Your Kerberos realm name depends on your FQDN (it doesn't)
* Kerberos realm names are resolved by DNS (they aren't)
* The `/admin` suffix has admin privileges
    * Only if you define them in `/var/kerberos/krb5kdc/kadm5.acl`

---
<div style="page-break-after: always;"></div>

## <center> Security Lab: Implement TLS Level 1 Security

* This is a [straightforward procedure](http://www.cloudera.com/documentation/enterprise/latest/topics/cm_sg_tls_browser.html#xd_583c10bfdbd326ba-7dae4aa6-147c30d0933--7a61)
    * You will not need certificates for TLS Level 1
    * You do need a keystore to generate session keys 
* Copy the `config.ini` file of the agent on any host to `security/labs/config.ini.md`
    * Code-format the contents
* Use a screen capture of CM to show TLS level 1 is enabled
    * Put the capture in `security/labs/tls-level-one.png`

---
<div style="page-break-after: always;"></div>

## <center> Security Labs Preparation

Before you start:

* Create a Linux user named after your GitHub handle
    * You'll use this account to test access to the cluster
    * Make sure this account is present on all nodes with the same UID/GID
* Load sample data for Hive/Impala
    * Login to HUE using your GitHub name and the password `cloudera`
    * The first login to Hue becomes the admin account 
* Follow the setup wizard to load sample tables for Hive and Impala
    * You'll need this data to support the Sentry lab

---
<div style="page-break-after: always;"></div>

## <center> Lab: Integrating Kerberos with Cloudera Manager

* Plan one: follow the [documentation here](http://www.cloudera.com/documentation/enterprise/latest/topics/cm_sg_s4_kerb_wizard.html)
* Plan two: Launch the Kerberos wizard and complete the checklist.
    * Set up an MIT KDC
* Once integration is sucessful, add these files to `security/labs`:
    * `/etc/krb5.conf` as `krb5.conf.md`
    * `/var/kerberos/krb5kdc/kdc.conf` as `kfc.conf.md`
    * `/var/kerberos/krb5kdc/kadm5.acl` as `kadm5.acl.md`
* Create a file `kinit.md` that includes:
    * The `kinit` command you use to authenticate your test user
    * The output from a `klist` command listing your credentials and ticket lifetime

---
<div style="page-break-after: always;"></div>

## <center> Sentry Lab 

* Install [Sentry as a Service](http://www.cloudera.com/documentation/enterprise/latest/topics/sg_sentry_service_config.html)
* Follow this [Sentry tutorial](./quick-sentry-tutorial.md)

