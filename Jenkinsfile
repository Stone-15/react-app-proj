pipeline {  
    agent any  

    stages {  
        stage('Checkout') {  
            steps {  
                script {  
                    // Checkout the current branch  
                    checkout scm  
                }  
            }  
        }  
        stage('Build') {  
            steps {  
                script {  
                    // List files and print working directory for debugging  
                    sh 'ls'  
                    sh 'pwd'  
                    // Execute the build script  
                    sh 'bash build.sh'  
                }  
            }  
        }  
        stage('Push to Docker Hub') {  
            steps {  
                script {  
                    def imageName = "proj-img" // Define your image name  

                    // Use the environment variable to determine the branch  
                    if (env.BRANCH_NAME == 'dev') {  
                        sh "docker tag ${imageName} joshdoc/dev:${imageName}:latest" // Use your Docker Hub username  
                        sh "docker push joshdoc/dev:${imageName}:latest"  
                    } else if (env.BRANCH_NAME == 'master') {  
                        sh "docker tag ${imageName} joshdoc/prod:${imageName}:latest" // Use your Docker Hub username  
                        sh "docker push joshdoc/prod:${imageName}:latest"  
                    } else {  
                        echo "No matching branch for Docker push. Current branch: ${env.BRANCH_NAME}"  
                    }  
                }  
            }  
        }  
        stage('Deploy') {  
            steps {  
                script {  
                    // Execute the deployment script  
                    sh 'bash deploy.sh'  
                }  
            }  
        }  
    }  
}

