pipeline {
    agent any

    tools {
        maven 'MAVEN_HOME'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/farookp43/java_hello_students.git'
            }
        }

        stage('Build JAR') {
            steps {
                bat 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t hello_students .'
            }
        }

        stage('Run Docker Container') {
            steps {
                bat 'docker run -d -p 8080:8080 hello_students'
            }
        }
    }

    post {
        always {
            bat 'echo Pipeline complete'
        }
    }
}
