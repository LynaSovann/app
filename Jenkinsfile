def gv 

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

        stage("init") {
            steps {
                script {
                    gv = load "script.groovy"
                }
            }
        }

        stage("build") {
            steps {
                script {
                    gv.buldApp()
                }
            }
            steps {
              echo "building version ${NEW_VERSION}"
            }
        }

        stage("test") {
            when {
                expression {
                    params.executeTests
                }
            }
            script {
                gv.testApp();
            }
            // steps {
            //     echo "testing the application"
            // }
        }

        stage("deploy") {
            script {
                gv.deployApp();
            }
            // steps {
            //     echo 'deploying the application...'
            //     echo "deploying version ${params.VERSION}"
            // }
        }
    }
}
