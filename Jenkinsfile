pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        // Uncomment this stage to build the Docker image
        stage('Build Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'pass', usernameVariable: 'dockerhubuser')]) {

                    // Build the Docker image
                    docker.build("maramhassan95/flask-hello-world-web:${env.BUILD_ID}")
                }
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'pass', usernameVariable: 'dockerhubuser')]) {
                        // Run tests inside the Docker container
                        docker.image("maramhassan95/flask-hello-world-web:${env.BUILD_ID}").inside {
                            sh 'python -m unittest discover -s tests'
                        }
                    }
                }
            }
        }
        // Uncomment this stage to deploy to Kubernetes
        // stage('Deploy to Kubernetes') {
        //     steps {
        //         script {
        //             sh '''
        //             kubectl apply -f k8s/deployment.yaml
        //             '''
        //         }
        //     }
        // }
    }
    post {
        always {
            // Clean up Docker containers and volumes
            sh 'docker-compose down --volumes'
        }
        success {
            mail to: 'maram.hassan95@gmail.com',
                 subject: "Build Succeeded: ${env.BUILD_TAG}",
                 body: "The build was successful. Check the logs for details."
        }
        failure {
            mail to: 'maram.hassan95@gmail.com',
                 subject: "Build Failed: ${env.BUILD_TAG}",
                 body: "The build failed. Please check the logs."
        }
    }
}
}