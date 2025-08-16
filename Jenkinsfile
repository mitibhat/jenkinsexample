pipeline {
    agent any // Specifies that the pipeline can run on any available agent

    environment {
        // Define environment variables specific to your Node.js application
        NODE_ENV = 'development' 
    }

    stages {
        stage('Checkout') {
            steps {
                // Clones your Git repository
                git branch: 'main', url: 'https://github.com/mitibhat/jenkinsexample.git' 
            }
        }

        stage('Install Dependencies') {
            steps {
                // Installs Node.js dependencies
                sh 'npm install' 
            }
        }

        stage('Run Tests') {
            steps {
                // Executes your application's tests
                sh 'npm test' 
            }
        }

        stage('Build (Optional)') {
            steps {
                // If your application requires a build step (e.g., for frontend assets)
                sh 'npm run build' 
            }
        }

        stage('Deploy (JenkinsExample)') {
            steps {
                // Example deployment step: restart the application using PM2
                // This assumes PM2 is installed and configured on the target server
                sh 'pm2 restart all || pm2 start server.js --name jenkinsexample-app' 
            }
        }
    }
}