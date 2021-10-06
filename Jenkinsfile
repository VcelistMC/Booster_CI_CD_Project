pipeline {
    agent {label 'dockerslave'}
    
    stages{
        stage('prep'){
            steps {
                echo "===================================== Fetching Code ====================================="
                git 'https://github.com/VcelistMC/Booster_CI_CD_Project.git'
            }
            post{
                success{
                    echo "Code fetched"
                }
                failure{
                    echo "fetching failed"
                }
            }
        }
        stage('docker build'){
            steps{
                echo "===================================== Building Image ====================================="
                sh """
                    DOCKER_BUILDKIT=0  docker build -t peteratef/django-app:dev .
                """
            }
            post{
                success{
                    echo "Docker image built successfully"
                }
                failure{
                    echo "build failed"
                }
            }
        }
        stage("docker push"){
            when{
                expression{ return params.pushToRemote; }
            }
            steps{
                echo "===================================== Pushing Image to remote ====================================="
                withCredentials([
                        usernamePassword(
                            credentialsId: 'docker_creds', 
                            usernameVariable: 'USERNAME', 
                            passwordVariable: 'PASSWORD'
                        )
                ])
                {
                    sh """
                        docker login -u ${USERNAME} -p ${PASSWORD}
                        docker push peteratef/django-app:dev
                    """
                }
            }
            post{
                success{
                    echo "Image pushed successfully :D"
                }
                failure{
                    echo "Pushing failed :("
                }
        
            }
        }
        stage("deploy"){
            steps{
                echo "===================================== Cleaning workspace ====================================="
                sh """
                    docker container stop django-app || true
                    docker container rm django-app || true
                """
                echo "===================================== Deploying ====================================="
                sh 'docker run -d -p 8000:8000 --name django-app peteratef/django-app:dev'
            }
            post{
                success{
                    echo "Deployment successful :D"
                }
                failure{
                    echo "Deployment Failed"
                }
            }
        }
    }
    post{
        success{
            echo "Pipeline deployment successful"
        }
        failure{
            echo "pipeline failed :("
        }
    }
}