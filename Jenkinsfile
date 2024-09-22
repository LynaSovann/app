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
            sh 'pwd'
            sh 'ls'
          }
        }

        stage("build") {
            steps 
              echo "🚀 Building the application..."
              sh 'ls -l'
              sh ' mvn clean install '
              ls 'ls -l'
              // sh ' docker build -t springboot_jenkins . '
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


