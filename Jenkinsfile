pipeline {
    agent any
    environment {
    DOCKERHUB_CREDENTIALS = credentials('DH-Cred')
    }
    stages{
        stage('Build the image'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/One-hope-bharat/one']])
                sh '/var/lib/jenkins/workspace/one/build.sh'
            }
        }
        stage('Push to hub'){
            steps{
                sh '/var/lib/jenkins/workspace/one/deploy.sh'
                sh 'echo "$DOCKERHUB_CREDENTIALS_PSW" | docker login -u "$DOCKERHUB_CREDENTIALS_USR" --password-stdin'
            }
        }
    }
}

