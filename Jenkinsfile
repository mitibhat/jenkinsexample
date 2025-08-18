pipeline {
   agent any
   
   tools {
           dockerTool 'Docker-Local'
            nodejs 'nodejs' 
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
                    }
                }
            }
        }
         stage('Test two') {
               steps {
                  
                  script {
                    def imageName = "mitibhat/jenkinsexample-app:latest" // Customize image name
                    sh "docker build -t ${imageName} ."
                    dockerImage = imageName // Store image name for later use if needed
                }
              
            }
            }
    }
   }
