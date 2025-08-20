pipeline {
 
agent any
 environment {
    PATH = "/usr/local/bin:C:/Program Files/Docker/Docker/resources/bin;${env.PATH}"
    
}

    stages {
     stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/mitibhat/jenkinsexample.git' // Replace with your repository URL
            }
        }
      
        stage('Test') {
                steps {
                 script {
                    sh "echo 'Testing inside Docker container...'"
                    sh 'echo $PATH'
                   
                }
            }
        }
    stage('Build Docker Image') {
            steps {
                script {
                    docker.build("jenkinsexample-app:${env.BUILD_NUMBER}")
                }
            }
        }
         stage('Hello') {
                steps {
                   script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials',usernameVariable: 'USERNAME',passwordVariable: 'PASSWORD')]){
                     sh "echo $USERNAME"
                       
                     sh "echo $PASSWORD"
                       sh "docker tag jenkinsexample-app ${env.USERNAME}/jenkinsexample-app:latest"
                       sh "docker login -u ${env.USERNAME} -p ${env.PASSWORD}"
                       sh "docker push ${env.USERNAME}/jenkinsexample-app:latest"

                    }
                }
            }
        }
    }
   }
