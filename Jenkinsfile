pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "sanketjadhav84/mynewapp"
    }

    stages {

        stage('github clone') {
            steps {
                git branch: 'main', url: 'https://github.com/SanketJadhav84/flask-devops-cicd-pipeline.git'
            }
        }

        stage('Building docker image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE:latest ./app'
            }
        }

        stage('Push to docker hub') {
            steps {
                withDockerRegistry([credentialsId: 'dockerhub-cred', url: '']) {
                    sh 'docker push $DOCKER_IMAGE:latest'
                }
            }
        }

        stage('deploy to kubernetes') {
            steps {
                sh 'kubectl apply -f k8s/deployment.yaml'
                sh 'kubectl apply -f k8s/service.yaml'
            }
        }
    }
}