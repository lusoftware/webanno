# packaging and running
export WEBANNO_HOME=${PWD}
export WEBANNO_PORT="8080"
export MYSQL_PORT="3306"
runDir="webanno-webapp/src/main/docker"
package="webanno-webapp/target/webanno-standalone-3.6.0-SNAPSHOT.jar"

mvn clean install -Drat.skip=true -Dcheckstyle.skip=true
cp -rf ${package} ${runDir}
cd ${runDir}
docker image build -t lusoftware/webanno .
docker-compose up -d
cd ${WEBANNO_HOME}