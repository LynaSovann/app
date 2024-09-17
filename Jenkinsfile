pipeline {
    agent any 
    tools {
        maven 'maven'
    }
    stages {

        stage("build") {
            steps {
              sh ' mvn clean install '
              sh ' docker build -t springboot_jenkins . '
            }
        }

        stage("test") {
            // when {
            //     expression {
            //         params.executeTests
            //     }
            // }
            // script {
            //     gv.testApp();
            // }
            steps {
                echo "testing the application"
            }
        }

        stage("deploy") {
            // script {
            //     gv.deployApp(params.VERSION);
            // }
            steps {
                sh ' docker run --name springboot_jenkins -d -p 8080:8080 springboot_jenkins '
                sh ' docker ps '
            }
        }
    }
}


