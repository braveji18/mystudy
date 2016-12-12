<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---

## <center> <a name="cm_cdh_installation_section"/>Cloudera Manager & CDH Installation

* <a href="#install_methods">Installation Methods</a>
* <a href="#parcels">Understanding Parcels</a>
* <a href="#db_setup">Embedded vs. external database</a>
* <a href="#cm_cdh_key_points">Supplemental CM/CDH Points</a>
* <a href="#cm_ui_overview">Cloudera Manager UI Overview</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="install_methods"/> CM/CDH Installation

* We use Cloudera  Manager to:
    * Monitor host status (via an agent process)
    * Create clusters, deploy services
    * Modify service configurations
    * Expedite complex tasks, such as:
        * Setting up NameNode & ResourceManager HA
        * Integrating Kerberos/LDAP resources
        * Enabling HDFS Encryption

---
<div style="page-break-after: always;"></div>

## <center> Cloudera Manager architecture

The Cloudera Manager server supports
    * Administrative access
    * Package repository links
    * Management Service: enterprise services & logging
        * Requires RDBMS for Reports, Navigator services 
    * Remote node monitoring

<center> <img src="http://www.cloudera.com/content/cloudera/en/documentation/core/latest/images/cm_arch.png"> </center>

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_install_paths"/>Installation paths

* [Path A: One-stop binary installer](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_install_path_a.html)
    * Useful for short-term, throwaway projects
    * Relies on embedded, hard-configured PostgreSQL server
* [Path B: Install CM and database manually](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_install_path_b.html)
    * Any cluster standing for more than 3-6 months
    * Can use Oracle, MySQL, MariaDB, or PostgreSQL server
    * Can deploy CDH as Linux packages or [parcels](http://www.cloudera.com/documentation/enterprise/latest/topics/cm_ig_parcels.html)
* [Path C: Tarballs](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_install_path_c.html)
    * DIY-oriented
    * Useful with other deployment tools (Chef, Puppet)

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_ui_overview"/>For future reference: Path A Install Screen

<center> <img src="png/CM5_Installer_Screen.png"/>

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_install_logging"/>Installation Milestones with Path A []()

* Quits if SELinux is enabled 
* Installs YUM repos for [CM packages:](http://archive.cloudera.com/cm5/redhat/5/x86_64/cm/5/RPMS/x86_64/)
   * Postgres server (dedicated version)
   * Oracle JDK
   * Cloudera Manager server and agents 
* Installs the packages
* Creates a cluster, deploys services on designated hosts
  * "Smart" configuration is done for you

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_install_milestones"/> Installation Checkpoints with Path B []()

* Careful review of hardware, OS, disk, and network/kernel settings
* Install supported Oracle JDK
* Install/configure [database server](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_installing_configuring_dbs.html?scroll=cmig_topic_5_2_unique_1#cmig_topic_5_1_unique_1)
  * Configure server to customer requirements
* Create databases, connect the CM server to them
    * Accessing MySQL requires a JDBC connector
* CM will then
  * Distribute agent software
  * Distribute CDH software
  * Deploy and activate CDH services<p>

---
<div style="page-break-after: always;"></div>

## <center> <a name="parcels"/> Installing CDH with Parcels

Parcels are [CM-specific code blobs](https://github.com/cloudera/cm_ext/wiki/Parcels:-What-and-Why%3F)

* All CDH components in one distribution
    * There are standalone parcels for some components
    * CM maintains a configurable list of parcels locations
* Simpler to manage than Linux packages
    * Default installation path: <code>/opt/cloudera/parcels</code>
    * Easy to create local parcel server
* Most service components bind to CM through a [custom service descriptor](https://github.com/cloudera/cm_ext/wiki/CSD-Overview)
* A parcel is a tarball with [some basic manifest and layout rules](https://github.com/cloudera/cm_ext/wiki/Building-a-parcel)
    * Contents are listed in <code>meta/parcel.json</code>
    * CM verifies a parcel's signature via a <code>manifest.json</code>
        * This file remains on the repo server
        * Parcel files are OS-specific

---
<div style="page-break-after: always;"></div>

## <center> Parcel Lifecycle</p>

<center> <img src="http://blog.cloudera.com/wp-content/uploads/2013/05/parcels1.png"> </center>

* [How to manage parcels](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Installation-Guide/cm5ig_parcels.html)

---
<div style="page-break-after: always;"></div>

## <center> Parcels Lifecycle

* Lifecycle actions
    * Download
    * Distribute
    * Activate/deactivate
    * Remove
    * Delete<p/>
* The path <code>/opt/cloudera/parcels/CDH</code> points to the active parcel's directory

---
<div style="page-break-after: always;"></div>

## <center> <a name="db_setup"/>Configuring the database server

* <a href="#cm_service_dbs">CM & CDH services that need a database</a>
* <a href="#cm_replicate_db">Protecting databases against failure </a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_service_dbs"/>[Databases and Other Stores](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_installing_configuring_dbs.html)

* Management Services (one per CM server)
    * Reports Manager
    * Navigator Audit & Metadata Servers (not discussed)
    * Host and Service Monitors use [LevelDB](https://github.com/google/leveldb) implementations
* CDH Services (one per cluster)
    * Hive Metastore
    * Sentry
    * [Oozie](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_mc_oozie_service.html#cmig_topic_14_unique_1)
    * [Hue](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_mc_hue_service.html#cmig_topic_15_unique_1)
    * [Sqoop Server](http://www.cloudera.com/documentation/enterprise/5-6-x/topics/install_sqoop_ext_db.html#concept_y53_jyf_4r) (not discussed)

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_replicate_db"/> MySQL Replication for HA </a></p>

* [Configuring CM for HA](https://www.cloudera.com/documentation/enterprise/latest/topics/admin_cm_ha_overview.html#concept_bhl_cvc_pr) requires:
  * A load balancer
  * Highly-available networked storage
  * Highly-available database server
  * Supported Heartbeat Demon software

* For today's labs, we'll just [add a MySQL replica server](http://dev.mysql.com/doc/refman/5.5/en/replication-howto.html)

---
<div style="page-break-after: always;"></div>

## <center> CM Install Labs - *Before* You Start

* [Follow these instructions](../README.md) to configure Issues in your GitHub repo
    * In the Settings tab, enable the Issues feature
    * Add your instructors as Collaborators 
* Submit your work in Markdown files for text or PNG files for screen captures
    * Please use code formatting for machine output
* Create an Issue in your repo called `Installation Lab`
     * Add it to the `Labs` milestone
     * Assign the label `started`
* Use this Issue to track your lab progress
    * Use comments to note each section you finish
    * You can also log problems/fails you encounter
    * Tell us how you fixed it, too

---
<div style="page-break-after: always;"></div>

## <center> CM Install Lab

* Use the same AWS region and Availability Zone as your neighbors
* Create five `m3.xlarge` nodes
  * Do not use spot instances
  * **Learn how to increase your volume space** The AWS default 8 GB.
* For GCE, create five `n1-highmen-2` nodes
  * Do not use preemptible instances
* Make sure your AMI uses a [<strong>Cloudera-supported OS</strong>](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_cm_requirements.html)
* Use one instance for the Cloudera Manager server and 'edge' CDH services
  * Edge services include Hue and Oozie

---
<div style="page-break-after: always;"></div>

## <center> CM Install Labs - Path B Installation Overview

* List your node names & IP addresses in `installation/0_nodeIPs.md`
* Document your system checks in `installation/1_preinstall.md`
* Install a MySQL server and replica
* Install Cloudera Manager
  * CM provides an installation wizard for CDH
* <a href="#parcels_repo_lab">Bonus: create a Parcels repository</a>

---
<div style="page-break-after: always;"></div>

## <center> CM Install Lab
## <center> <a name="linux_config_lab"/>System Configuration Checks

Before a professional services engagement, Cloudera sends the
customer a questionnaire to verify hardware, networking, OS
configuration, disk mounts, and other properties.

Using the steps below, verify the settings of your instances. If
necessary, modify them according to the instruction. In your
documentation, show the commands used to observe each property. If
you change it, list also the command you used to do so.

Capture this work in the file `installation/1_preinstall.md`. You
only need to show results for one host.

1. Check `vm.swappiness` on all your nodes
    * Set the value to `1` if necessary
2. Show the mount attributes of all volumes
3. Show the reserve space of any non-root, ext-based volumes
4. Show that transparent hugepages is disabled
4. Report the network interface attributes
5. Show forward and reverse host lookups using `getent` and `nslookup`
6. Verify the <code>nscd</code> service is running
7. Verify the <code>ntpd</code> service is running<br>

---
<div style="page-break-after: always;"></div>

## <center> MySQL/MariaDB Installation Lab
## <center> <a name="mysql_replication_lab"/>Configure MySQL with a replica server

Choose one of these plans to follow:

* You can use the steps [documented here for
MariaDB](http://www.cloudera.com/documentation/enterprise/latest/topics/install_cm_mariadb.html)
or [here for MySQL](http://www.cloudera.com/documentation/enterprise/latest/topics/cm_ig_mysql.html).<br>
* The steps below are MySQL-specific.
  *  If you have chosen RHEL/CentOS 7.x, use MariaDB instead.

---
<div style="page-break-after: always;"></div>

## <center> MySQL installation - Plan Two Detail

1. Download MySQL 5.5
    * Use the repo [supported by MySQL](http://dev.mysql.com/downloads/repo/yum/).
    * Install the <code>mysql</code> package on all nodes
    * Install <code>mysql-server</code> on the server and replica nodes
    * Download and copy [the JDBC connector](https://dev.mysql.com/doc/connector-j/5.1/en/connector-j-binary-installation.html) to all nodes. 
2. You should not need to edit your <code>/etc/my.cnf</code> file
    * Consult your MySQL documentation for enabling replication.<p>
3. Start the <code>mysqld</code> service.
4. Use <code>/usr/bin/mysql_secure_installation</code> to:<br>
    a. Set password protection for the server<br>
    b. Revoke permissions for anonymous users<br>
    c. Permit remote privileged login<br>
    d. Remove test databases<br>
    e. Refresh privileges in memory<br>
    f. Refreshes the <code>mysqld</code> service<p>
5. On the master MySQL node, grant replication privileges for your replica node:<br>
    a. Log in with <code>mysql -u ... -p</code> <br>
    b. Note the FQDN of your replica host.<br>
    c. <code>mysql> **GRANT REPLICATION SLAVE ON \*.\* TO '*user*'@'*FQDN*' IDENTIFIED BY '*password*';**</code><br>
    d. <code>mysql> **SET GLOBAL binlog_format = 'ROW';** </code><br>
    e. <code>mysql> **FLUSH TABLES WITH READ LOCK;</code>**<p>
6. In a second terminal session, log into the MySQL master and show its  status:<br>
    a. <code>mysql> **SHOW MASTER STATUS;**</code><br>
    b. Make note of the file name and byte offset. The replica needs this info to sync to the master.<br>
    c. Logout of the second session; remove the lock on the first with <code>mysql> **UNLOCK TABLES;**</code><p>
7. Login to the replica server and configure a connection to the master:<br>
    <code>mysql> **CHANGE MASTER TO**<br> **MASTER_HOST='*master host*',**<br> **MASTER_USER='*replica user*',**<br> **MASTER_PASSWORD='*replica password*',**<br> **MASTER_LOG_FILE='*master file name*',**<br> **MASTER_LOG_POS=*master file offset*;**</code><p>
8. Initiate slave operations on the replica<br>
    a. <code>mysql> **START SLAVE;**</code><br>
    b. <code>mysql> **SHOW SLAVE STATUS \G**</code><br>
    c. If successful, the <code>Slave_IO_State</code> field will read <code>Waiting for master to send event</code><br>
    d. Once successful, capture this output and store it in <code>installation/2_replica_working.md</code><br>
    e. Review your log (<code>/var/log/mysqld.log</code>) for errors. If stuck, consult with a colleague or instructor.<p>

---
<div style="page-break-after: always;"></div>

## <center> CM/CDH Install Lab
## <center> Path B install using Cloudera 5.8.2

[The full rundown is
here](http://www.cloudera.com/documentation/enterprise/5-8-x/topics/cm_ig_install_path_b.html#concept_qyv_bt1_v5)

Notice that you must locate the correct repo version. The default
repo is the latest available version.

Ensure you adhere to the following requirements:

* Do not use Single User Mode. Do not. Don't do it.
* Use only Cloudera's standard repositories
* Ignore all steps in the CM that are marked `(Optional)`
* Install the Data Hub Edition
* Install CDH using parcels
* **Rename your cluster after your GitHub name**
* Deploy  **only** the `Coreset` of CDH services.
* Deploy three ZooKeeper instances.
    * CM prompts you to install one by default
* Once you've renamed your cluster and it is healthy, take a screenshot of the home page
    * Name the file `installation/3_cm_installed.png`.
* Mark your Issue 'submitted' now if your're done; otherwise wait
until you complete the Bonus Lab.

---
<div style="page-break-after: always;"></div>

## <center> Cluster install: Bonus Lab
## <center> <a name="parcels_repo_lab"/>Create a local parcel repo (manual)

* Click the parcel icon in CM's navigation bar
    * Note the `Remote Parcel Repository URL` value(s)
* The default parcel links include:
    * [Latest CDH5 release](http://archive.cloudera.com/cdh5/parcels/latest)
    * [Latest CDH4 release](http://archive.cloudera.com/cdh4/parcels/latest)
    * Standalone components, such as Accumulo and Kafka
* Follow the [documentation](http://www.cloudera.com/documentation/enterprise/latest/topics/cm_ig_create_local_parcel_repo.html)
* Set the local repository URL in Cloudera Manager
* Capture this setting in a screenshot and save it to `installation/4_local_repo.png`
* Mark your Issue `submitted`

---
<div style="page-break-after: always;"></div>

## <center> Cluster install: For Further Reading
## <center> <a name="scripted_install_lab"/>Auto-deployment

* If you are interested to learn about automating installs:
    * Fork/clone [Justin Hayes' auto-deploy project](https://github.com/justinhayes/cm_api/tree/master/python/examples/auto-deploy)
* No submissions are needed; you can browse this repository as you wish.

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_cdh_key_points"/> Summary Points

* See the graphic of install paths in the `tools/` subdirectory.
* You can review a full CM HA [configuration here](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/admin_cm_ha_overview.html)
* CDH operation does **not** depend on the Cloudera Manager server being operable
* CM supports a REST API
    * Each API version is a superset of all prior versions
    * Try `http://<i>your_cm_host</i>:7180/api/version` in your browser
    * Some endpoints aren't available for CM 4.x deployments
        * The CM API [is documented here](http://cloudera.github.io/cm_api/)
