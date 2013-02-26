Base Header Level: 3

# Notes #

5 pages of double column

# Introduction #

*Describe the problem*
*State the contributions*

Today, cloud computing (Grance, 2011) services have little means to move from one cloud service provider to another. Standards are seen to be the panacea, yet have little adoption by the market.

Having the ability for a cloud service to easily and seamlessly move from one provider to another will bring a huge competitive advantage to any cloud computing service provider. It will have a huge advantage to European cloud computing service providers. It will bring liberation to cloud services, both the application and data. It will bring service movement rights to the cloud.

Cloud standards exist but are not adopted. Also, even the most relevant standards are limited. Software that abstracts cloud computing to common interfaces is more widely adopted. Yet for the services those standards or software can manage, they do not contain any concepts to or mechanisms of relocating those services. Ultimately, those cloud services remain locked under the control of the hosting provider.

# The Problem (Retitle) #

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

# The Idea (Retitle) #

TODO
*what the solution achieves*
*examples*

The main scientific and technological objective in FluidCloud is to realise:
“Cloud Fluidity, the processes, mechanisms, interfaces, software frameworks and tooling that enables cloud services to relocate, online or offline, from one provider to another all captured by the FluidCloud open architecture specification.”

Having the ability for a cloud service to easily and seamlessly relocate from one provider to another will bring a huge disruptive, competitive advantage to any cloud computing service provider including innovative European ones. It will bring liberation to cloud services, both the application and data. It will bring service movement rights and liberation to the cloud.

To address this let us consider the key stakeholders that will be present in a future with FluidCloud present and available

BLAH

What are the advantages to these stakeholders of having FluidCloud available? More importantly what are the advantages that FluidCloud offers to end-users whose services deployed upon CSPs are potentially at risk?

BLAH

To verify the processes and framework the following architecture and implementation was created to validate the overall objectives.

# Details: Architecture Implementation Evaluation #

TODO
*Technical details*
*is the idea feasible?*

## Architecture
Core to realising FluidCloud are key architectural components. The ‘CloudConduit’ handles and coordinates the overall (partial) relocation of the service. Viaducts form a ‘path’ between cloud providers (if needed with underlying support of the network). The CloudConduit is responsible for setting up the ‘Viaduct’. Within Viaducts, ‘Migrators’ are placed on these to adapt the Application, it’s environment and if necessary data as it relocates through the Viaduct. In order to relocate a service efficiently the CloudConduit can establish multiple Viaducts. The CloudConduit analyses the service to be relocated and based on that it uses the ‘Broker’ to find suitable replacement providers. Based on the replacement providers the CloudConduit uses the Broker again to find suitable Migrators to aid the relocation process. 

## Implementation

As an first Proof of Concept (PoC) the Architecture previously has been implemented using the Python programming language. Each of the components is a standalone process which eventually communicate with each other using the Advanced Message Queuing Protocol (AMQP) implementation by RabbitMQ. 

![image0][].

The CloudConduit has capabilities to processes requests for services to be migrated. When such an relocation is triggered it inspects the services for subcomponents and their dependencies. This is done through the Open Cloud Computing Interface (OCCI) which is implemented by both Cloud Providers (OpenStack and SmartOS based) in this PoC. Based on the inspection it creates a set of task which need to be executed. The distribution of the tasks is handled by the Broker.

The Broker has not the information to instantiate the appropriate Migrators which make up the Viaduct. The Migrators now take care of the actual relocation and topology change within the service.

To test this implementation the following scenario is considered: A simple node.js application is deployed with an Virtual Machine running within the Domain of OpenStack. This Virtual Machine has a block storage attached to it through an OpenStack Volume. The node.js also makes use of the Object Storage provided by OpenStack Swift. 

Based on the performance the decision is made to trigger a relocation to a Cloud provider which uses SmartOS as an Hypervisor. 

![image1][].

After relocation the service should be composed out of an Virtual Machine running the node.js application. The application will still use the OpenStack Swift Object storage. But the attached block storage will be relocated with the Virtual Machine.

The decision for this service topology after relocation is made by the CloudConduit. So in overall to be able to relocate this simple node.js application the following Migrators need to be placed on the Viaduct:

 * OpenStack to SmartOS image converter (Hyperviros level).
 * Relocator for the OpenStack block storage to be put within the VM at SmartOS (No block storage service available at the SmartOS side).
 * Reconfiguration of the node.js application based on regex and a configuration file.

When the relocation of the data parts (image and block storage) is accomplished the Broker restarts the Virtual Machine on the target side.

This then overall demonstrates the earlier described process:

 1. the CloudConduit gets a request to migrate an application
 1. an application is a set of related VMs that make up the service
 1. each of those VMs may have associated resources - CloudConduit must determine these

## Evaluation



# Related Work #

TODO: take from SotA in proposal

# Conclusions and Further Work #

TODO
what follows from your solution

investigate the area of live relocation etc.

[image0]: img/arch.png "Architectural Overview" width=200px

[image1]: img/vm_before_after.png "The VM before and after relocation" width=200px


