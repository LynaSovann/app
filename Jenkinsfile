pipeline {
    agent any 
    environment {
        NEW_VERSION = '1.3.0'
        // SERVER_CREDENTIALS = credentials('')
    }
    parameters {
        // string(name: 'VERSION', defaultValue: '', description: 'version to deploy on prod')
        choice(name: 'VERSION', choices: ['1.1.0', '1.2.0', '1.3.0'], description: '')
        booleanParam(name: 'executeTests', defaultValue: true, description: '')
    }
    tools {
        maven 'maven'
    }
    stages {

        // stage("init") {
        //     steps {
        //         script {
        //             gv = load "script.groovy"
        //         }
        //     }
        // }

        stage("build") {
            // steps {
            //     script {
            //         gv.buldApp()
            //     }
            // }
            steps {
              echo "building version ${NEW_VERSION}"
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


