pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/farookp43/java_hello_student.git'
            }
        }

        stage('Build JAR') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t java_hello_student_image .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run -d --name java_hello_student_container java_hello_student_image'
            }
        }
    }

    post {
        always {
            sh 'docker ps -a'
        }
    }
}

