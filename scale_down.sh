#!/bin/bash

gcloud auth activate-service-account --key-file=./serviceaccount-${BUILD_NUMBER}.json
gcloud container clusters get-credentials rohit-gke-cluster --zone us-central1-b --project apt-bpl
context=gke_apt-bpl_us-central1-b_rohit-gke-cluster

###################################################################

if [ "$env" == 'dict' ]
then

    kubectl -n test scale deployment --all --replicas=0 --context $context
    echo "Digipass has been scaled down now"


fi    


# if [ "$env" == 'gcanada' ]
# then

#     env_name="GoogleCanada"

#     kubectl -n gcanada scale deployment --all --replicas=1 --context $context
#     echo "$env_name has been scaled up now"


# fi
