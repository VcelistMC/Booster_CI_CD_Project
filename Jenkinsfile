pipeline {
    agent any
    
    stages{
        stage('prep'){
            steps {
                git 'https://github.com/VcelistMC/Booster_CI_CD_Project.git'
            }
        }
        stage('docker build'){
            steps{
                sh """
                    DOCKER_BUILDKIT=0  docker build .
                """
            }
        }
    }
}