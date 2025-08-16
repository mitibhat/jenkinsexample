pipeline {
    agent any
   tools {
    // a bit ugly because there is no `@Symbol` annotation for the DockerTool
    // see the discussion about this in PR 77 and PR 52: 
    // https://github.com/jenkinsci/docker-commons-plugin/pull/77#discussion_r280910822
    // https://github.com/jenkinsci/docker-commons-plugin/pull/52
    'org.jenkinsci.plugins.docker.commons.tools.DockerTool' '18.09'
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
                sh 'npm install'
            }
        }
        stage('Run Tests') {
            steps {
                sh 'npm test'
            }
        }
        stage('Build Project') {
            steps {
                sh 'npm run build' // If your project has a build step
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
