# karate-template
Clone this repo 
```
git clone https://github.com/rommelayala/karate-template.git
```

1.- Execute App
```
cd src/test/resources:

/jar
currently I am using this app [https://github.com/rommelayala/customer-back/blob/main/README.md]

java -jar [customer-0.0.1-SNAPSHOT.jar]
http://localhost:8080/swagger-ui/index.html

/node
???

/docker
???

```
Executing test
```java
execute all test in the root of the app where pom.xml is

mvn test -Dkarate.options="--tags @smoke"
mvn test -Dkarate.options="-t @smoke"
```
Execute test in parallel with cucumber report
```java
mvn test -Dkarate.options="--tags @smoke" -DthreadCount=2 -Dcucumber.options="--plugin html:target/cucumber-html-report"
mvn test -Dkarate.options="-t @smoke" -DthreadCount=2 -Dcucumber.options="--plugin html:target/cucumber-html-report"
```
