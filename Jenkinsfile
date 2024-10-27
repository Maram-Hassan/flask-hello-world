pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("flask-hello-world:${env.BUILD_ID}")
                }
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    docker.image("flask-hello-world:${env.BUILD_ID}").inside {
                        sh 'python -m unittest discover -s tests'
                    }
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh '''
                    kubectl apply -f k8s/deployment.yaml
                    '''
                }
            }
        }
    }
    post {
        success {
            echo 'Build succeeded!'
            // Send notification if using a notification plugin
        }
        failure {
            echo 'Build failed!'
            // Send notification if using a notification plugin
        }
    }
}
