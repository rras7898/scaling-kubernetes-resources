node {
    stage('SCM Checkout') {
      git branch: 'main', url: 'https://github.com/rras7898/scaling-kubernetes-resources'
    }

    stage('Scaling') {
        withCredentials([file(credentialsId: 'jenkins-sa-cicd', variable: 'service')]) {
        sh "cp ${service} ./serviceaccount-${BUILD_NUMBER}.json"
        sh "ls -l"
        sh "chmod +x scale_up.sh"
        sh 'chmod +x scale_down.sh'
        sh "./scale_${scale}.sh"
        // sh '''
        //     sa=$(jq -r '.client_email' ./serviceaccount-${BUILD_NUMBER}.json)
        //     echo $sa
        //     gcloud auth revoke $sa
        '''
        cleanWs()
        }
    }
}
