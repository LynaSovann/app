pipeline {
    agent {
        label 'agentc'
    }
    tools {
        maven 'maven'
    }
    stages {

        stage("test_running") {
            steps {
            echo "🚀🤖 Running..."
            echo "Running on $NODE_NAME"
          }
        }

        // stage("build") {
        //     steps {
        //       sh ' mvn clean install '
        //       sh ' docker build -t springboot_jenkins . '
        //     }
        // }

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


