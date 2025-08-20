pipeline {
 
 agent any
    environment {
    PATH = "/usr/bin:C:/Program Files/Docker/Docker/resources/bin;${env.PATH}"
    
}

    stages {
     stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/mitibhat/jenkinsexample.git' // Replace with your repository URL
            }
        }
       stage('Run Sudo Command') {
            steps {
                sh 'sudo apt update' // Example: updating package lists
                sh 'sudo systemctl restart my-service' // Example: restarting a service
            }
        }
        
        stage('Test') {
                steps {
                   script {
                    sh "echo 'Testing inside Docker container...'"
                    sh 'echo $PATH'
                    // Add your test commands here
                }
            }
        }
         stage('Hello') {
                steps {
                   script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials',usernameVariable: 'USERNAME',passwordVariable: 'PASSWORD')]){
                     sh "echo $USERNAME"
                       
                     sh "echo $PASSWORD"
                       sh "sudo docker tag node-app-test-new ${env.USERNAME}/node-app-test-new:latest"
                       sh "sudo docker login -u ${env.USERNAME} -p ${env.PASSWORD}"
                       sh "sudo docker push ${env.USERNAME}/jenkinsexample-app:latest"

                    }
                }
            }
        }
    }
   }
