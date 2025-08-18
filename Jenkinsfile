pipeline {
   agent any
   environment {
          PATH = "C:\\Program Files\\Docker\\Docker\\resources\\bin;${env.PATH}"
      }
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
        stage('Test') {
                steps {
                   script {
                    sh 'echo "Testing inside Docker container..."'
                    // Add your test commands here
                }
            }
        
      
}
}
   }
