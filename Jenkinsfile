pipeline {
    agent any
    tools {
        maven 'maven'
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Kanchana46/devops-automation.git'
            }
        }
        stage('Build Jar') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Build Docker image') {
            steps {
                sh 'docker build -t dockerkr12/spring-devops .'
            }
        }
        stage('Push to Dockerhub') {
            steps {
                withCredentials([string(credentialsId: 'dockerpwd', variable: 'dockerpwd')]) {
                    sh 'docker login -u dockerkr12 -p ${dockerpwd}'
                    sh 'docker push dockerkr12/spring-devops'
                }
            }
        }
        stage('Deploy to Kubernetes') {
          steps {
            withKubeConfig([credentialsId: 'kubeconfig']) {
              sh 'kubectl apply -f kubernetes/deployment.yml'
            }
          }
        }
    }
}