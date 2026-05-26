pipeline {

    agent any

    stages {

        stage('Clone') {
            steps {
                git branch: 'main',
                url: 'https://github.com/whiteking24/StudentManagement.git'
            }
        }

        stage('Build') {
            steps {
                bat 'mvn clean package'
            }
        }

        stage('Docker Build') {
            steps {
                bat 'docker build -t java-student .'
            }
        }

        stage('Run Container') {
            steps {
                bat 'docker run -d -p 8082:8080 java-student'
            }
        }
    }
}