#!/bin/bash

gcloud auth activate-service-account --key-file=./serviceaccount-${BUILD_NUMBER}.json
gcloud container clusters get-credentials cluster-1 --zone us-central1-c --project apt-bpl
context=gke_apt-bpl_us-central1-c_cluster-1

###################################################################

if [ "$env" == 'dict' ]
then

    kubectl -n test scale deployment --all --replicas=2 --context $context
    echo "Digipass has been scaled down now"


fi    


# if [ "$env" == 'gcanada' ]
# then

#     env_name="GoogleCanada"

#     kubectl -n gcanada scale deployment --all --replicas=1 --context $context
#     echo "$env_name has been scaled up now"


# fi
