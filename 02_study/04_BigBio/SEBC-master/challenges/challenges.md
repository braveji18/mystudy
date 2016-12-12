<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---
<div style="page-break-after: always;"></div>

# <center> Challenges - November 18, 2016 - Munich, Germany

* Overview
    * Build a CM-managed CDH cluster and secure it
* Place your work in the `challenges/labs` folder
    * All text files require  Markdown (`.md`) extension and formatting
    * All screenshots must be in PNG format
    * You will create your own files for the challenges
* You can consult with each other and research online
    * Submit only your own work!
* Update your GitHub repo often -- don't wait until the end!
* If you break your cluster, or your cluster breaks you:
    * Tell an instructor
    * Review the work you have pushed to GitHub
    * Create a new Issue to describe what you think happened

---
<div style="page-break-after: always;"></div>

## <center> Challenge Setup

* Create the Issue `Challenges Setup`
* Assign the Issue to yourself and label it `started`
* In the file `challenges/labs/0_setup.md`:
    * List the region, AMI ID, and OS you are using 
    * List the volume space you have available on each node
    * The command and output for `yum repolist enabled` 
* Add the following Linux accounts to all nodes
    * User `bavaria` with a UID of `2700`
    * User `saxony` with a UID of `2800`
    * Create the group `democratic` and add `saxony` to it
    * Create the group `social` and add `bavaria` to it
* List the `/etc/passwd` entries for `bavaria` and `saxony` in your setup file
* List the `/etc/group` entries for `democratic` and `social` in your setup file
* Push to your GitHub repo
* Label your Issue `submitted` 
* Assign the Issue to `mfernest` and `jqnik`

---
<div style="page-break-after: always;"></div>

## <center> Challenge 1: Install a MySQL server

* Create the Issue `Install MySQL`
* Assign the Issue to yourself and label it `started`
* Install MySQL 5.6.x server on one of your instances
    * Use the YUM repository from `dev.mysql.com`
    * Copy `/etc/yum.repos.d/mysql-community.repo` to `challenges/labs/1_mysql-community.repo.md`
* On all cluster nodes
    * Install the MySQL client package and the MySQL JDBC connector file.
* Start the `mysqld` service
* Delete the `test` database
* Create the following databases
    * `scm`
    * `rman`
    * `hive`
    * `oozie`
    * `hue`
    * `sentry`
* Add the following to the file `challenges/labs/1_mysql.md`
    * The command and output of `mysql --version`
    * The command and output for a list of databases in MySQL
    * The command and output for a list of grants in MySQL
* Push this work to your GitHub repo
* Label the Issue 'submitted` 
* Assign the issue to the instructors

---
<div style="page-break-after: always;"></div>

## <center> Challenge 2: Install Cloudera Manager

* Create the Issue `Install CM`
* Assign the Issue to yourself and label it `started`
* Install Cloudera Manager on a different node from MySQL
* Configure the CM repo to install the `5.7.4` release
    * List the command and output of `ls /etc/yum.repos.d` in `challenges/labs/2_cm.md`
    * Copy the `cloudera-manager.repo` file to `challenges/labs/2_cloudera-manager.repo.md`
* Configure Cloudera Manager
    * Grant `scm` access to your MySQL server _only_ from the CM node (no host wildcard)
    * Copy the `GRANT` statement you used into `challenges/labs/2_cm.md`
    * Copy your full `scm_prepare_database.sh` command and output into the same file
* Start the Cloudera Manager server
    * Copy the `db.properties` file to `challenges/labs/2_db.properties.md`
* Push to your GitHub repo and label the Issue 'submitted`
* Assign the issue to the instructors

---
<div style="page-break-after: always;"></div>

## <center> Challenge 3 - Install CDH

* Create the Issue `Install CDH`
* Assign the issue to yourself and label it `started`
* Install the latest CDH release allowed; deploy Coreset services only
* Create the file `challenges/labs/3_cm.md`
    * Copy the statement `SHOW GRANTS FOR <database>` and the output for each of `rman`, `hive`, and `scm` into the file
* Create user directories in HDFS for `bavaria` and `saxony`
* Add the following to `3_cm.md`:
    * Command and output for `hdfs dfs -ls /user`
    * The output from the CM API call `../api/v12/hosts` 
* Login to the Hue console and install the Hive sample data
    * Save a screenshot of the Hue home page into `challenges/labs/3_hue_installed.png`
* Push this work to your GitHub repo and label the Issue `submitted`
* Assign the issue to the instructors

---
<div style="page-break-after: always;"></div>

## <center> Challenge 4 - HDFS Testing

* Create the Issue `Test HDFS`
* Assign the issue to yourself and label it `started`
* As user `bavaria`, use `teragen` to generate a 51,200,000-record dataset into eight files
    * Set the block size to 16 MB
    * Name the target directory `tgen512m`
    * Use the `time` command to capture job duration
* Put the following in the file `challenges/labs/4_teragen.md`
    * The full `teragen` command 
    * The output of the `time` command
    * The command and output of `hdfs dfs -ls /user/bavaria/tgen512m`
    * Show how many blocks are linked to this directory
* Push this work to your GitHub repo and label the Issue `finished`
* Assign the issue to the instructor

---
<div style="page-break-after: always;"></div>

## <center> Challenge 5 - Kerberize the cluster

* Create the Issue `Kerberize cluster`
* Assign the issue to yourself and label it `started`
* Install an MIT KDC on the same node as MySQL
  * Name your realm after your GitHub handle in uppercase,
  * Use your favorite country code as a suffix
  * For example: `MFERNEST.IE`
* Create principals for `bavaria`, `saxony`, and `cloudera-scm`
  * Give `cloudera-scm` the privileges needed to create principals and keytabs
* Use Cloudera Manager to integrate Kerberos with the cluster
* Run the `terasort` program as `bavaria` using `/user/bavaria/tgen512m`
  * Copy the command and output to `challenges/labs/5_terasort.md`
* Run the Hadoop `pi` program as the user `saxony`
  * Copy the command and output to `challenges/labs/5_pi.md`
* Also submit:
  * All the text-based files in `/var/kerberos/krb5kdc/', renamed as follows:
    * A prefix of `5_` and extension `.md` to each file name
    * Example: `5_kdc.conf.md`
    * **Format** the contents accordingly
* Push this work to your GitHub repo and label the Issue `finished`
* Assign the issue to the instructors

---
<div style="page-break-after: always;"></div>

## <center> Challenge 6 - Upgrades 

* Create the Issue `Upgrade cluster`
* Assign the issue to yourself and label it `started`
* Upgrade to the latest available version of Cloudera Manager
  * Upgrade the agents
  * Use a CM API call to report the CM version
  * Copy the command and output into `6_cm_version.md`
* Upgrade to the latest available version of CDH
  * Capture the `Settings -> About` dialog to `6_cdh_version.md`
* Push this work to your GitHub repo and label the Issue `finished`
* Assign the issue to the instructors

---
<div style="page-break-after: always;"></div>

## <center> Once you finish, or when time is called:

* Commit any remaining changes in your repo and push them to GitHub
* Complete [this quick survey](https://docs.google.com/forms/d/e/1FAIpQLSfBUSFtEcVFzv_9bHwh9dG8ZHzmQk6wWNLFZAVUtdMd1sgZ6g/viewform)
* Write course feedback in `challenges/labs/7_feedback_final.md`.
Your challenges are not evaluated unless these questions are answered:
    * Describe the boot camp: was it useful, difficult, simple?
    * Which topic was least familiar to you? Which topic was most familiar?
    * Which topic did you feel was most helpful? Which topic was not useful, if any?
    * How long before you are ready to to install a production cluster by yourself? What do you need to work on?
* It has been a pleasure working with you this week! We hope your travel home is safe and comfortable.

---
<div style="page-break-after: always;"></div>
