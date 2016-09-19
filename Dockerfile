FROM tomcat:8.0-jre8

RUN $JAVA_HOME/bin/keytool -genkey -alias tomcat -keyalg RSA -storepass changeit -keypass changeit -dname "CN=example.com,OU=,O=,L=,S=,C=SE"

RUN sed -i 's/<\/Engine>/<\/Engine><Connector port="8443" protocol="org.apache.coyote.http11.Http11NioProtocol" maxThreads="150" SSLEnabled="true" scheme="https" secure="true" clientAuth="false" sslProtocol="TLS" \/>/' conf/server.xml

EXPOSE 8080 8443
CMD ["catalina.sh", "run"]
