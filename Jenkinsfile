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
                    docker.build("flask-hello-world-web:${env.BUILD_ID}")
                }
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    docker.image("flask-hello-world-web:${env.BUILD_ID}").inside {
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
        always {
            
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
