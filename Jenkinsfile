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
                    withCredentials([usernamePassword(credentialsId: '${DOCKER_CREDENTIALS_ID}', passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
                      // sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                      sh 'echo "${DOCKER_PASS} ${DOCKER_USER}" '
                    }
                }
            }
            
        }

        // stage("test") {
        //     steps {
        //         echo "testing the application"
        //     }
        // }

        // stage("deploy") {
        //     steps {
        //         sh 'docker start springboot_jenkins || docker run --name springboot_jenkins -d -p 8081:8080 springboot_jenkins '
        //         sh ' docker ps '
        //         echo '🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀'
        //         echo '🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀'
        //         echo '🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀'
        //     }
        // }

    }
}


