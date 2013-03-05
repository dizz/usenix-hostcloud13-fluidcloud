Base Header Level: 3

# Notes

5 pages of double column

# Introduction

*Describe the problem*
*State the contributions*

Today, cloud computing [#Grance,2011] services have little means to move from one cloud service provider to another. Standards are seen to be the panacea, yet have little adoption by the market.

Having the ability for a cloud service to easily and seamlessly move from one provider to another will bring a huge competitive advantage to any cloud computing service user. It will bring liberation to cloud services, both the application and data. It will bring service movement rights to the cloud.

Cloud standards exist but are not adopted. Also, even the most relevant standards are limited. Software that abstracts cloud computing to common interfaces is more widely adopted. Yet for the services those standards or software can manage, they do not contain any concepts to or mechanisms of relocating those services. Ultimately, those cloud services remain locked under the control of the service provider.

# Problem Statement

TODO

 * *why it’s an interesting problem*
 * *a narrative*
 * *examples*
 * give **problem** scenario  
 * All the questions below need to be turned into a narrative fitting an example scenario.

Problems

 * how are decisions made to relocate to? Is it the user? Is it something automatic?
 * Do current Brokers need extension to support service relocation? 
 * how is information extracted from the service to be relocated? 
 * Are existing provider interfaces used? 
 * Does a service need to be profiled? 
 * Can the service to be relocated be relocated online or offline?
 * How are matching alternative target services discovered? Are there service interfaces for this?
 * What happens if relocation fails? 
 * How to ensure reliability during relocation?
 * How is this creation of network resources between providers on demand accomplished?
 * How is conversion of VMs accomplished?
 * how the movement of block storage done especially the provider does not offer a means to export those? 
 * how is the recreation of virtual networks achieved? 
 * What to do with differing NaaS interfaces between two cloud service providers? 
 * How are networking limitations in virtualisation overcome?
 * how is the adaptation of applications written for one PaaS cloud service provider achieved?
 * what are the adaptations needed if a service is decomposed and split over a number of providers? 
 * How is service decomposition achieved? 
 * what are the ways to relocate data today? 
 * How can I reduce the amount of that to be transferred?
 * if a service is moved from A to B, what are the strategies to move the service data?
 * Is the data moved before the service or after the service? 
 *  Does the service maintainer expect any downtime?
 * how can SDN help?
 * But what needs to be done so data is converted to match the technology?

# Cloud Fluidity

TODO
*what the solution achieves*
*examples*

The main scientific and technological objective this paper tries to demonstrate is:
\textbf{“Cloud Fluidity, the processes, mechanisms, interfaces, software frameworks and tooling that enables cloud services to relocate, online or offline, from one provider to another.”}

TODO: reasons to relocate!

To address this let us consider the key stakeholders that will be present in a future with FluidCloud present and available

* Cloud Service Developer End-user (CSD, e.g. University startup)
Take the example where a university startup implements a new service in the cloud. The type of service is one that is architecture to handle bursty traffic as described in “Handling Flash Crowds from Your Garage” (Elson, 2008). After a period of time, the selected provider does not satisfy from technical (e.g. Amazon EC2 outages), economical (e.g. Google increasing prices for Google app engine ) or regulatory purpose, due to service offer changes. The startup can easily relocate their service to a new cloud service provider offering FluidCloud services. The startup can choose to find and pay for a relocation service operator, running FluidCloud software. Alternatively they can host the FluidCloud software themselves. Using either way they can have their services relocated to a new cloud service provider fitting their needs. The existing services will be relocated either through an easy to use user interface or for automated control, through a programmatic web interface.
* Cloud Service Provider (CSP; e.g. CloudSigma, ProfitBricks)
The cloud service provider operates FluidCloud software and offers it as a service. It is used to relocate new end-user services to their services from other, potentially, competing services. It will be up to the CSP to decide whether or not they wish to offer the service as bidirectional or unidirectional i.e. they only allow service relocation ingress and not egress or they allow both. In the case of a new end-user signing up with one of these types of stakeholders, the end-user would present their credentials to the existing CSP, where the existing services are running, and then direct the new CSP hosting FluidCloud services to begin the process of service relocation. The CSP could host this service for free as a means to encourage new business, charge for it directly or amortise the cost of relocation into the cost of providing service to that end-user.
* Relocation Service Operator (RSO; e.g. Telefonica or Equinix)
A service operator may choose to offer the FluidCloud software as a service to end-users and operate on the basis of providing cloud service relocation as a service. Typical candidates that would fit this role are those that have access to high-speed networks such as telecom operators (telco) or data centre operators with distributed geographical operations. In this case, the relocation service operator would sit between two cloud service providers and offer the service of service relocation. These types of candidates have strategic advantages over other RSOs who might build upon cloud service provider platforms given their strategic network assets. As such they can offer service relocation at a price or performance differentiated business model. Especially for the telco actor, the ever pressing need for new and innovative over-the-top (OTT) services and utilisation of their plentiful infrastructure would motivate the use of FluidCloud in order to relocate cloud service onto telco provided services.
* Cloud Broker (e.g. Spotcloud or Prologue)
Developers and providers of cloud brokerage services and software could consider adding cloud service relocation functionality to their cloud brokerage offers. Typically a cloud broker discovers and provisions the right cloud service on the behalf of the end-user. Once that target service is provisioned the end-user interacts and uses the target service, either through interfaces provided by the cloud broker or directly using the interfaces of the provisioned target cloud service. The cloud broker is aware of the end-users services and can continually watch for compatible services that can be offer to the end-user as a replacement, based on economic/cost reasons. If the end-user was interested the cloud broker can relocate the service on the end-user’s behalf, acting as a RSO and using the same RSO business model.


What are the advantages to these stakeholders of having FluidCloud available? More importantly what are the advantages that FluidCloud offers to end-users whose services deployed upon CSPs are potentially at risk?

* Supporting and Enabling the InterCloud 
FluidCloud advances the definition, architecture and implementations of cloud computing, yet for stakeholders makes the transition easy through the support of software implemented in WP 3, 4 and 5.
* Economical 
Through the CloudConduit and Broker (WP3), FluidCloud can suggest new compatible services and based on economical differentiators and should the service owner want it; relocate their service to the suggested CSP (e.g. on that offers the same service but for cheaper).
* Regulatory
If a running cloud service is in an unrecognised or risky geographic region, a region where data privacy policies are incompatible or change to being incompatible then to comply with regulatory policy or law, the service provider can use FluidCloud to relocate that service at risk.
* Liberation
Cloud service developers and operators own their application and are responsible for end-user data. They should have right of movement for those services and the efficient means to enable them. FluidCloud liberates and ensures 
* Positive Market Disruption
By having the ability to relocate a service from one provider to another, the market place is opened further, enabling greater competition based on service differentiation and not on technical lock-in or limitation.

To verify the processes and framework the proposal uses the following scenarios will be used to validate the overall objectives:

1. Relocation of IaaS-based service
For this demonstrator FluidCloud will show the relocation of a service (and its data) running within VMs (on a local development machine, private end or public cloud). Triggers for the relocation can be scaling, costs, dependability, hardware differentiation or geo location.  The service will automatically be adapted to the new environment
1. Relocation of PaaS-based service
This demonstrator will show the relocation of a PaaS based service and its data between providers. Key to this demonstration is the ability to adapt the service and convert the to the new environment. Motivation should be to bring PaaS services from closed environments (e.g. Google App Engine) into more open ones (e.g. CloudFoundry ).
1. Smart (mobile) device and their connection to a Cloud service
This demonstrator will show how smart (mobile) device can trigger relocation of a service they use so that the service they use resides closest to the device. Key here is to show no interruption to the end-user when relocating the service and data or providing paths to data services.

# Details: Architecture Implementation and Evaluation #

TODO

![Conceptual Overview][]

[Conceptual Overview]: img/arch_overview.png "Architectural Overview" width=200px

For such scenarios, described above, to be technically realised there is a set of missing technologies that FluidCloud will research and develop. FluidCloud will provide the architecture and tooling to enable service relocation through three main research and development challenges:

* Service Relocation – Ensuring the overall orchestration and process of moving a cloud service from the source to the target cloud service provider,
* Service Adaptation – Conversion, transformation and movement of the service and its related data,
* Data Relocation - Relocation, migration, transcoding, transformation and conversion of the data belonging to the service.

TODO:

* Technical details
* show overall arch pic from FC.
* is the idea feasible?

## Architecture

Core to realising FluidCloud are key architectural components. The ‘CloudConduit’ handles and coordinates the overall (partial) relocation of the service. Viaducts form a ‘path’ between cloud providers (if needed with underlying support of the network). The CloudConduit is responsible for setting up the ‘Viaduct’. Within Viaducts, ‘Migrators’ are placed on these to adapt the Application, it’s environment and if necessary data as it relocates through the Viaduct. In order to relocate a service efficiently the CloudConduit can establish multiple Viaducts. The CloudConduit analyses the service to be relocated and based on that it uses the ‘Broker’ to find suitable replacement providers. Based on the replacement providers the CloudConduit uses the Broker again to find suitable Migrators to aid the relocation process. 

## Implementation

As an first Proof of Concept (PoC) the Architecture previously has been implemented using the Python programming language. Each of the components is a standalone process which eventually communicate with each other using the Advanced Message Queuing Protocol (AMQP) implementation by RabbitMQ. 

![Architectural Overview][]

[Architectural Overview]: img/arch.png "Architectural Overview" width=200px

The CloudConduit has capabilities to processes requests for services to be migrated. When such an relocation is triggered it inspects the services for subcomponents and their dependencies. This is done an RESTful Cloud API which is implemented by both Cloud Providers (OpenStack and SmartOS based) in this PoC. Based on the inspection it creates a set of task which need to be executed. For this early setup the task are executed in direct order. Later on the scheduling of these tasks may become more complex. The distribution of the tasks is handled by the Broker.

The Broker has not the information to instantiate the appropriate Migrators which make up the Viaduct. The Migrators now take care of the actual relocation and topology change within the service.

To test this implementation the following scenario is considered: A simple node.js application is deployed with an Virtual Machine running within the Domain of OpenStack. This Virtual Machine has a block storage attached to it through an OpenStack Volume. The node.js also makes use of the Object Storage provided by OpenStack Swift. 

Based on the performance the decision is made to trigger a relocation to a Cloud provider which uses SmartOS as an Hypervisor. 

![Service before and after relocation][]

[Service before and after relocation]: img/vm_before_after.png "The VM before and after relocation" width=200px

After relocation the service should be composed out of an Virtual Machine running the node.js application. The application will still use the OpenStack Swift Object storage. But the attached block storage will be relocated with the Virtual Machine.

The decision for this service topology after relocation is made by the CloudConduit. So in overall to be able to relocate this simple node.js application the following Migrators need to be placed on the Viaduct:

 * OpenStack to SmartOS image converter (Hypervisor level) -- Snapshots an KVM image within Glance (through OCCI) and copies it to the target platform. Converts the image format in between.
 * Relocator for the OpenStack block storage to be put within the VM at SmartOS -- Copies the data within the OpenStack Volume to the VM into a directory (which needs to be provisioned at this stage).
 * Reconfiguration of the node.js application based on regex and a configuration file. Change paths for interpreters, and any network configuration needed (IP of OpenStack Swift).

When the relocation of the data parts (image and block storage) is accomplished the Broker restarts the Virtual Machine on the target side.

This then overall demonstrates the earlier described process:

 1. the CloudConduit gets a request to migrate an application
 1. an application is a set of related VMs that make up the service
 1. each of those VMs may have associated resources - CloudConduit must determine these

## Evaluation

The Architecture described in the last section should demonstrate that the concepts of FluidCloud are technical feasible. More over the important thing is that the concepts noted in this paper describe a way of enable fluidity of services between clouds.

Note: further work and idea of FluidCloud: SDN, Data migration etc.

# Related Work #

TODO: take from SotA in proposal

# Conclusions and Further Work #

TODO
what follows from your solution

investigate the area of live relocation etc.


[#Grance,2011]: tbd




