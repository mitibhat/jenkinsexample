pipeline {
 
   agent {
       docker 'maven:3.9.3-eclipse-temurin-17' 
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
                       sh "docker tag node-app-test-new ${env.USERNAME}/node-app-test-new:latest"
                       sh "docker login -u ${env.USERNAME} -p ${env.PASSWORD}"
                       sh "docker push ${env.USERNAME}/jenkinsexample-app:latest"

                    }
                }
            }
        }
    }
   }
