#!/bin/bash

JENKINS_NAME="jenkins"
JENKINS_IMAGE="custom-jenkins:lts-jdk17"
JENKINS_NETWORK="jenkins"
JENKINS_HOST_VOLUME="jenkins-data"

# creating network for jenkins
docker create netwrok ${JENKINS_NETWORK}

# creating volume for jenkins
docker create volume ${JENKINS_HOST_VOLUME}

# Running jenkins container
docker run --detach --name ${JENKINS_NAME} \
    --network ${JENKINS_NETWORK} \
    --volume ${JENKINS_HOST_VOLUME}:/home/jenkins
    ${JENKINS_IMAGE}
