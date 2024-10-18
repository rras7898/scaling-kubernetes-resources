#!/bin/bash

gcloud auth activate-service-account --key-file=./serviceaccount-${BUILD_NUMBER}.json
gcloud container clusters get-credentials rohit-gke-cluster --zone us-central1-b --project apt-bpl
gcloud container clusters get-credentials cluster-1 --zone us-central1-b --project apt-bpl
context1=gke_apt-bpl_us-central1-b_rohit-gke-cluster
context2=gke_apt-bpl_us-central1-b_cluster-1

############################################### HDFC Bank Cluster ####################################################################

if [ "$project" == 'digipass' ]
then

    kubectl -n digipass scale deployment --all --replicas=0 --context $context1
    echo "Digipass has been scaled down now"


fi    


if [ "$project" == 'smartwealth' ]
then

    kubectl -n smartwealth scale deployment --all --replicas=0 --context $context1
    echo "Smartwealth has been scaled down now"


fi    


if [ "$project" == 'goldloan' ]
then

    kubectl -n goldloan scale deployment --all --replicas=0 --context $context1
    echo "Goldloan has been scaled down now"


fi

############################################### HDFC Product Cluster #################################################################

if [ "$project" == 'sip' ]
then

    kubectl -n sip scale deployment --all --replicas=0 --context $context2
    echo "SIP has been scaled down now"


fi

if [ "$project" == 'insurance' ]
then

    kubectl -n insurance scale deployment --all --replicas=0 --context $context2
    echo "Insurance has been scaled down now"


fi
