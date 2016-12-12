<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---
<div style="page-break-after: always;"></div>

# <center> <a name="yarn_rm_section"/>Resource Management & YARN

* <a href="#mrv2_review">YARN/MRv2 Design</a>
* <a href="#YARN_overview">What YARN Does</a>
* <a href="#migrating_mrv1_mrv2">Migrating from MRv1 to YARN</a>
* <a href="#RM_overview">Resource Management Overview</a>

---
<div style="page-break-after:always;"></div>

## <center> The MapReduce service (MRv1)

* JobTracker responsibilities
    * Schedule jobs
    * Monitor TaskTracker processes
    * Update jobs status
    * Cache and serve recent job history
* TaskTracker responsbilities
    * Provide a pre-determined number of mapper and reducer slots
    * Slots are child JVM processes
    * Slot count per node is based on cores, "spindles", and <i>workload estimate</i>

---
<div style="page-break-after: always;"></div>

## <center> <a name="mrv2_review"/> YARN/MRv2: Design

### <center> Graphic overview

<center><img src="http://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/yarn_architecture.gif"></center>

---
<div style="page-break-after: always;"></div>

## <center> YARN (MRv2 included): Roles

* Resource Manager
  * Supervises NodeManagers, schedules jobs
  * Limits resource consumption across all running jobs
  * UI on port 8088
* Node Manager
  * Launches/manages containers
  * Updates the Resource Manager
  * UI on port 8042
* Container
  * Execution context for a job
  * Unlike a slot, can be sized per job
* Application Master
  * Control one job's tasks and resource requirements
    * MapReduce: <code>org.apache.hadoop.mapreduce.v2.app.MRAppMaster</code>
    * Spark: <code>org.apache.spark.deploy.yarn.applicationmaster</code>
* JobHistory Server (built in, MapReduce only)
  * UI port on 19888
  * Spark has its own (UI port on 18088)

---
<div style="page-break-after: always;"></div>

## <center> YARN Job Control

1. Client submits a job
2. RM identifies the appropriate AM and loads it
3. AM requests data blocks via the NameNode
4. AM requests container/executor resources via the RM
5. RM reports available resources
6. AM asks NodeManagers for resources using RM access token
9. AM releases each container upon task completion, notifies the RM
10. RM updates the Job History server

---
<div style="page-break-after: always;"></div>

## <center>YARN vs. MRv1 or Spark Standalone</center>

* Better resource scalability and utilization
  * Especially for very large clusters
* Better performance for certain, well-known use cases
  * E.g., a large multitenant cluster running many small jobs
  * Isolating resources for multiple engines
  * Centralized logging
* The Original Vision: one RM to cover all processing requirements
  * RM HA is available
* Multiple mutli-tenant models possible
  * Node labeling: assigning specific tasks to specific hardware
  * Custom, pluggable classifiers for auditing and reporting

---
<div style="page-break-after: always;"></div>

## <center> <a name="migrating_mrv1_mrv2"/> Migrating MRv1-oriented applications to MRv2

* YARN is backward-compatible to MapReduce
  * Doesn't mean MRv1 programs are YARN-aware
* Read <a href="http://blog.cloudera.com/blog/2014/04/apache-hadoop-yarn-avoiding-6-time-consuming-gotchas/">Jeff Bean's blog post on common gotchas</a>, including:
    * Containers are not a drop-in replacement for slots
    * Hard to make an [apples-to-apples performance comparison] (http://blog.cloudera.com/blog/2014/02/getting-mapreduce-2-up-to-speed/)
    * JVM heap calculations are different
    * The RM has one log for all process engines, not just MRv2
        * Messages are more generic

---
<div style="page-break-after: always;"></div>

## <center> <a name="RM_overview"/>Resource Management for the Cluster

<p><i>Managing resources cluster-wide is divided into three areas</i></p>

1. <a href="#rm_service_isolation">Service-level isolation</a>
    * Sets minimum resources for all cluster services, including YARN
    * E.g., HDFS, HBase, Impala, Search, MRv1
2. <a href="#admission_control">Admission Control for Impala</a>
    * Resource priority based on request, service type
    * Prevent memory overruns
3. <a href="#dynamic_prioritization">Dynamic Resource Pools for YARN</a>
    * Weight resources among pools by scheduling rules

---
<div style="page-break-after: always;"></div>

## <center> <a name="rm_service_isolation"/>Service-level Isolation (cgroups)

* Assures each service a percentage of cluster resources
  * Enforced under contention
* Cloudera Manager implements this through [Linux Control Groups](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Managing-Clusters/cm5mc_cgroups.html)
  * Resources controls are limited to Linux support
  * Could support CPU, memory, disk I/O, and network limits, if available
  * `Cluster > ClusterName > Static Service Pools`

---
<div style="page-break-after: always;"></div>

## <center> <a name="rm_admission_control"/> Regulating YARN and Impala demands

* [Admission control for Impala queries](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/Impala/Installing-and-Using-Impala/ciiu_admission.html)
  * On by default for Impala 1.3 and later
* Cloudera Manager supports [Dynamic Resource Pools](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Managing-Clusters/cm5mc_resource_pools.html)
    * A <i>configuration set</i> is used to define a client group (e.g., prod, mktg, batch, queries)
    * <i>Scheduling rules</i> inform the configuration set's policy
    * Pool resources are determined by user permissions, query count, queue size, memory demand
* See `Cluster > ClusterName > Dynamic Resource Pools`

---
<div style="page-break-after: always;"></div>

## <center> More on Admission Control </center>

* Impala and YARN use the same pool definitions
* Three decisions: execute, queue, or reject a query
* Decision factors:
    * Currently running queries
    * Memory available
    * Current queue length
* Each local <code>impalad</code> decides how to act
    * To compensate for stale data, admission control is soft
* Impala favors running more tasks over preserving headroom
    * Work to improve this decision-making is ongoing

---
<div style="page-break-after: always;"></div>

## <center> <a name="rm_dynamic_prioritization"/> A Word on Dynamic Prioritization

* <strong>L</strong>ow-<strong>L</strong>atency <strong>A</strong>pplication <strong>MA</strong>ster ([LLAMA](http://cloudera.github.io/llama/)) for Impala
    * Released with CDH5 as a beta component
    * Concept: run all Impala queries through one AM
        * Interaction with the RM is not NRT-friendly
    * Project dropped after C5.5
* The objectives are the same
    * Balance low-latency queries with batch processing
    * Find more efficient means to dispatch multiple scheduler queues
    * Devise opportunistic processing schemes for more efficient utilization
    * Improve resource estimation (e.g., Impala's <code>COMPUTE STATS</code>)

---
<div style="page-break-after: always;"></div>

## <center> Current Practices for YARN & Impala

* Look in every minor release for best practice updates
  * Set and monitor Static Resource Pools to limit hogging and prevent starvation
  * Use Admission Control with Impala to cap number of concurrent queries
* Notify customers that LLAMA is done
  * No replacement on the roadmap

---
<div style="page-break-after: always;"></div>

## <center> YARN/RM Lab: Doing the Math

---
<div style="page-break-after: always;"></div>

## <center> YARN/RM Lab: Doing the Math

Cloudera's [public YARN
guide](http://www.cloudera.com/documentation/enterprise/latest/topics/cdh_ig_yarn_tuning.html)
is too complicated to digest quickly. The spreadsheet from that
guide is [in your git repository for review](tools/yarn-tuning-guide.xlsx).

For this back-of-the-envelope exercise, we'll use a [simpler, less
exacting form](tools/YARNCalcs.xlsx).
* Numbers in blue quantify the hardware attributes of your cluster
* Numbers in pink are calculated; see the formula for each cell
* Numbers in black either:
  * Quantify the need of a service
  * Represent a reasonable default

Suppose you have a cluster with ten worker nodes. Each worker node has:
* Twenty vcores
* 128 GB RAM
* Twelve disks for DataNode use

Do the following:
1. Plug the hardware numbers for your cluster into the spreadsheet
2. Inspect the derived/default values. Adjust as necessary.
  * For example, if memory for the OS is too high or low, adjust the cell formula.
  * Explain any adjustments you make in `resources/labs/0_YARNCalcs.md`
3. What criteria affects workload factor? What does a value of 1, 2, or 4 signify?
  * Put your answers in the same file as step 2.
4. Capture your finished worksheet as a screenshot to `resources/labs/1_YarnCalcs.png`

---
<div style="page-break-after: always;"></div>

## <center> YARN/RM Lab: Static Service Pools

* Navigate to the Static Service Pools page
  * Capture the Status and Service Usage sidebars to `resources/labs/2_service_usage.png`
* On the Configuration tab, allocate 10% to HDFS and 90% to YARN
  * If you installed other services such as HBase or Impala, delete them first
  * Complete the wizard and restart your cluster
* Confirm the settings after the restart

---
<div style="page-break-after: always;"></div>

## <center> YARN/RM Lab: Tuning for YARN

* In this lab you'll experiment with different work parameters to
determine which version of a common job runs fastest.

* Review the file `tools/YARNtest.sh`
* Run this script from your edge node
    * Check it first: there are 1-2 things wrong with it
    * Modify the script to echo the parameter values for each run
    * Incorporate the `time` command to report how long each job takes to finish
    * Change the mapper, reducer, and container memory parameters to emulate different resource demands
* Run the script: your most demanding job should try to max out the cluster
* Add the following to your `resources/labs` directory
    * Your modified version of the script as `3_YARNtest.sh.md`
    * The parameters used and times of your slowest and fastest runs in `4_YARN_results.md`
* In CM, navigate to YARN Applications
    * Select the `Charts` tab and take a screenshot.
    * Save it to `resources/labs/5_YARN_Charts.png`
* Set your Issue to `submitted` when it is finished.
