You can set YARN properties to control the allocations of memory
and vcores per working node. Settings for the NodeManager govern
per-node limits, while settings for the ResourceManager (scheduler)
govern limits for any container request.

| YARN property                              | Basic description                             | How it affects MR or Spark jobs
|--------------------------------------------|-----------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| `yarn.nodemanager.resource.memory-mb`      | Total RAM available for containers (MB) | Max RAM per node available for MR tasks or Spark executors                                                                                          |
| `yarn.scheduler.maximum-allocation-mb`     | Per-container allocation ceiling (MB)         | The most RAM any container can get; requests above this amount are reduced to this value                                                            |
| `yarn.scheduler.minimum-allocation-mb`     | Per-container allocation floor (MB)           | The least RAM any container will receive; requests below this amount are increased to this value                                                    |
| `yarn.nodemanager.resource.cpu-vcores`     | Cores available for one container              | Given sufficient memory for all containers requested and one core per container, the maximum number of containers that could run at once on a node. |
| `yarn.scheduler.maximum-allocation-vcores` | Per-container allocation ceiling              | In practice, the number of threads allocatable to a MR task or Spark executor                                                                       |
| `yarn.scheduler.minimum-allocation-vcores` | Per-container allocation floor                | Usually set to 1                                                                                                                                  |

Sparkxi and MR clients can request resources as they see fit. They are of course subject to the limits imposed by the ResourceManager and NodeManagers.


* `mapred.reduce.tasks`
* `mapred.child.java.opts`
* `mapred.map.child.java.opts`
* `mapred.reduce.child.java.opts`
