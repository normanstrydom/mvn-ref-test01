# mvn-ref-test01

##  Code setup

### Local development - Initial project setup

This is the initial code generation for subsequent work and testing.

Do not generate unit tests - main code and functions only.

*   JAVA_HOME=F:\java\openlogic-openjdk-17.0.18+8-windows-x64
*   MVN_HOME=F:\java\apache-maven-3.9.13
*   2 maven projects
    *   mvn-ref-test01 - location F:\git-work\mvn-ref-test01
    *   mvn-ref-test02 - location F:\git-work\mvn-ref-test02
*   mvn-ref-test01 - a library project consisting of parent project and submodules,
    *   mathfcns
    *   stringfcns
    *   bom for importing by projects using mvn-ref-test01
*   mvn-ref-test02 - a console application that references mvn-ref-test01
*   package names - com.devtest.test01 and com.devtest.test02
*   create project poms, required sub-modules and sample soucrce