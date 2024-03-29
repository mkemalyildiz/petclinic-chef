#
# Cookbook:: petclinic
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
tomcat_install "petclinicserver" do
 version '8.0.36'
end
tomcat_service "petclinicserver" do
 action [:enable, :start]
 env_vars [{'CATALINA_BASE' =>
'/opt/tomcat_petclinicserver_8_0_36/'},{'CATALINA_PID' =>
'$CATALINA_BASE/bin/tomcat.pid'},{'JAVA_OPTS' =>
'-Djava.net.preferIPv4Stack=true -Djava.net.preferIPv4Addresses=true'}]
end
remote_file '/opt/tomcat_petclinicserver_8_0_36/webapps/petclinic.war' do
 source 'http://127.0.0.1:8081/libs-snapshot-local/org/springframework/samples/spring-petclinic/1.0.1-SNAPSHOT/spring-petclinic-1.0.1-20190716.103818-1.war'
 owner 'tomcat_petclinicserver'
 group 'tomcat_petclinicserver'
end
 directory '/home/tomcat_petclinicserver' do
 owner 'tomcat_petclinicserver'
 group 'tomcat_petclinicserver'
 mode 0755
end
