# Subsumption experiment repository

This repository contains the data utilized to check the data flow subsumptions and analyze their effectiveness and cost. The repository structure is presented below.

```
.../subsumption-experiment/
|
+-- scripts: scripts to perform checks and compute data.
|
+-- jaguar-data: data from the execution of modified jaguar.
|
+-- subsumption-data: data from the execution of satool.
|
+-- programs: source & object programs used in the checks.
|
+-- satool: jar files with two versions of satool to collect effectiveness and time data
|
+-- tools/javancss-32.53: javancss tool to collect metrics
```
##  ```scripts``` directory. 

The scripts described below are supposed to be run on the ``scripts`` folder.

### Data preparation scripts

* **comparison.py**. This python program checks whether the DUAs identified by SAtool are the same one identified by our modified version of Jaguar. It uses the data in the ``jaguar-data`` and ``subsumption-data`` directories to carried out the checks.

* **comparisonbatch.sh**. Runs **comparison.py** for all subject programs at once.

### Metrics collection scripts

* **javancssbatch.sh**. Runs javancss for all programs to collect metrics. Data are saved on ```subsumption-data/checks-output/metrics```.

* **countmethodsjaguarexec.sh**. Counts the number of methods executed by the tests of Defects4J programs versions 1b (all defects4j programs, excepting Collections) and 25b (Collections) and Weka 3.8 for the experiment. Lang and Mockito have no testing data.

### Subsumption Algorithm (SA) correctness scripts

We list below the scripts wrtitten to check SA's correcteness.

* **checkautosubsumption.sh**. This script checks the reflexive property. The **reflexive** property implies that a DUA always subsumes itself.   It checks the occurrence of strings that indicates failure of holding the reflexive property. It uses outputs saved on ```subsumption-data/checks-output/autosubsumption``` directory to carry out the checks.

* **checkcompleteexclusiveness.sh**. This script checks the completeness and mutual exclusiveness properties.  The **completeness** property implies that  DUA unconstrained coverage should imply the coverage of all DUAs of the program; that is, no subsuming DUA is left uncovered. The **mutual exclusiveness** property establishes that an unconstrained DUAs in a leaf of data flow subsumption graph cannot occur in other leaves.  It checks the occurrence of strings that indicates failure of holding these properties on files saved on ```subsumption-data/checks-output/completeexclusiveness```.  It verifies these two properties for all methods with DUAs for all programs whilist **checkproperties.sh** checks only for executed methods. These two properties were not discussed in the paper due to lack of space and because all methods with well-formed flow graphs hold them.

* **checkproperties.sh**. This script checks several properties, namely, **completeness**, **mutual exclusiveness**, and **subsumption**. It also checks for the occurrence of methods for which no unconstrained DUA is covered (future work in the ICST2021 paper). For ICST2021 paper, this script  checks the subsumption property, which implies that every subsumed DUA should be covered whenever the subsuming DUA is. It checks the occurrence of strings that indicates failure of holding the properties on files contained in ```subsumption-data/checks-output/verification```.

* **completeexclusiveness.py**. Python program that checks the completeness and mutual exclusiveness by verifiying the json files in the ```reduce``` directories (see below the description).

* **completeexclusivenessbatch.sh**. Runs  **completeexclusiveness.py** for all programs at once. The outputs are saved on ```subsumption-data/checks-output/completeexclusiveness```.

* **verification.py**. This python program uses coverage data regarding every Junit method executed (a test) and the json files containing the list of DUAs and the unconstrained DUAs and checks the subsumption, completeness and exclusiveness properties. In adition, it verifies the occurrence of methods with no unconstrained DUAs exercised by a test. It receives as parameters the name of a class and the directories with coverage data from modified Jaguar and the json directories. It outputs the verification for each method of the class.

* **verificationallclasses.sh**. Runs **verification.py** for all classes of a program.

* **verificationbatch.sh**. Runs **verification.py** for all classes of all programs. The outputs are saved on ```subsumption-data/checks-output/verification```. Script **checkproperties.sh** uses these outputs to effectivelly check the properties.

### Data collection scripts

* **duaduasubsumebatch.sh**. Runs SAtool for all programs to find the set of unconstrained DUAs. The outputs are saved on ```subsumption-data/<ProjectI>/duaduasubsume```. Two files are generated ``duaduasubsume-<ProjectI>``, which contains the execution output for ``<ProjectId>``, and ``duaduasubsume-<ProjectI>.csv``, which tabulates the subsumption information by method for``<ProjectId>``. See  the description of ```subsumption-data``` directory for a description of these files.

* **edgesubsumebatch.sh**. Runs SAtool for all programs to find the local DUA-edge subsumption data. The outputs are saved on ```subsumption-data/<ProjectI>/edgesubsume```. Two files are generated ``edgesubsume-<ProjectI>``, which contains the execution output for ``<ProjectId>``, and ``edgesubsume-<ProjectI>.csv``, which tabulates the subsumption information by method for``<ProjectId>``. See  the description of ```subsumption-data``` directory for a description of these files.

* **nodesubsumebatch.sh**. Runs SAtool for all programs to find the local DUA-node subsumption data. The outputs are saved on ```subsumption-data/<ProjectI>/edgesubsume```. Two files are generated ``nodeesubsume-<ProjectI>``, which contains the execution output for ``<ProjectId>``, and ``nodesubsume-<ProjectI>.csv``, which tabulates the subsumption information by method for``<ProjectId>``. See  the description of ```subsumption-data``` directory for a description of these files.

* **reducebatch.sh**. Runs a different version of SAtool (**safilestool**) for all programs to find the unconstrained DUAs. This version saves the list of DUAs  as well as the unconstrained DUAs and their subsumed DUAs for each method of a class as json files. Json files are saved on ```subsumption-data/<ProjectI>/reduce```. See the description of ```subsumption-data``` directory for a description of these files.

* **timebatch.sh**. Runs SAtool 10 times to collect time data. The outputs are saved on ```subsumption-data/checks-output/timedata```. **timeaggregation.sh** should be run afterwards to aggregates the data. 

* **timeaggregation.sh**. Aggregates the time data and calculates the average after 10 executions. The outputs are saved on ```subsumption-data/checks-output/timedata```. See the description of ```subsumption-data``` directory for a description of these files.


### Data analysis scripts

* **histogramplot.r**. R script to generate the histograms of the paper.

* **subsumptionstats.r**. R script to generate effectiveness data of the data flow subsumptions for the paper.

* **timeplot.r**. Generates barplot of average time of execution for each program and the number of DUAs.


## ```subsumption-data``` directory. 
 
```
subsumption-data/
|
+-- <ProjectId>
|
+-- checks-output
```

There is one directory for each program analyzed given by the placeholder ```<ProjectId>```, being **ProjectId**: 
Chart, 
Cli,
Closure, 
Codec,
Collections,
Compress,
Csv,
Gson,
JacksonCore,
JacksonDatabind,
JacksonXml,
Jsoup,
JxPath,
Lang,
Math,
Mockito,
Time, and
Weka.
``` checks-output``` directory contains data regarding all programs.

We have the following directories below each ```<ProjectId>``` directory:
```
 <ProjectId>/
|
+-- duaduasubsume
|
+-- edgesubsume
|
+-- nodesubsume
|
+-- reduce
```
  
Directories ```duaduasubsume, edgesubsume```, and ```nodesubsume``` contain  data used to calculate data flow subsumption effectiveness. They were obtained from **satool** execution to collect, respectively, the set of unconstrained DUAs, and local DUA-edge and local DUA-node subsumptions. Data flow subsumptions were calculated but not save on json files (see ``reduce`` folder and **reducebatch.sh** script).

There will be the following files inside each ```<ProjectId>/<subsumption>``` directory where  ```<subsumption>``` means ```duaduasubsume, edgesubsume```, and ```nodesubsume```: ```<subsumption>-<ProjectId>```, which contains **satool**'s output, and ``<subsumption>-<ProjectId>.csv``, which contians the tabulation of the data as follows. For few programs, there are ``<subsumption>-<ProjectId>.ods`` files.
 
* ```duaduasubsume-<ProjectId>.csv```: contains for each method its name, number of nodes (**Nodes**), number of edges (**Edges**), number of DUAs (**DUAs**), number of unconstrained DUAs (given by the number of leaves in the data flow subsumption graph) (**UDUAs**), number of reduced DUAs  (**RDUAs**) (given by the number of nodes of the data flow subsumption graph (**RDUAs**),  percentage of unconstrained DUAs with respect to all DUAs  (**UPerc**), percentage of reduced DUAs with respect to all DUAs  (**RPerc**), and time in seconds (**Time_s**)  and in millisseconds  (**Time_ms**) to run SA on each method. 

* ```nodesubsume-<ProjectId>.csv``` and ``edgesubsume-<ProjectId>.csv``: contains for each method its name, number of nodes (**Nodes**), number of edges (**Edges**), number of DUAs (**DUAs**), number of subsumed DUAs  (**SubDUAs**),    percentage of subsumd DUAs with respect to all DUAs  (**Perc**), and time in seconds (**Time_s**)  and in millisseconds  (**Time_ms**) to run SA on each method.


* ```<subsumption>-<ProjectId>.ods```: not present in every directory but it is the csv file saved in ods format. This file was used to verify the complexity of the most demanding methods for some ```<ProjectId>```.

```reduce```  directories  include files ```<classname>.duas.json``` and ```<classname>.sub.json``` which contain, respectively, the set of DUAs and the DUAs subsumed by the unconstrained for each method of the class. The numbers in the ```<classname>.sub.json``` file refer to DUAs of the method described in the ```<classname>.duas.json``` in which the ids of the DUAs are defined.  Important to note that SAtool analyzes DUAs in form **D(d, u, X)** or **(d, (u,u'), X)** in which **d, u,** and **u'** are nodes of the flow graph.  However, the DUAs saved in the json files utilize the form **D(L_d, L_u, X)** or **D(L_d, (L_u,L_u'), X)** where **L_d, L_u,** and **L_u'** are lines in which the definition, use, or edge use occur in the source code to maintain compatibility with Jaguar. As a result, **L_d, L_u,** and **L_u'** can be at the same line of code but in different flow graph nodes since many nodes may occur in a line as in the example below shows: 

``a = 1; if (n>10) System.out.println(a+1); else System.out.println(a-1);``


``` checks-output``` directory has the following structure:

```
 checks-output/
|
+-- all programs
|
+-- autosubsumption:
|
+-- completeexclusiveness:
|
+-- metrics:
|
+-- timedata:
|
+-- verification:
```

* ```allprograms```: contains files duaduasubsume.csv,	edgesubsume.csv, and	nodesubsume.csv	which aggregates the data for all methods of all programs; and file  subsumption-summary.txt, which contains the results of the effectiveness analysis of the DUA-DUA, DUA-edge, and DUA-node subsumption relationships. It contains   ``ReflexivePropertyIssues.odt`` and ``SubsumptionPropertyIssues.odt``. The first one lists the manual checks on issues regarding the reflexive property and the second one lists the issues regarding the subsumption property.

* ```autosubsumption```: this directory contains the output files ```autosubsumption-<ProjectId>``` from the execution of script **reducebatch.sh** with a version of the **satool** in which non well-formed flow graphs are allowed. The script **checkautosumption.sh** receives as input ```autosubsumption-<ProjectId>``` files and checks the occurrence of violations of the reflexive property of the subsumption relationship.

* ```completeexclusiveness```: we also verified two properties not presented in the paper due to lack of space.   The **completeness** property implies that  DUA unconstrained coverage should imply the coverage of all DUAs of the program; that is, no subsuming DUA is left uncovered. The **mutual exclusiveness** property establishes that an unconstrained DUAs in a leaf of data flow graph (DFS) cannot occur in other leaves. These two properties were verified for all methods after the removal of the 185 methods with non-well-formed flow graphs. We wrote a program in python **completeexclusiveness.py** that uses the json files of each class in the **reduce** directory to check these two properties. The script **completeexclusivenessbatch.sh** checks all classes of all programs.  

* ```metrics```: this directory contains the output of the execution of javancss-32.53 to find the number of lines of code. Script **javancssbatch.sh** execute javancss-32.53 for all programs.

* ``timedata``: contains files  ``Time-Data-<subsumption>-<ProjectId>.txt`` which contains the time data for each of the ten executions of satool to assess the cost of data flow subsumption calculation.  This files are generated when executing script **timebatch.sh**. File ``timedatareport.txt`` shows the average values obtained after running script **timeaggregation.sh**.

* ``` verification```:  The **subsumption** relationship implies that the subsumed DUAs should be covered whenever the subsuming DUA is. We verified this property of the unconstrained DUAs for every executed method in the tests. This directory contains the output of the execution of the scripts **verificationallclasses.sh** and **verificationbatch.sh**, which verifies the property. The first one calls the python program **verification.py** which reads the execution data (see description of the ```jaguar-data directory```) and the json files (see descrition of the ```reduce```) for each class and outputs the verification of the subsumption properties.  **verificationbatch.sh** calls **verificationallclasses.sh**  for all programs. The script **checkproperties.sh** verifies the output file of each program and lists the non conformancies. 


## ```programs``` directory. 
There is one directory for each program analyzed given by the placeholder ```<ProjectId>```, being **ProjectId**: 
Chart, 
Cli,
Closure, 
Codec,
Collections,
Compress,
Csv,
Gson,
JacksonCore,
JacksonDatabind,
JacksonXml,
Jsoup,
JxPath,
Lang,
Math,
Mockito,
Time, and
Weka.

All programs, excepting Collections and Weka, are the version 1b obtained from Defects4J repository. Collections is version 25b (first buggy version of this program) from Defects4J and Weka is version 3.8 from its own repository. To save space, we just post in this repository the file for Weka because we used a specifict version (3.8) of it. The other programs can be obtained from the defect4j directory (https://github.com/rjust/defects4j). The instructions on how extract the programs from defect4j repository is given below.  These directory constitutes the input for satool and before running any script or program all defects4j programs should be extacted and compiled and their test suite run.


## ```jaguar-data``` directory. 

We utilized a modified version of Jaguar (https://github.com/saeg/jaguar) to collect data flow coverage data for every Junit method of the test suites of the subject programs. Each of these methods are considered a separated test. 

The data in this directory are zipped tar files. They should be expanded before being used.

After that, there are one directory for each ``<program>`` where ``<program>`` can be
closure-compiler (Closure),
commons-cli (Cli),
commons-codec (Codec),
commons-collections (Collections),
commons-compress (Compress),
commons-csv (Csv),
commons-jxpath (JxPath),
commons-math (Math),
gson (Gson),
jackson-core (JacksonCore),
jackson-databind (JacksonDatabind),
jackson-dataformat-xml (JacksonXml),
jfreechart (Chart),
joda-time (Time),
jsoup (Jsoup), and
Weka (Weka).

Note that Lang and Mockito are not in this directory because we could not collect data for them using the modified jaguar.

In all directories, excepting commons-collections and Weka, there are the following subdirectories:

* ``jaguar-data/<program>/1b``: contains files ``jaguar.out`` and ``tests.out``. These files contain, respectivelly, jaguar's output and the program's output after the execution of the program's test suite.
* ``jaguar-data/<program>/1b/jaguar/.jaguar/spectra``: a file for each class, called ``<classname>.spectra``, of the program with a list of DUAs required by its methods. Each line of ``<classname>.spectra`` represents one DUA. 
* ``jaguar-data/<program>/1b/jaguar/.jaguar/matrix``: a file for each class, called ``<classname>.matrix``, of the program  listing the DUAs covered by each test. Each line of ``<classname>.spectra`` represents one test and can contain the following values: **0** (not covered),  **1** (covered), **=0** (all DUAs not covered), *-* (fail test), and *+* (pass test). If a class is not loaded during a test, its line will be **=0** to inform that all DUAs were not covered followed by **-** or **-** to inform whether the test passed or failed. If a class is loaded during a test, its line will be a sequence of **0s** and **1s** followed by **-** or **-**. The first **0** or **1** informs if the DUA in the first line of  ``<classname>.spectra`` was covered or not, the second **0** or **1** informs if the DUA in the second line of  ``<classname>.spectra`` was covered or not, and so on for the rest of class's DUAs.

In ``commons-collections`` there are the following subdirectories:

* ``jaguar-data/commons-collections/25b``:  
* ``jaguar-data/commons-collections/25b/jaguar/.jaguar/spectra``:  
* ``jaguar-data/commons-collections/25b/jaguar/.jaguar/matrix``:  

Its contents are as described above.

In ``Weka`` there are the following subdirectories:

* ``jaguar-data/Weka/output/weka``:  
* ``jaguar-data/Weka/output/weka/jaguar/.jaguar/spectra``:  
* ``jaguar-data/Weka/output/weka/jaguar/.jaguar/matrix``:  

Its contents are as described above.

# Subsumption Relationship Replication Roadmap

## Experiment directory setup

1. Clone the repository ``subsumption-experiment`` in the target computer.

## Expand zipped tar files in the jaguar-data directory

1. ``gunzip <program>.tar.gz`` where closure-compiler (Closure),
commons-cli (Cli),
commons-codec (Codec),
commons-collections (Collections),
commons-compress (Compress),
commons-csv (Csv),
commons-jxpath (JxPath),
commons-math (Math),
gson (Gson),
jackson-core (JacksonCore),
jackson-databind (JacksonDatabind),
jackson-dataformat-xml (JacksonXml),
jfreechart (Chart),
joda-time (Time),
jsoup (Jsoup), and
Weka (Weka).

2. ``tar xcf  <program>.tar``

## Extract defects4j programs

1. Install Defects4J repository (follows intructions from defect4j github repository: https://github.com/rjust/defects4j).

2. Generate the buggy version on ``programs`` directory with its defects4j identifier (e.g., Compress) and the number of the version used in the check (e.g., 1b). 

Example: 

``defects4j checkout -p Compress -v 1b -w ../programs/Compress/1b/`` (suposing you are at ``scrpts`` directory)

3. Goto to the program's version diretory:  ../programs/Compress/1b/

``cd ../programs/Compress/1b/``

4. ``defects4j compile`` (compile the program)

``Running ant (compile)...................................................... OK``

``Running ant (compile.tests)................................................ OK``

5. ``defects4j test`` (run test suite)

``Running ant (compile.tests)................................................ OK``

``Running ant (run.dev.tests)................................................ OK``

``Failing tests: 1``

  ``- org.apache.commons.compress.archivers.CpioTestCase::testCpioUnarchive``
  
6. For Collections, the first buggy version is 25b. So the same steps above should be repeated but with version 25b.

7. Weka files are already presented in github repository and in the cloned directory.

The following scripts and programs should be run from the ``scripts`` directory. Do not forget setting up **python** and **numpy** package before running the scripts below.


## Comparison of modified Jaguar and SAtool DUAs

Before checking the properties, we verify that both tools are working with the same DUAs. We wrote the **comparison.py** to compare them. You should invoke **comparisonbatch.sh** to make the comparison for all programs at once. Weka failed for 66 classes.
Do not forget setting up python.
1. ``./comparisonbatch.sh``

## Reflexive property checking and json files generation.

1. ``./reducebatch.sh`` 
2. ``./checkautosubsumption.sh``

## Completeness and Mutual exclusiveness properties check

This step aims at checking the completeness and Mutual exclusiveness properties. 
Do not forget setting up **python** and **numpy** package before running the scripts below.

1. ``./completeexclusivenessbatch.sh``
2. ``./checkcompleteexclusiveness.sh``

## Reflexive, Completeness and Mutual exclusiveness properties check

Do not forget setting up **python** and **numpy** package before running the scripts below.

1. ``./verificationbatch.sh``
2. ``./checkproperties.sh``

## Effectiveness data collection 

1. ``./nodesubsumebatch.sh``
2. ``./edgesubsumebatch.sh``
3. ``./duaduasubsumebatch.sh``

## Time data collection 

1. ``./timebatch.sh``
2. ``./timeaggregation.sh``

## Effectiveness statistics

Do not forget to install R and  filling up variable **yourpath** before running the script.

1. ``RScript subsumptionstats.r``

