<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---
<div style="page-break-after: always;"></div>

# <center> <a name="hue_services_admin_section"/>HUE Services & Administration

* <a href="#hue_design_goals">HUE Design and Goals</a>
* <a href="#hue_services">Services</a>
* <a href="#hue_deployment_tools">Deployment Tools</a>
* <a href="#hue_admin_features">Admin features</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="hue_design_goals">HUE Design & Goals</a>

* Customizable service portal
    * Customer success story: [RainStor Embraces HUE](http://rainstor.com/rainstor-embraces-hue/)
* Three client authentication modes
* Graphical browsing and reporting
* Application UIs
* LDAP/Kerberos support
* Index for support, tutorials, demos

---
<div style="page-break-after: always;"></div>

## <center> Current Version & Resources

* C5.9 ==> [Hue 3.11](http://gethue.com/category/3-11/)
    * Apache-licensed, not an ASF project
    * Ported to HDP, MapR, Pivotal, IBM Big Insights
* [Online demo available](http://demo.gethue.com/)
* Drives [Cloudera Live](http://www.cloudera.com/content/cloudera/en/products-and-services/cloudera-live.html)
* Active blogging on new developments: [gethue.com](http://gethue.com)
* Some [screencasts available](http://vimeo.com/search?q=gethue)

---
<div style="page-break-after: always;"></div>

## <center> <a name="hue_services">HUE's Services</a>

* <a href="hue_query_editors">Query editors</a>
* <a href="hue_data_browsers">Data browsers</a>
* <a href="#hue_workflow_tools">Workflow tools</a>
* <a href="#hue_search_console">Cloudera Search console</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="hue_query_editors">Query Support</a>

* [Beeswax editor demo](http://demo.gethue.com/beeswax/#query)
    * Uses HiveServer2; Beeswaxd (Hue's own Hive query service) is deprecated.
* Supports [Impala load-balancing](http://gethue.com/hadoop-tutorial-how-to-distribute-impala-query-load/)
* Multiple [query editors](http://gethue.com/hadoop-tutorial-how-to-distribute-impala-query-load/)
    * MySQL, Oracle,, PostgreSQL, sqlite3
* [UI support for Pig](http://gethue.com/how-to-use-hcatalog-with-pig-in-a-secured-cluster/)
* Evolving support for [Spark UI](http://gethue.com/use-the-spark-action-in-oozie/)

---
<div style="page-break-after: always;"></div>

## <center> <a name="hue_data_browsers">Data & Metadata Browsers</a>

* [Hive Metastore](http://demo.gethue.com/metastore/tables/)
* [HBase](http://demo.gethue.com/hbase/#Cluster)
* [Sqoop Transfer](http://demo.gethue.com/sqoop/#jobs)
* [ZooKeeper](http://demo.gethue.com/zookeeper/)

---
<div style="page-break-after: always;"></div>

## <center> <a name="hue_workflow_editors">Workflow Tools</a>

* Apache Oozie's UI tools
    * Use ExtJS libraries (not Apache-licensed)
    * Mostly support for browsing jobs  
* Hue offers [Oozie dashboards](http://demo.gethue.com/oozie/)
    * And [Workflow Managers](http://demo.gethue.com/oozie/list_workflows/)

---
<div style="page-break-after: always;"></div>

## <center> <a name="hue_search_console">Demos for Cloudera Search</a>

* [Twitter Demo](http://demo.gethue.com/search/?collection=13)
* [Yelp Demo](http://demo.gethue.com/search/?collection=10000002)
* [Logfiles Demo](http://demo.gethue.com/search/?collection=10000003)

---
<div style="page-break-after: always;"></div>

## <center> <a name="hue_deployment_tools">Deployment Tools</a>

* Just a client portal, not a core Hadoop service
    * Hue [can be set up by anyone](http://cloudera.github.io/hue/docs-3.9.0/manual.html)
    * In a parcel: <code>/opt/cloudera/parcels/CDH/lib/hue</code>
* A cluster can have multiple instances if desired
* Hue does ~~not~~ scale very well, not recommended for >10-15 concurrent users
    * You may need multiple instances to support tens of Hue users for one cluster

---
<div style="page-break-after: always;"></div>

## <center> <a name="hue_admin_features">HUE Administrative Features</a>

* Hue's database stores user accounts, Hive queries, job submissions
* Embedded database is <code>(SQLite)</code>
* Also supported: [MySQL, PostgreSQL, Oracle](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Requirements-and-Supported-Versions/cdhrsv_db.html)
* Inspectable: <code>sqlite3 /var/lib/hue/desktop.db</code>  

---
<div style="page-break-after: always;"></div>

## <center> HUE Lab: Authenticate using Linux users/groups

* Use a Linux account with login capability
    * Make sure the account has the same UID/GID on all cluster nodes
* [Follow this guide](http://gethue.com/hadoop-tutorial-how-to-integrate-unix-users-and-groups/)
* Get a screenshot that shows this user is logged into Hue
    * Name the file <code>client/labs/0_unix_login.png</code>

---
<div style="page-break-after: always;"></div>

## <center> HUE Lab: Security or Availability?

* [Integrate Hue and Sentry](http://gethue.com/apache-sentry-made-easy-with-the-new-hue-security-app/)
    * Watch out for red herring instructions or missing steps
* Install a [second Hue instance and load balancer](http://gethue.com/automatic-high-availability-and-load-balancing-of-hue-in-cloudera-manager-with-monitoring/)

* Consult with an instructor to get a meaningful screenshot
* Name the screenshot <code>1_hue_sentry.png</code> or <code>1_hue_lb.png</code>, as appropriate
* If you do both, number the screenshots to show the order you did them.

---
<div style="page-break-after: always;"></div>
