pipeline {
   agent {
            docker {
                image 'jenkins/jenkins:lts' // Use the official Jenkins LTS image
                args '-p 8080:8080 -p 50000:50000' // Example port mappings
            }
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
