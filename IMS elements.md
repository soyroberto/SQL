https://aandds.com/blog/ims.html


#week1 
### **IBM IMS Key Components (to be shown in diagram)**

1. **IMS Database Manager (DB)**
    
    - Handles hierarchical databases (DL/I access)
        
    - Supports fast, high-volume transaction processing
        
    - Uses VSAM and OSAM datasets
        
2. **IMS Transaction Manager (TM)**
    
    - Also known as IMS TM or IMS/DC (Data Communication)
        
    - Manages user input/output and message queueing
        
    - Interfaces with terminals and applications
        
3. **DL/I (Data Language/I)**
    
    - API for accessing IMS databases
        
    - Used by applications to interact with data via calls
        
4. **Message Queue**
    
    - Stores inbound/outbound messages temporarily
        
    - Ensures asynchronous communication
        
5. **Application Programs**
    
    - Written in COBOL, PL/I, Assembler, etc.
        
    - Access data through DL/I
        
    - Run under IMS TM control
        
6. **Terminals or External Interfaces**
    
    - 3270 terminals or modern APIs via IMS Connect
        
    - Allow external users/applications to send/receive transactions
        
7. **IMS Connect**
    
    - Interfaces IMS with TCP/IP applications (e.g., Java or web apps)
        
    - Facilitates SOA and API-based architectures




## 1. IMS and the Apollo program
[[01-05-25]]
On May 25, 1961, United States President John F. Kennedy challenged American industry to send an American man to the moon and return him safely to earth, thus launching the Apollo program. North American Aviation, in partnership with IBM®, fulfilled the requirement for an automated system to manage large bills of material for the construction of the spacecraft in 1965. In 1966, the IBM and North American Aviation teams were joined by three members from Caterpillar Tractor. **Together, they designed and developed a system that was called Information Control System and Data Language/Interface (ICS/DL/I).**  

The IBM team completed and shipped the first release of ICS in Los Angeles in 1967, and in April 1968, ICS was installed. The first “READY” message was displayed on an IBM 2740 typewriter terminal at the Rockwell Space Division at NASA in Downey, California, on August 14, 1968. Less than a year later, on July 20, 1969, Apollo 11 landed on the moon's surface. **ICS was subsequently relaunched as Information Management System/360 (IMS/360) and made available to the IT world.**

- ![[Pasted image 20250501132207.png]]

## 2. Overview of the IMS product

**IMS™ consists of three components: 

IMS Database Manager (IMS DB), 
IMS Transaction Manager (IMS TM), 
and a set of system services that provide common services to IMS DB and IMS TM.**  

Often referred to collectively as IMS DB/DC (DC stems from the original name for the IMS Transaction Manager: Data Communications), these components comprise a complete online transaction and database processing environment that provides continuous availability and data integrity. IMS delivers accurate, consistent, timely, and critical information to application programs, which in turn deliver the information to many end users and programs.  

IMS has been developed to provide an environment for applications that require very high levels of performance, throughput, and availability. IMS runs on z/OS® and on zSeries® hardware, and uses many of the facilities offered by the operating system and hardware.  

IMS TM and IMS DB can be ordered separately if both components are not required. The appropriate system services are provided for the components that are ordered. **When IMS DB is ordered by itself, it is called DB Control (DBCTL). When IMS TM is ordered by itself, it is called DC Control (DCCTL).**

## 3. IMS DB

**IMS uses a hierarchical model as the basic method of storing data.** Unlike the relational model used by DB2, which was the result of theoretical work, the hierarchical model was arrived at as a pragmatic way of **storing and retrieving data quickly while using as few computer resources as possible**.  

### 3.1. How data is stored in a database

The data in a database is grouped into a series of database records. Each database record is composed of smaller groups of data called segments. A segment is the smallest piece of data IMS can store.  

The figure [2](https://aandds.com/blog/ims.html#org0000010) shows a record in a school database. Each of the b
oxes is a segment in the database record.  

![ims_segment_types_in_school_database.gif](https://aandds.com/blog/images/ims_segment_types_in_school_database.gif)  

Figure 2: Segment types in the school database record