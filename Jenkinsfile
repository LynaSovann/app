// pipeline {
//     agent any 
//     environment {
//         NEW_VERSION = '1.3.0'
//         // SERVER_CREDENTIALS = credentials('')
//     }
//     parameters {
//         // string(name: 'VERSION', defaultValue: '', description: 'version to deploy on prod')
//         choice(name: 'VERSION', choices: ['1.1.0', '1.2.0', '1.3.0'], description: '')
//         booleanParam(name: 'executeTests', defaultValue: true, description: '')
//     }
//     tools {
//         maven 'maven'
//     }
//     stages {

//         stage("init") {
//             steps {
//                 script {
//                     gv = load "script.groovy"
//                 }
//             }
//         }

//         stage("build") {
//             steps {
//                 script {
//                     gv.buldApp()
//                 }
//             }
//             steps {
//               echo "building version ${NEW_VERSION}"
//             }
//         }

//         stage("test") {
//             when {
//                 expression {
//                     params.executeTests
//                 }
//             }
//             script {
//                 gv.testApp();
//             }
//             // steps {
//             //     echo "testing the application"
//             // }
//         }

//         stage("deploy") {
//             script {
//                 gv.deployApp(params.VERSION);
//             }
//             // steps {
//             //     echo 'deploying the application...'
//             //     echo "deploying version ${params.VERSION}"
//             // }
//         }
//     }
// }

pipeline {
    agent any 
    environment {
        NEW_VERSION = '1.3.0'
    }
    parameters {
        choice(name: 'VERSION', choices: ['1.1.0', '1.2.0', '1.3.0'], description: 'Choose the version to deploy')
        booleanParam(name: 'executeTests', defaultValue: true, description: 'Run tests')
    }
    tools {
        maven 'maven'
    }
    stages {

        stage("init") {
            steps {
                script {
                    gv = load "script.groovy"  // Load the external Groovy script
                }
            }
        }

        stage("build") {
            steps {
                script {
                    gv.buildApp()  // Call the buildApp function from script.groovy
                }
                echo "Building version ${NEW_VERSION}"
            }
        }

        stage("test") {
            when {
                expression {
                    params.executeTests  // Conditional test execution
                }
            }
            steps {
                script {
                    gv.testApp()  // Call the testApp function
                }
            }
        }

        stage("deploy") {
            steps {
                script {
                    gv.deployApp(params.VERSION)  // Pass the VERSION parameter to the deployApp function
                }
            }
        }
    }
}

