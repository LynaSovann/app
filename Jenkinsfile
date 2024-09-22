pipeline {
    agent {
        label 'agentc'
    }
    tools {
        maven 'maven'
    }
    environment {
        IMAGE = "lynakiddy/springboot-img"
        DOCKER_IMAGE = "${IMAGE}:${BUILD_NUMBER}"
        DOCKER_CREDENTIALS_ID = 'docker_hub'

        GIT_MANIFEST_REPO = "https://github.com/LynaSovann/springboot_manifest.git"
        GIT_BRANCH = "argocd"
        MANIFEST_REPO = "manifest-repo"
        MANIFEST_FILE_PATH = "manifests/deployment.yaml"
        GIT_CREDENTIALS_ID = 'docker_hub'
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

        // stage("clean package") {
        //     steps {
        //       echo "🚀 Building the application..."
        //       sh ' mvn clean install '
        //     }
        // }

        stage("build and push docker image") {

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

        stage("Cloning the manifest file") {
            steps {
                sh "pwd"
                sh "ls -l"
                echo "🚀 Checking if the manifest repository exists and removing it if necessary..."
                sh '''
                    if [ -d "${MANIFEST_REPO}" ]; then
                        echo "⚠️ ${MANIFEST_REPO} exists, removing it..."
                        rm -rf ${MANIFEST_REPO}
                    fi
                '''
                echo "🚀 Updating the image of the Manifest file..."
                sh "git clone -b ${GIT_BRANCH} ${GIT_MANIFEST_REPO} ${MANIFEST_REPO}"
                sh "ls -l"
            }
        }


        stage("Updating the manifest file") {
            steps {
                script {
                    echo "🚀 Update the image in the deployment manifest..."
                    sh """
                    sed -i 's|image: ${IMAGE}:.*|image: ${DOCKER_IMAGE}|' ${MANIFEST_REPO}/${MANIFEST_FILE_PATH}
                    """
                }
            }
        }

        stage("push changes to the manifest") {
            steps {
                script {
                    dir("${MANIFEST_REPO}") {
                        withCredentials()
                    }
                }
            }
        }
        

    }
}


