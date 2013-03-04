#!/bin/bash

# copy CLI jar
env cp /var/cache/jenkins/war/WEB-INF/jenkins-cli.jar /tmp/jenkins-cli.jar
    #wget -q -O /tmp/jenkins-cli.jar \
    #http://localhost:8080/jnlpJars/jenkins-cli.jar > /dev/null

# update plugins
env curl -s -L http://updates.jenkins-ci.org/update-center.json | sed '1d;$d' |\
    curl -s -X POST -H 'Accept: application/json' -d @- \
    http://localhost:8080/updateCenter/byId/default/postBack > /dev/null

# install plugins
env java -jar /tmp/jenkins-cli.jar -s http://localhost:8080 install-plugin \
                                                            git \
                                                            checkstyle \
                                                            cloverphp \
                                                            dry \
                                                            htmlpublisher \
                                                            jdepend \
                                                            plot \
                                                            pmd \
                                                            violations \
                                                            xunit > /dev/null

# restart service
env java -jar /tmp/jenkins-cli.jar -s http://localhost:8080 safe-restart
