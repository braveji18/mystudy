## Why use a cloud provider for training?

This week's training is a classic use case for the cloud. Over the
course of a week, you'll create two clusters: one for your labs, and
one for your Friday challenges. You can spin them up and destroy them
quickly -- even faster with automation tools such as Cloudera Director --
and destroy them even faster.

Using the cloud also means you do not have to prepare a
room with sufficient hardware to run clusters on-premise. More to the point
for you, you can work on labs without staying in the classroom.

---

## Choosing a cloud provider for class

This course does not require you to use AWS. Any cloud provider,
including one provided by your company, will do. I have recently
started using Google's Cloud Service, for example, because the
hourly costs are lower for the services I need. I am sure there may
be limitations in GCE versus AWS, I just have not encountered them
yet.

Whatever platform you choose for class, the following conditions must hold:

* The instructors(s) can access your cluster
    * It cannot be blocked from outside access
    * It cannot violate your provider's security policies to do so
* Outbound access to the internet is not forbidden
    * You will download various packages from online sources
* The service provides OS platforms that are required by Cloudera

For training demonstrations, I will use RHEL/Centos 6.5 or later.
Please avoid using any Linux version you don't know the platform well. There
are substantive changes in RHEL/CentOS 7.x that are not yet accounted
for in this training, for example, and are not completely covered in
Cloudera's documentation.

---

## Learning challenges

There are many challenges to using AWS, Google Compute Engine, or
other providers for the first time. You can expect to spend several
hours reading your provider's documentation to understand their
system and navigating it proficiently.

 Some common learning obstacles
with AWS include:
* [Choosing a proper AMI](http://www.cloudera.com/documentation/director/latest/topics/director_deployment_ami.html)
* [Adding volume space](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html) to your nodes
* [Relaxing security](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html) for testing

---
