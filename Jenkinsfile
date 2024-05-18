pipeline {
    agent any
    environment {
    DOCKERHUB_CREDENTIALS = credentials('DH-Cred')
    }
    stages{
        stage('Build the image'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/One-hope-bharat/one']])
                sh './build.sh'
            }
        }
        stage('Push to hub'){
            steps{
                sh './deploy.sh'
                sh 'echo "$DOCKERHUB_CREDENTIALS_PSW" | docker login -u "$DOCKERHUB_CREDENTIALS_USR" --password-stdin'
            }
        }
		stage('deploy to EC2 '){
			steps{
				sh 'ssh -i ~/.ssh/ore_keypain.pem ubuntu@ec2-54-185-10-226.us-west-2.compute.amazonaws.com' 
                sh './app.sh'
            }
        }
    }
}
