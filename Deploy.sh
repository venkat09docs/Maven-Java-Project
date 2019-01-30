export CATALINA_HOME=/u01/batch7/tomcat8_2
cd $CATALINA_HOME/bin
./shutdown.sh
sleep 20
cd $CATALINA_HOME/webapps
cp webapp-1.0.war webapp-1.0.war_bkp
cd $CATALINA_HOME/temp
rm -rf *
cd $CATALINA_HOME/work
rm -rf *
cd $CATALINA_HOME/webapps
wget http://192.168.1.11:8090/nexus/content/repositories/releases/com/rns/simpleweb/$artifactId/$version/$artifactId-$version.war
cd $CATALINA_HOME/bin
./startup.sh
sleep 30
curl http://192.168.1.11:9000/$artifactId-$version/
if [ $? -eq 0 ]
then 
   echo "Application hosted successfully"
else
   echo "Hosting failed"
fi
