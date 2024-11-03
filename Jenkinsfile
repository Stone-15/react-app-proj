pipeline {  
    agent any  

    environment {  
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub') // Replace with your Docker Hub creds ID  
        GITHUB_CREDENTIALS = credentials('github-id') // Replace with your GitHub creds ID  
    }  

    stages {  
        stage('Checkout') {  
            steps {  
                checkout scm  
            }  
        }  
        
        stage('Build Image for Dev') {  
            when {  
                branch 'dev'  
            }  
            steps {  
                script {  
                    sh './build.sh'  
                    withDockerRegistry([credentialsId: DOCKER_HUB_CREDENTIALS, url: '']) {  
                        sh 'docker tag your-image dev:latest' // Tag your image accordingly  
                        sh 'docker push your-dockerhub-username/dev:latest'  
                    }  
                }  
            }  
        }  

        stage('Build Image for Prod') {  
            when {  
                branch 'master'  
            }  
            steps {  
                script {  
                    sh 'docker tag your-image prod:latest' // Tag accordingly  
                    sh 'docker push your-dockerhub-username/prod:latest'  
                }  
            }  
        }  

        stage('Deploy') {  
            steps {  
                script {  
                    sh './deploy.sh'  
                }  
            }  
        }  
    }  
    
    post {  
        success {  
            notify('Success')  
        }  
        failure {  
            notify('Failure')  
        }  
    }  
}  

void notify(String msg) {  
    // Custom notification function (could be an email or Slack notification)  
    echo msg  
}