node {
    // Clean up workspace before starting the build to ensure a fresh environment
    stage('Workspace Cleanup') {
        cleanWs()
    }

    stage('SCM Checkout') {
        // Check out the code from the Git repository
        git branch: 'main', url: 'https://github.com/rras7898/scaling-kubernetes-resources'
    }

    stage('Scaling') {
        // Using credentials for the service account JSON file
        withCredentials([file(credentialsId: 'jenkins-sa-cicd', variable: 'service')]) {
            // Copy service account file with unique build number
            // sh "cp ${service} ./serviceaccount-${BUILD_NUMBER}.json"
            
            // List files to verify the service account file is present
            sh "ls -l"
            
            // Make the scale up and scale down scripts executable
            sh "chmod +x scale_up.sh"
            sh "chmod +x scale_down.sh"
            
            // Execute either scale_up or scale_down based on the 'scale' environment variable
            sh "./scale_${scale}.sh"
            
            // (Optional) If you want to revoke the service account, uncomment this block
            /*
            sh '''
                sa=$(jq -r '.client_email' ./serviceaccount-${BUILD_NUMBER}.json)
                echo $sa
                gcloud auth revoke $sa
            '''
            */
        }
    }

    // Final clean up of workspace after the job completes
    stage('Post-build Cleanup') {
        cleanWs()
    }
}
