# packaging and running
current=${PWD}
runDir="webanno-webapp/src/main/docker"
package="webanno-webapp/target/webanno-standalone-3.6.0-SNAPSHOT.jar"

mvn clean install -Drat.skip=true
cp ${package} ${runDir}
cd ${runDir}
docker-compose up -d
cd ${current}