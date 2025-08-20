pipeline {
 
 agent any
    

    stages {
     stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/mitibhat/jenkinsexample.git' // Replace with your repository URL
            }
        }
      stage('Get User') {
            steps {
                script {
                    def currentUser = sh(returnStdout: true, script: 'id -un').trim()
                    echo "The user running this pipeline is: ${currentUser}" 
                }
            }
        }
        stage('Test') {
                steps {
                   script {
                    sh "echo 'Testing inside Docker container...'"
                    sh 'echo $PATH'
                    //docker images
                    // Add your test commands here
                }
            }
        }
     stage('Only docker'){
      steps{
       docker tag jenkinsexample-app-test:jenkinsexample-app:latest
      }
     }
         stage('Hello') {
                steps {
                   script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials',usernameVariable: 'USERNAME',passwordVariable: 'PASSWORD')]){
                     sh "echo $USERNAME"
                       
                     sh "echo $PASSWORD"
                       
                       sh "sudo docker login -u ${env.USERNAME} -p ${env.PASSWORD}"
                       sh "sudo docker push ${env.USERNAME}/jenkinsexample-app:latest"

                    }
                }
            }
        }
    }
   }
