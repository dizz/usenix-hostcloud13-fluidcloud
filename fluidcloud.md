Base Header Level: 3

# Introduction

Today, cloud computing [#Grance,2011] service instances have little means to easily move from one cloud service provider to another. Cloud standards are seen to be the panacea, yet have little adoption by the market, especially by the market's dominant players.

Currently, cloud standards exist but most are not widely adopted, especially *de jure* style. *De facto* style standards such as Amazon EC2 has somewhat more adoption. Software libraries and frameworks that abstract cloud computing services to common interfaces are more widely adopted (see Related Work). However, even the most relevant standards or software libraries have little or no service instance relocation functionality. Ultimately, those cloud service instances remain locked under the control of the service provider, unless significant manual and/or ad-hoc  efforts are spent by the service instance owners.

The proposed solution is the FluidCloud framework which aims to make relocating services instances easier with more automation. From this work a number of research and engineering challenges arise including data optimisation, runtime architecture adaptation, goal-oriented service instance relocation.

# A Problem in the Cloud?

Cloud service instances remain locked under the control of the service provider. FluidCloud will liberate these instances. Having the ability for a cloud service instance to easily and seamlessly move from one provider to another will bring advantages to any cloud service owner. It would bring more freedom to cloud service owners, instances, including their application and data. Essentially, it will bring service instance "movement rights" to the cloud. However there is no encompassing means to accomplish this.

FluidCloud is something that fits within the soon future cloud. A reasonable view of this future cloud is the InterCloud. The InterCloud is described in [#BernsteinEtAl,2009], [#Bernstein,2010], [#Demchenko,2012] as well in a notable online conversation[^1] where James Urquhart, Cisco’s Cloud Programs and Communications Manager, clearly outlined the genesis and progression of it from singular and multi-cloud ecosystem we see today. The concept of the InterCloud is based on the proliferation and continued growth of public clouds ranging from IaaS, PaaS and up to SaaS. The ecosystem of these cloud service providers include the popular Amazon EC2, Google App Engine, CloudFoundry, OpenShift, Rackspace, Heroku and CloudSigma. 

## The FluidCloud Concept

Within the highly populated ecosystem of cloud service providers combined with the InterCloud concept, it becomes crucial, both technically and financially, that service instances can be relocated and consequentially adapted to their new service provider. In the vision of the FluidCloud framework, the hosting cloud provider of the service instance is not a concern anymore as the service can be fluidly (easily, on-demand and dynamically) relocated between providers. The FluidCloud concept addresses multiple benefits -- including:

* **Enhancing the InterCloud**:
FluidCloud advances the definition, architecture and implementations of cloud computing, yet for stakeholders makes the transition easy through the an open source framework.

* **Economical**:
FluidCloud can suggest new compatible service providers and based on economical differentiators and should the service owner want it; relocate their service instance to the suggested target provider.

* **Regulatory**:
If a running cloud service instance is in an unrecognised or risky geographic region, a region where data privacy policies are incompatible or change to being incompatible then to comply with regulatory policy or law, the service provider can use FluidCloud to relocate that service instance at risk.

* **Liberation**:
Cloud service developers and operators own their application and are responsible for end-user data. They should have right of movement for those services instances and the efficient means to enable them.

* **Positive Market Disruption**.
By having the ability to relocate a service instance from one provider to another, the market place is opened further, enabling greater competition based on service provider differentiation and not on technical lock-in or limitation.

## FluidCloud Scenarios

To understand further how FluidCloud can be applied in a more practical sense, consider some examples which demonstrate the need for the FluidCloud framework:

* **Cloud Service Developer** (CSD, e.g. University startup).
Take the example where a university startup implements a new service in the cloud. The type of service is one that is architected to handle bursty traffic as described in [#Elson,2008]. After a period of time, the selected provider does not satisfy from technical (e.g. Amazon EC2 outages), economical (e.g. Google increasing prices for Google app engine) or regulatory purpose, due to service offer changes. 

  Now the benefits from a FluidCloud concept is that the startup can easily relocate their service to a new cloud service provider.

* **Cloud Service Provider** (CSP; e.g. CloudSigma, ProfitBricks).
A cloud service provider would like to relocate (or "on board") new customers from other cloud service providers. What is needed is to relocate new end-user service instances to their services from other, potentially, competing *(through hardware differentiation - for example faster storage through SSDs)* services. This would allow to CSP to let their customers seamlessly relocate to their service offering.

  The cloud service provider operates FluidCloud framework and offers it as a service. 

* **Cloud Broker** (e.g. Spotcloud or Zimory).
Developers and providers of cloud brokerage services and software could consider adding cloud service relocation functionality to their cloud brokerage offers. Typically, a cloud broker discovers and provisions a cloud service instance on the behalf of the service owner. Once that target service instance is provisioned the end-user interacts and uses the target service instance, either through interfaces provided by the cloud broker or directly using the interfaces of the provisioned target service instance. The cloud broker is aware of the end-users service instances and can continually watch for compatible service types that can be offered to the end-user as a replacement, based on economic/geo-location/cost bases. 

  If the service owner was interested the cloud broker can, using FluidCloud, relocate the service on the owner's behalf.

## FluidCloud Contributions

For such scenarios, as described above, to be technically realised there is a set of missing technologies. FluidCloud fills these gaps by providing the following key contributions:

* **Service Instance Relocation** -- *Ensuring the overall orchestration and process of moving a cloud service from the source to the target cloud service provider*. 
There are two types of cloud services that FluidCloud will support and enable relocation for: IaaS and PaaS based services. This entails that IaaS entities such as virtual machines and virtual storage devices (block and object storage) will need to be relocated. For PaaS, entities such as the service-components with packaged or compiled source code and possibly the data will need to be relocated. The decision to relocate will be something initiated by the owner of the service (e.g. through a user interface). The relocation may also be initiated by a Cloud Broker who has user-supplied policies to dictate under what conditions (such as costs) a service should be relocated.

* **Service Instance Adaptation** - *The Conversion, transformation and movement of the service and its related data*.
Related to relocating IaaS and PaaS services are the potential service adaptations that need to take place. Services comprise of service-components (For example a web server, database), which are essentially applications. Those service-components might need to be changed when relocated. For example VM images need to be converted or if we turn our attention to the PaaS area is the adaptation of applications written for a certain target platform. 

* **Data Relocation** - *Relocation, migration, transcoding, transformation and conversion of the data belonging to the service*.
In FluidCloud a service is defined as a set of service-components and the data belonging to the service. Relocation of data fundamentally means moving bits and bytes. Currently tools such as GlobusOnline[^1] provide a service for easy transferring data between Grid sites using the proven GridFTP protocol [#RFC?], which allows for fast and reliable data transfers. Other solutions like the Zeta File System (ZFS) send/receive feature allow for snapshotting a dataset in constant time and allow easy relocation. Certainly upcoming technologies like Software Defined Networking can help when data path are needed on-demand to be established between to providers. 

# Architecture

Core to realising FluidCloud are the following components: The ‘CloudConduit’ handles and coordinates the overall relocation (possibly partial) of the service instance. Viaducts form a ‘path’ between cloud providers (if needed with underlying support of the network). The CloudConduit is responsible for setting up the ‘Viaduct’. Within Viaducts, ‘Migrators’ are placed on these to adapt the Application, it’s environment and if necessary data as it relocates through the Viaduct. In order to relocate a service efficiently the CloudConduit can establish multiple Viaducts. The CloudConduit analyses the service to be relocated and based on that it uses the ‘Broker’ to find suitable replacement providers. Based on the replacement providers the CloudConduit uses the Broker again to find suitable Migrators to aid the relocation process. The following diagram shows the proposed high-level proposal:

![Conceptual Overview][]

[Conceptual Overview]: img/arch_overview.png "Architectural Overview" width=200px

The key components are the following:

* **Service Instance** - a logical container that comprises the application and the data. Executing the applications will form the workload. Can contain sub-service instances.
* **CloudConduit** - orchestrates the process, introspects the service instances (incl. topology) to be relocated. It is also responsible for the lifecycle of Migrators. The relocation is triggered with this module.
* **Broker** - discovers and provides both cloud provider services and Migrator facilities. Eventually it monitors and inspects the service instances. Also orchestrates the deployment of the Migrators.
* **Migrator** - these are the libraries and services for adaptation and carry out one specific task related to (partial) relocation of service instances. Multiple Migrators might be needed to carry out the overall relocation.
* **Viaduct** - a logical path between two parties in which ‘Migrators’ are organised. All together those accomplish the task of relocating a service instance from one cloud provider to another. Migrators as well as more network-oriented components (like proxies) are ‘located’ on this path. All those components might be organised as workflows with multiple pipelines if needed. 
* **Cloud Service Provider** - a provider of either IaaS or PaaS service types.

With these concepts, FluidCloud will provide the architecture and tooling to enable the InterCloud by enabling the tree key contributions introduced earlier: Service Relocation, Service Adaptation and Data Relocation.

Service instances in the Cloud are a wide field because their implementation can use IaaS or PaaS for example. Therefore FluidCloud addresses:

1. Relocation of IaaS-based Service Instances.
FluidCloud will show the relocation of a service instance (and its data) running within VMs (on a local development machine, private end or public cloud). Triggers for the relocation can be scaling, costs, dependability, hardware differentiation or geo location. The service instance will automatically be adapted to the new environment.

2. Relocation of PaaS-based Service Instances.
The relocation of a PaaS based service instance and its data between providers. Key to this demonstration is the ability to adapt the service instance (on source code level) and convert it to the new environment. The motivation should be to bring PaaS services from closed environments (e.g. Google App Engine) into more open ones (e.g. CloudFoundry).

3. Service Instance Adaptation: IaaS to PaaS.
A software developer has developer an service on his own VM in an (Private) Cloud now he wants to roll-out this service on a available PaaS provider such as Google App Engine.

# Implementation

The first proof of concept of the conceptual architecture has been implemented using the Python programming language. Each of the components is a standalone process which eventually communicate with each other using a messaging queue. The prototype uses the Advanced Message Queuing Protocol (AMQP) implementation by RabbitMQ. 

![Architectural Overview][]

[Architectural Overview]: img/fc-impl-1.png "Architectural Overview" width=200px

The CloudConduit has capabilities to processes requests for service instances to be migrated. When such an relocation is triggered it inspects the service instances for sub-components (sub-services) and their dependencies. This is done an RESTful Cloud API which is implemented by both Cloud Providers (OpenStack and SmartOS based) in this PoC. Based on the inspection it creates a set of tasks which need to be executed. For this early setup the task are executed in sequential order. Later on the scheduling of these tasks may become more complex. The distribution of the tasks is handled by the Broker.

(*need to note that the broker has a list of suitable replacement services*)

The Broker does not have the information to instantiate the appropriate Migrators that make up the Viaduct. The Migrators now take care of the actual relocation and topology change within the service instance.

To test this implementation the following scenario is considered. A simple node.js application is deployed with an Virtual Machine running within the Domain of OpenStack. This Virtual Machine has a block storage attached to it through an OpenStack Volume. The node.js also makes use of the Object Storage provided by OpenStack Swift. 

(*should note that the object storage is not migrated - perhaps as it's not provided by openstack… it's S3*)

Based on the performance of the hypervisors the decision is made, by the service owner, to trigger a relocation to a Cloud provider which uses SmartOS as an Hypervisor. After relocation the VM will be running on the SmartOS platform. The data within the block storage will be relocated whereas the data in the object storage will stay where it is. This will demonstrate that the service topology of the service instance can change after the relocation depending on the new destination service provider. This change in topology although is done automatically. The service topology before and after relocation is shown in the following diagram:

![Service before and after relocation][]

[Service before and after relocation]: img/b+a.png "The VM before and after relocation" width=200px

The decision for this service topology after relocation is made by the CloudConduit and should be guided by service owner policies. Overall, to to relocate this simple node.js application the following Migrators need to be placed on the Viaduct:

 * OpenStack to SmartOS image converter (Hypervisor level) -- Snapshots an KVM image within OpenStack Glance and copies it to the target platform. Essentially converts the image format in between.
 * Relocator for the OpenStack block storage. Copies the data from the block storage device in OpenStack cinder onto the Filesystem of the VM running on KVM in SmartOS (which needs to be provisioned at this stage).
 * Reconfiguration of the node.js application's configuration file based on regular expressions. Change paths for node.js interpreter, and network configuration needed (IP of OpenStack Swift instance).

When the relocation of the data parts (the VM image) is accomplished the Broker restarts the Virtual Machine on the target side.

This then overall demonstrates the earlier described process:

 1. the CloudConduit gets a request to migrate an application
 2. an application (*application versus service instance*) is a set of related VMs that make up the service instance
 3. each of those VMs may have associated resources - CloudConduit must determine these

# Evaluation

**TODO**

* It works :p
* Time to migrate depends on data payload sizes

The Architecture described in the last section should demonstrate that the concepts of FluidCloud are technically feasible. More over the important thing is that the concepts noted in this paper describe a way of enable fluidity of services between clouds.

# Related Work

Standards organisation defined interfaces such as OCCI[^1], CIMI[^1] or CDMI[^1] might realise interoperability from a user perspective but they do not solve the issue of relocation. The paper [#Petcu,2011] reviews aspects related to portability and interoperability in clouds. It notes the lack of adoption of standards by vendors saying that "vendor[s] like[s] to put barriers to exit for their customers". Related thoughts are discuss in [#Jr,2011]. Here it is noted that cloud systems utilising different hypervisors won’t interoperate, in part because they don’t use the same data formats. 

Adapter libraries enabled the means to manage multiple cloud offerings, The most prominent of these are libcloud[^1], fog.io[^1] and jClouds[^1]. There are commercial products available currently that aim to easily use multiple clouds at runtime. Such examples include RightScale[^1] and Enstratus[^1]. However these solutions only manage the lifecycle on each various cloud service provider's platform and they do not allow for the relocation of cloud service instances between providers.

There are quite a number of Platform as a Service (PaaS) offerings available today. Most PaaS offerings tend to support multiple languages and a number of supporting services. Examples of these include Heroku , Windows Azure, Red Hat OpenShift, VMware CloudFoundry and Google App Engine. These platforms can be found to support Java, Python, Erlang, Node.js and other languages. What is important to consider with all of these offerings is the degree of lock-in that each offering brings to its users. The majority of the PaaS offerings leverage the existing interoperability work that each language (and its standard libraries - e.g. WSGI for Python) and supporting services (e.g. MySQL , RabbitMQ) already has. However, this is not uniform across all PaaS offerings.

The Open Data Centre Alliance released a report [#Alliance,2012] on long distance service instance relocation. Noted within is that relocation of workload possible but “[…] migrations occur between disparate data centres of the same cloud provider […]” most of the time. Also noted within is the fact that the “[…] abstraction of a PaaS workload” is not yet finalised and that more collaborative efforts on this issue need to be made. So here the most obvious issues become clear: relocation is possible but mostly within service provider’s domain and that inter-domain (InterCloud) relocation on IaaS and PaaS level needs more research.

Also in [#Mizgier,2010] a model and means to evaluate the migration of one system to another. It notes that aspects related to the migration of data are on of the biggest challenge and, as particular to this work, where data model conversion must be carried out.

Currently available software solutions for data management exists – such as: Cloudant[^1], Xeround[^1], MongoLab[^1] or Amazon S3[^1]. But currently they lack the ability to convert data between the service instances, or relocate data. It is noted that services like Cloudant offer means of distributing data location based. Some means of dealing with the relocation of IaaS-based services (composed of Virtual Machines) is available today.

The paper [#Ward,2010] looks at InterCloud more from the federation aspect and the authors describe their architectural vision of that InterCloud. One important aspect that the authors do note is the importance of cloud brokers in their architecture. The concept of cloud brokerage is compliant with the definition provider by Gartner of Cloud Services Brokerage [#Plummer,2011] offering aggregation, integration and customisation, the 3 primary roles expected of such a cloud service broker.  This is further refined in the NIST Definition of Cloud Computing [#Grance,2011].

# Conclusions and Further Work

**TODO**

what follows from the solution

* investigate the area of live relocation etc.
 * this is a large challenge - quote vmotion limitations
* investigate data payload minimisation
* contribute to the intercloud
* how SDN can play a role
* work will continue
  * targets are….
  
The Framework used for this PoC will be released and supported under an Open Source License (Apache 2.0) at: github.com/??? …



[#Grance,2011]: tbd

[#Elson,2008]: "Handling Flash Crowds from Your Garage"

[#Mizgier,2010]: tbd

[#Ward,2010]: C. tbd

[#Plummer,2011]: Daryl C. tbd

[#BernsteinEtAl,2009]: Bernstein, Ludvigson, Sankar, Diamond, & Morrow, 2009

[#Bernstein,2010]: D. Bernstein, 2010

[#Demchenko,2012]: Y. Demchenko, 2012

[#Alliance,2012]: ODCA

[#Petcu,2011]: Dana's interop paper

[#Jr,2011]: JR? From dallas?



[^1]: I'm a little footnote short and stout!
