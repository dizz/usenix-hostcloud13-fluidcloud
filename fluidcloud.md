Base Header Level: 3

# Notes #

5 pages of double column

# Abstract #

Cloud computing is about bringing to users new levels of being connected, instead of the once disconnected PC type systems.  This proposal extends that level of connectedness in the cloud so that cloud services hosted by providers can relocate between clouds. The vision is that one cloud service provider will be able to connect with another and relocate services between each at the command of the service owners. In this world of competing cloud standards and software solutions, each partially complete, this work's central research question is:

"How to intrinsically enable and fully automate relocation of services between clouds?"

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

The main scientific and technological objective in FluidCloud is to realise:“Cloud Fluidity, the processes, mechanisms, interfaces, software frameworks and tooling that enables cloud services to relocate, online or offline, from one provider to another all captured by the FluidCloud open architecture specification.”Having the ability for a cloud service to easily and seamlessly relocate from one provider to another will bring a huge disruptive, competitive advantage to any cloud computing service provider including innovative European ones. It will bring liberation to cloud services, both the application and data. It will bring service movement rights and liberation to the cloud.
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

Python implementation, show concrete architecture?

Describe testing environment. It should have some sort of realistic workload (e.g. a wordpress app?)


CloudConduit:

 * processes requests for services to be migrated
 * inspects services for subcomponents and their dependencies
 * generates a tasks list - migration manifest 
 * these tasks are distributed to migrators either in parallel or sequentially ?

Migrators:

 * OpenStack migrator
 * VM image migrator (converter)
 * SDC (?) migrator

Process:

 * the CloudConduit gets a request to migrate an application
 * an application is a set of related VMs that make up the service
 * each of those VMs may have associated resources - CloudConduit must determine these


## Evaluation



# Related Work #

TODO: take from SotA in proposal

# Conclusions and Further Work #

TODO
what follows from your solution

investigate the area of live relocation etc.

