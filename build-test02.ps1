$env:JAVA_HOME="F:\java\openlogic-openjdk-17.0.18+8-windows-x64"
$env:MVN_HOME="F:\java\apache-maven-3.9.13"

& "$env:MVN_HOME\bin\mvn.cmd" -f ../mvn-ref-test02/pom.xml clean install -DskipTests