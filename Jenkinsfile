node {
    stage('Install GKE Auth Plugin') {
        // Install the GKE gcloud auth plugin before running kubectl
        sh '''
        gcloud components install gke-gcloud-auth-plugin
        export USE_GKE_GCLOUD_AUTH_PLUGIN=True
        '''
    }

    stage('Workspace Cleanup') {
        cleanWs()
    }

    stage('SCM Checkout') {
        git branch: 'main', url: 'https://github.com/rras7898/scaling-kubernetes-resources'
    }

    stage('Scaling') {
        withCredentials([file(credentialsId: 'jenkins-sa-cicd', variable: 'service')]) {
            sh "cp ${service} ./serviceaccount-${BUILD_NUMBER}.json"
            sh "ls -l"
            sh "chmod +x scale_up.sh"
            sh "chmod +x scale_down.sh"
            sh "./scale_${scale}.sh"
        }
    }

    stage('Post-build Cleanup') {
        cleanWs()
    }
}
