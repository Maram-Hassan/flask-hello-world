pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        // stage('Build Docker Image') {
        //     steps {
        //         script {
        //             docker.build("maramhassan95/flask-hello-world-web:${env.BUILD_ID}")
                    
        //         }
        //     }
        // }
        stage('Run Tests') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'pass', usernameVariable: 'dockerhubuser')]) {
                    docker.image("maramhassan95/flask-hello-world-web:${env.BUILD_ID}").inside {
                        sh 'python -m unittest discover -s tests'
                    }
                }
            }
        }
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
// pipeline {
//     agent any

//     environment {
//         ENVIRONMENT = 'DEV'
//         HOST = '0.0.0.0'
//         PORT = '5000'
//         DOCKER_IMAGE_NAME = 'maramhassan95/flask-hello-world-web'  
//     }

//     triggers {
//         githubPush()
//     }

//     stages {
        
//         stage('Build and Push Docker Image') {
//             steps {
//                 script {
                    
//                     sh 'docker build -t flask-hello-world-web .'
                    
                    
//                     withCredentials(0[usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'pass', usernameVariable: 'dockerhubuser')]) {
//                         sh 'docker login -u $dockerhubuser -p $pass'
//                         sh 'docker tag flask-hello-world-web:latest $DOCKER_IMAGE_NAME:latest'
//                         sh 'docker push $DOCKER_IMAGE_NAME:latest'
//                     }
//                 }
//             }
//         }

//         stage('Run App') {
//             steps {
//                 script {
//                     sh '''
//                     # Clean up any existing containers
//                     docker rm -f flask-hello-world-web || true
//                     # Run the application
//                     docker-compose up -d
//                     '''
//                 }
//             }
//         }

//         stage('Test') {
//             steps {
//                 sh 'docker exec flask-hello-world-web python tests/test_hello.py'  // Replace with your actual test command
//             }
//         }

//         stage('Deploy') {
//             when {
//                 expression {
//                     return currentBuild.result == null || currentBuild.result == 'SUCCESS'
//                 }
//             }
//             steps {
//                 sh 'docker-compose up -d'
//             }
//         }
//     }

//     post {
//         always {
            
//             sh 'docker-compose down --volumes'
//         }
//         success {
//             mail to: ' maram.hassan95@gmail.com,',
//                  subject: "Build Succeeded: ${env.BUILD_TAG}",
//                  body: "The build was successful. Check the logs for details."
//         }
//         failure {
//             mail to: 'maram.hassan95@gmail.com',
//                  subject: "Build Failed: ${env.BUILD_TAG}",
//                  body: "The build failed. Please check the logs."
//         }
//     }
// }



pipeline {
    agent any
    environment {
        IMAGE_NAME = 'maramhassan95/flask-hello-world-web'
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        Uncomment this stage to build the Docker image
        stage('Build Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'pass', usernameVariable: 'dockerhubuser')]) {    
                    docker.build("${IMAGE_NAME}:${env.BUILD_ID}")
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'pass', usernameVariable: 'dockerhubuser')]) {
                        docker.image("${IMAGE_NAME}:${env.BUILD_ID}").inside {
                            sh 'python -m unittest discover -s tests'
                        }
                    }
                }
            }
        }

        Uncomment this stage to deploy to Kubernetes
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
}