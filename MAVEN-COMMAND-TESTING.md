#   MAVEN-COMMAND-TESTING

$env:JAVA_HOME="F:\java\openlogic-openjdk-17.0.18+8-windows-x64"
$env:MVN_HOME="F:\java\apache-maven-3.9.13"

$env:PATH="c:\windows;c:\windows\system32;$env:JAVA_HOME\bin;$env:MVN_HOME\bin"

mvn versions:set -DgenerateBackupPoms=false

mvn release:prepare
