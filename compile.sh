# packaging and running
current=${PWD}
runDir="webanno-webapp/src/main/docker"
package="webanno-webapp/target/webanno-standalone-3.6.0-SNAPSHOT.jar"

mvn clean install -Drat.skip=true
cp -rf ${package} ${runDir}
cd ${runDir}
docker image build -t lusoftware/webanno .
docker-compose up -d
cd ${current}