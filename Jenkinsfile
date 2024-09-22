pipeline {
    agent {
        label 'agentc'
    }
    tools {
        maven 'maven'
    }
    stages {

        stage("checkout") {
            steps {
            echo "🚀🚀🚀🚀 Running..."
            echo "Running on $NODE_NAME"
            echo "$BUILD_NUMBER"
            sh 'pwd'
            sh 'ls'
          }
        }

        stage("clean package") {
            steps {
              echo "🚀 Building the application..."
              sh ' mvn clean install '
            }
        }

        stage("build and push docker image") {
            environment {
                IMAGE = "lynakiddy/nextjs-img"
                DOCKER_IMAGE = "lynakiddy/nextjs-img:${BUILD_NUMBER}"
                DOCKER_CREDENTIALS_ID = 'docker_hub'
            }

            steps {
                script {
                    echo "🚀 Building docker image..."
                    sh ' docker build -t ${DOCKER_IMAGE} .'
                    sh ' docker images | grep -i ${IMAGE} '
                    
                    echo "🚀 Log in Docker hub using Jenkins credentials..."
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
                      sh 'echo "${DOCKER_PASS} ${DOCKER_USER}" '
                      sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    }
                    echo "🚀 Pushing the image to Docker hub"
                    sh 'docker push ${DOCKER_IMAGE}'
                    
                }
            }
        }

        stages("Update the manifest file") {
            steps {
                echo "🚀 Updating the image of the Manifest file..."
            }
        }


    }
}


