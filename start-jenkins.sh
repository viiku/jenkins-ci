#!/bin/bash

JENKINS_NAME="jenkins"
JENKINS_IMAGE="custom-jenkins:lts-jdk17"
JENKINS_NETWORK="jenkins-network"
JENKINS_CERT_VOLUME="jenkins-docker-certs"
JENKINS_HOST_VOLUME="jenkins-data"

# creating network for jenkins
docker create netwrok ${JENKINS_NETWORK}

# creating certs volume for jenkins
docker create volume ${JENKINS_CERT_VOLUME}

# creating volume for jenkins
docker create volume ${JENKINS_HOST_VOLUME}

# Running jenkins container
docker run \
  --name ${JENKINS_NAME} \
  --rm \
  --detach \
  --privileged \
  --network ${JENKINS_NETWORK} \
  --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume ${JENKINS_CERT_VOLUME}:/certs/client \
  --volume ${JENKINS_HOST_VOLUME}:/var/jenkins_home \
  --publish 2376:2376 \
  docker:dind \
  --storage-driver overlay2
  ${JENKINS_IMAGE}