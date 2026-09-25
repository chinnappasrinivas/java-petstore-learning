pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out source code...'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Building Maven project...'
                bat 'mvn clean compile'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                bat 'mvn test'
            }
        }

        stage('Package') {
            steps {
                echo 'Creating package...'
                bat 'mvn package -DskipTests'
            }
        }
    }

    post {

        success {
            echo 'PIPELINE SUCCESSFUL'
        }

        failure {
            echo 'PIPELINE FAILED'
        }
    }
}