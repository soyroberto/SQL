https://www.ibm.com/docs/en/integration-bus/10.0?topic=ims-information-management-system
# IBM Information Management System (IMS)

Last Updated: 2023-06-21

IMS is a message-based transaction manager and hierarchical-database manager for z/OS®. External applications can use transactions to interact with applications that run inside IMS.

#week1 

IMS includes two components:

IMS Database Manager (IMS DB)

A database management system for defining database structure, organizing business data, performing queries against the data, and performing database transactions.

IMS Transaction Manager (IMS TM)

A message-based transaction manager for processing input and output messages. IMS TM manages message queuing, security, scheduling, formatting, logging, and recovery.

In addition to these components, IMS Connect manages communications for IMS, connecting one or more clients with one or more IMS systems. IMS Connect also handles workload balancing, and supports the IBM® supplied client, the IMS TM resource adapter.

The following diagram shows the layers of communication between IBM Integration Bus and IMS.

![The diagram shows how the products can connect to IMS.](https://www.ibm.com/docs/en/SSMKHH_10.0.0/com.ibm.etools.mft.doc/ac6615010V9.gif)

You can also use the following methods to connect to an IMS system:

- **The WebSphere® MQ-IMS bridge**
    
    The WebSphere MQ-IMS bridge is a component of WebSphere MQ for z/OS. You can use it to access applications on your IMS system from WebSphere MQ applications. For more information about the WebSphere MQ-IMS bridge, see [WebSphere MQ Version 7.5 product documentation online](http://www.ibm.com/support/knowledgecenter/SSFKSJ_7.5.0/ "(Opens in a new tab or window)").
    
- **The IMS SOAP Gateway**
    
    The IMS SOAP Gateway is a web service solution that integrates IMS assets in a Service-Oriented Architecture (SOA) environment. For more information, see [IMS SOAP Gateway web page](http://www-01.ibm.com/software/data/ims/soap/ "(Opens in a new tab or window)").
    

For more details about how IMS works with IBM Integration Bus, see [IMS nodes](https://www.ibm.com/docs/en/SSMKHH_10.0.0/com.ibm.etools.mft.doc/ac66150_.html "IBM Integration Bus message flows use IMS nodes to call programs that are running in IMS.").

For further information about IMS and its components, see the [IBM Information Management Software Library web page](http://www.ibm.com/software/data/ims/library/ "(Opens in a new tab or window)"), which contains links to the IMS information center and associated IBM Redbooks® publications.
