pipeline {
 
 agent {
            docker {
                image 'maven:3.8.1-jdk-11'
                args '-v /var/run/docker.sock:/var/run/docker.sock' // Expose socket
            }
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
