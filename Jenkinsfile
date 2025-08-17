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
        stage('Install Dependencies') {
            steps {
                script{
                sh 'npm install'
                }
            }
        }
       
        stage('Build Project') {
            steps {
                script{
                sh 'npm run build' // If your project has a build step
            }
            }
        }
        // Optional: Add a stage to build a Docker image of your Node.js app
        stage('Build Docker Image') {
            steps {
                script {
                    // Assuming you have a Dockerfile in your repository root
                    sh 'docker build -t jenkinsexample-app:latest .'
                }
            }
        }
    }
}
