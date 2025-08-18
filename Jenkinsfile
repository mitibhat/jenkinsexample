pipeline {
    agent any
   tools {
            dockerTool 'Docker-Local' // Use the name configured in Global Tool Configuration
            nodejs 'nodejs' 
        }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/mitibhat/jenkinsexample.git' // Replace with your repository URL
            }
        }
        stage('Validate') {
            steps {
                script {
                    sh 'ls -la'
                }
            }
        }
        
       
       
        // Optional: Add a stage to build a Docker image of your Node.js app
        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to a registry (e.g., Docker Hub)
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'miti.bhat@gmail.com', passwordVariable: 'iLoveDocker#2025')]) {
                        sh "echo \$DOCKER_PASS | docker login -u \$DOCKER_USER --password-stdin"
                        sh "docker push jenkinsexample-app:latest"
                    }
                }
            }
    }
}
