# mvn-ref-test01

##  Overview

This is a simple setup of 4 repositories whereby we are trying to implement a release and deployment process suitable for us to use in our Java projects.  The first three projects or simple libraries and an application The 4th project is an attempt to simplify the Github Actions by writing a consolidated action to simplify the workflows needed to be for the other projects.

##  Reference projects

*   [https://github.com/normanstrydom/mvn-ref-test01 - Simple library](https://github.com/normanstrydom/mvn-ref-test01)
*   [https://github.com/normanstrydom/mvn-ref-test02 - User of simple library](https://github.com/normanstrydom/mvn-ref-test02)
*   [https://github.com/normanstrydom/mvn-ref-test03 - Web app referencing test01 and 02](https://github.com/normanstrydom/mvn-ref-test03)
*   [https://github.com/normanstrydom/mvn-ref-test-release-action - Action to standardise the release](https://github.com/normanstrydom/mvn-ref-test-release-action)

##  Code setup

### Local development - Code details

This is the initial code generation for subsequent work and testing.

*   JAVA_HOME=F:\java\openlogic-openjdk-17.0.18+8-windows-x64
*   MVN_HOME=F:\java\apache-maven-3.9.13
*   4 maven projects
    *   mvn-ref-test01 - location F:\git-work\mvn-ref-test01
    *   mvn-ref-test02 - location F:\git-work\mvn-ref-test02
    *   mvn-ref-test03 - location F:\git-work\mvn-ref-test03
    *   mvn-ref-test-release-action - location F:\git-work\mvn-ref-test-release-action
*   mvn-ref-test01 - a library project consisting of parent project and submodules,
    *   mathfcns
    *   stringfcns
    *   bom for importing by projects using mvn-ref-test01
*   mvn-ref-test02 - a console application that references mvn-ref-test01
*   mvn-ref-test03 - a simple web app using mvn-ref-test01 and mvn-ref-test02
*   mvn-ref-test-release-action - an attempt to srite standard actions to simplify the workflow source

The code is not intended to do anything worthwhile. All we're trying to prove is the deployment and release process. 


