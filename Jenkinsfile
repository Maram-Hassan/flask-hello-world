pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials') // Change to your actual credentials ID
        IMAGE_NAME = 'maramhassan95/flask-hello-world-web' // Replace with your Flask Docker Hub repo name
    }
    stages {
        stage('Clone Repository') {
            steps {
                script {
                    sh 'rm -rf simple-dockerfile' // Remove any existing directory
                    sh 'git clone https://github.com/Maram-Hassan/flask-hello-world.git' // Clone the repository
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh "docker build -t ${IMAGE_NAME}:latest simple-dockerfile"
                }
            }
        }
        stage('Login to Docker Hub') {
            steps {
                script {
                    // Log in to Docker Hub using credentials
                    sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    sh "docker push ${IMAGE_NAME}:latest"
                }
            }
        }
    }
    post {
        always {
            script {
                // Send notification for the completion of the build
                def buildStatus = currentBuild.result ?: 'SUCCESS'
                mail to: 'maram.hassan95@gmail.com',
                     subject: "Build ${buildStatus}: ${env.JOB_NAME} [${env.BUILD_NUMBER}]",
                     body: "The build has finished with status: ${buildStatus}.\nCheck the logs for details: ${env.BUILD_URL}"
            }
        }
        success {
            script {
                // Additional success notifications (if needed)
                echo 'Build succeeded!'
            }
        }
        failure {
            script {
                // Additional failure notifications (if needed)
                echo 'Build failed!'
            }
        }
    }
}
