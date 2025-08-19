pipeline {
  agent any
  environment {
    PATH = "C:\\Program Files\\Docker\\Docker\\resources\\bin;${env.PATH}"
    // rest of your environment variables...
}
  
    stages {
      stage("Fix the permission issue") {

            agent any

            steps {
                sh "sudo chown root:jenkins /run/docker.sock"
            }

        }
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
