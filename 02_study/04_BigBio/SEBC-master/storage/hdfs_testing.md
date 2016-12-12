<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---
<div style="page-break-after: always;"></div>

# <center> <a name="hdfs_section"/>HDFS<p>

* Cluster deployment guidelines
* HDFS Basics
    * <a href="#hdfs_namenode_ha">NameNode HA</a>
    * <a href="#hdfs_smoke_testing">Smoke-testing a cluster</a>
    * <a href="#hdfs_c5">HDFS & C5</a>    

---
<div style="page-break-after: always;"></div>

## <center>Notes on Service Deployment</center>

* [Practical advice on field deployment](http://blog.cloudera.com/blog/2015/01/how-to-deploy-apache-hadoop-clusters-like-a-boss/)
* Design principles for deployment
    * Separation of concerns (adminisration, end users, security integration)
    * Planning for growth
* Cloudera uses four role types to guide deployment
    * Utility: cluster administration, integration services
    * Master: executive and supervisory processes
    * Worker: storage and processing
    * Edge: Client access, ingestion, security perimeter

---
<div style="page-break-after: always;"></div>

## <center>Layout changes with node count 

* 10 nodes or fewer: combine master & worker roles, utility & edge roles
* 20-100 nodes: separate masters and workers, use dedicated utility & edge nodes
* 100+ nodes: add utility, master, and edge roles according to use case
* Once a machine is assigned to a role, adjust the resource requirements
    * Master: four disks, mirror the OS volume 
        * One disk for logging and other storage requirements
        * One disk for Zookeeper*
    * Worker: More disks and RAM 
    * Edge/Utility: VMs or older hardware can be sufficient

---
<div style="page-break-after: always;"></div>

## <center> <a name="hdfs_namenode_ha"/> NameNode HA

* CM 5 offers a [NameNode HA wizard](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Managing-Clusters/cm5mc_hdfs_hi_avail.html)
    * `HDFS -> Actions -> Enable High Availability`
    * [Locate the JournalNodes](http://www.cloudera.com/documentation/enterprise/latest/topics/cdh_hag_hdfs_ha_enabling.html#cmug_topic_5_12_1)
    * [Know what the Quorum Journal Manager and Zookeeper do] (https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-hdfs/HDFSHighAvailabilityWithQJM.html)

---
<div style="page-break-after: always;"></div>

## <center> <a name="hdfs_smoke_testing"/> HDFS Smoke Testing

* Following software installation, test hardware and network for failure
* [The terasort suite](http://www.michael-noll.com/blog/2011/04/09/smoke-testing-and-stress-testing-an-hadoop-cluster-with-terasort-testdfsio-nnbench-mrbench/#terasort-benchmark-suite) is ideal for this: easy to apply and simple to monitor.
    * Some people recommend [TestDFSIO, nnbench, mrbench](http://www.michael-noll.com/blog/2011/04/09/smoke-testing-and-stress-testing-an-hadoop-cluster-with-terasort-testdfsio-nnbench-mrbench/#testdfsio) -- you have choices.
* Most important: corroborate performance with system tools, such as `iostat`.

---
<div style="page-break-after: always;"></div>

## <center> <a name="hdfs_c5"/> C5 Goals for HDFS

Strategy for storage use cases in C5:

* Plan for systems with larger RAM complements
* Customers need faster, more comprehensive backup tools
* Customers want more data recovery options
* Customers want more (open source) client access options

---
<div style="page-break-after: always;"></div>

## <center> Key HDFS Features in C5

* <a href="#hdfs_dir_caching">Directory caching </a>
* <a href="#hdfs_dir_snapshots"> Directory snapshots </a>
* <a href="#nfs_gateway"> NFS Gateway</a>
* <a href="#hdfs_backups"/>Backups

---
<div style="page-break-after: always;"></div>

## <center> <a name="hdfs_dir_caching"/> Directory caching: Use case
### <center> Repeated joins on a small table (cache effect)

<img src="http://blog.cloudera.com/wp-content/uploads/2014/08/hdfs-cache-f1.jpg">

---
<div style="page-break-after: always;"></div>

## <center> Problem: Performance on Repeated Joins

* The NameNode links a file's path to block storage on the DataNodes
    * Locality is therefore defined by [disk storage](https://issues.apache.org/jira/browse/HDFS-4949)
    * This is sufficient for batch-processing architecture 
    * Job setup and data shuffling costs cancel out efficient NRT retrieval
* Consider repeated joins with a need for quick responses
    * A repeated query could go to another DataNode 
    * You'd like to prefer a node with in-memory 

---
<div style="page-break-after: always;"></div>

## <center> Solution: [HDFS Read Caching](http://blog.cloudera.com/blog/2014/08/new-in-cdh-5-1-hdfs-read-caching/)

Adds cache locality to NN reports<p>

* An admin can specify an HDFS file/directory to be 'cached'
    * Eviction policy is TTL-based
    * No hit ratio metrics
* DataNodes with associated blocks receive a cache-on-read instruction 
    * In-memory storage is off-heap: no heavy impact on DataNodes
    * The admin can also limit the number of replicas for caching
* Local clients, such as `impalad`, can read caches locally 
    * Short-circuit read (SCR) API
    * Zero-copy read (ZCR) API

---
<div style="page-break-after: always;"></div>

## <center> Directory caching: Implementation<p>

<center><img src="http://www.cloudera.com/documentation/enterprise/latest/images/caching.png" height="325" width="400"></center>

---
<div style="page-break-after: always;"></div>

## <center> Directory caching example

```
$ hadoop fs -put myfile /user/mfernest/commons
$ sudo -u hdfs hdfs cacheadmin -addPool mfe
Successfully added cache pool mfe.
$ sudo -u hdfs cacheadmin -addDirective -path /user/mfernest/commons  -pool mfe
Added cache directive 1
$ sleep 180
```
DataNodes track blocks and report cache state to the NameNode
```
$ hdfs cacheadmin -listPools -stats mfe
...
$ sudo -u hdfs hdfs dfsadmin -report
...
```

---
<div style="page-break-after: always;"></div>

## <center> Directory caching: Other notes

* [Caching documentation is here] (http://www.cloudera.com/documentation/enterprise/latest/topics/cdh_ig_hdfs_caching.html)
* We do have to balance memory demand for caching with other memory-based features
    * Impala users have ["NRT" expectations](http://stackoverflow.com/questions/5267231/what-is-the-definition-of-realtime-near-realtime-and-batch-give-examples-of-ea)
    * So do HBase and Search applications
    * We'll discuss this further with YARN and resource management

---     
<div style="page-break-after: always;"></div>

## <center> <a name="scr_and_zcr"/> Technical Notes on SCR and ZCR

* General advice: take time to map key upstream features to their [JIRAs] (https://issues.apache.org/jira)
* [Short-circuit Reads] (https://issues.apache.org/jira/browse/HDFS-2246)
    * Clients can examine a DataNode's process map to find cached blocks
    * Based on [file descriptor passing](http://poincare.matf.bg.ac.rs/~ivana/courses/tos/sistemi_knjige/pomocno/apue/APUE/0201433079/ch17lev1sec4.html), AKA short-circuit reads.
    * [Enabled in CM by default](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/admin_hdfs_short_circuit_reads.html)
* There is also zero-copy Read
    * [Uses `mmap()` to read system page$](https://issues.apache.org/jira/browse/HDFS-4953)
    * Clients can implement the [API](https://issues.apache.org/jira/browse/HDFS-5191)
* Upstream JIRAs 
    * Write caching: [HDFS-5851](https://issues.apache.org/jira/browse/HDFS-5851)

---    
<div style="page-break-after: always;"></div>

## <center> <a name="hdfs_dir_snapshots"/> HDFS Snapshots

* Users with write permissions on a directory may retrieve a deleted file
    * Track changes to a directory over time
    * Execute backup on an static image
    * A [copy-on-write](http://en.wikipedia.org/wiki/Copy-on-write) technique to associate each DN block with a timestamp
    * Recover deleted files from a versioned folder
    * Like `.Trash` folder but without an automatic purge
* [Apache docs on the CLI](http://archive.cloudera.com/cdh5/cdh/5/hadoop/hadoop-project-dist/hadoop-hdfs/HdfsSnapshots.html)
* [Using Cloudera Manager] (http://www.cloudera.com/documentation/enterprise/latest/topics/cm_bdr_snapshot_intro.html) requires an active trial or Enterprise license

---
<div style="page-break-after: always;"></div>

## <center> <a name="hdfs_backups"/> HDFS Backups

* Cloudera Manager offers BDR (Backup and Data Recovery) under license
* Coordinated service for backups, snapshots, and replications
    * Configuration, monitoring, alerting services
    * Executes `distCp` jobs under the covers
    * Also preserves file attributes and service metadata such as HMS

---
<div style="page-break-after: always;"></div>

### <center>HDFS Labs Overview

* Create an Issue called `Storage labs`
    * Add it to the Lab milestone
    * Label the issue as `started`
    * Assign yourself to the Issue
* These labs will have you:
    * Replicate data to another cluster
    * Use `teragen` and `terasort` to benchmark performance
    * Test HDFS Snapshots
    * Enable NameNode HA configuration

---
<div style="page-break-after: always;"></div>

## <center> HDFS Lab: Replicate to another cluster

Node: Data replication in the cloud depends on peers that can see each
other's nodes.

* Choose a partner in class
* Name a source directory after your GitHub handle
* Name a target directory after your partner's GitHub handle
* Use `teragen` to create a 500 MB file
* Copy your partner's file to your target directory 
    * Let one partner use `distCp` on the command line
    * Let the other use BDR
* Browse the results 
    * Use `hdfs fsck <path> -files -blocks` on your source and target directories
    * Copy the work for this lab into `storage/labs/0_replication.md`

---
<div style="page-break-after: always;"></div>

## <center> HDFS Lab: Test HDFS performance

* Create an end-user Linux account named with your GitHub handle
    * Create a home HDFS directory for this user as well
    * Run the following exercises as this user
* Create a 10 GB file using `teragen`
    * Set the number of mappers to four
    * Limit the block size to 32 MB 
    * Land the result under your user's home directory
    * Use the `time` command to report the job's duration
* Run the `terasort` command on this file 
    * Use the `time` command to report the job's duration
    * Land the result under your user's home directory
* Report your work in `storage/labs/1_terasort_tests.md`, including:
    * The full `teragen` and `terasort` commands you used 
    * The `time` result of each job 

---
<div style="page-break-after: always;"></div>

## <center> HDFS Lab: Test HDFS Snapshots

List the commands and output for each step below in `storage/labs/2_snapshot_test.md`.

* Create a `precious` directory in HDFS; copy the ZIP course file into it.
* Enable snapshots for `precious`
* Create a snapshot called `sebc-hdfs-test`
* Delete the directory
* Delete the ZIP file
* Restore the deleted file 

* Capture the NameNode web UI screen that lists snapshots in `storage/labs/2_snapshot_list.png`.

---
<div style="page-break-after: always;"></div>

## <center> HDFS Lab: Enable HDFS HA

* Use the Cloudera Manager wizard to enable HA
    * Once configured, get a screenshot of the HDFS Instances tab
        * Name the file `storage/3_HDFS_HA.png`
* Add a CM user and name it with your GitHub handle
    * Assign the `Full Administrator` role to this user
    * Assign the password `cloudera` to this user
    * Re-assign the `admin` user to the `Limited Operator` role
    * Take a screenshot of your users page; save it to `storage/labs/4_CM_users.png`
    * In an Issue comment, post the URL to your Cloudera Manager instance
