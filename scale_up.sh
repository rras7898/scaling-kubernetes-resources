#!/bin/bash

gcloud auth activate-service-account --key-file=./serviceaccount-${BUILD_NUMBER}.json
gcloud container clusters get-credentials rohit-gke-cluster --zone us-central1-b --project apt-bpl
context=gke_apt-bpl_us-central1-b_rohit-gke-cluster

###################################################################

if [ "$project" == 'digipass' ]
then

    kubectl -n digipass scale deployment --all --replicas=1 --context $context
    echo "Digipass has been scaled up now"


fi    


if [ "$project" == 'smartwealth' ]
then

    kubectl -n smartwealth scale deployment --all --replicas=2 --context $context
    echo "Smartwealth has been scaled up now"


fi    


if [ "$project" == 'goldloan' ]
then

    kubectl -n goldloan scale deployment --all --replicas=3 --context $context
    echo "Goldloan has been scaled up now"


fi
