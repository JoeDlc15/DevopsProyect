pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/JoeDlc15/DevopsProyect.git'
                
                script {
                    def author = sh(script: "git log -1 --pretty=format:'%an'", returnStdout: true).trim()
                    
                    echo "------------------------------------------------"
                    echo "🚀 El commit fue realizado por: ${author}"
                    echo "------------------------------------------------"
                    
                    currentBuild.description = "Commit por: ${author}"
                }
            }
        }
        
        stage('Commit Info') {
            steps {
                sh '''
                    echo "====================================="
                    echo "      INFORMACIÓN DEL ÚLTIMO COMMIT"
                    echo "====================================="
                    echo "Autor:      $(git log -1 --pretty=format:'%an')"
                    echo "Email:      $(git log -1 --pretty=format:'%ae')"
                    echo "Fecha:      $(git log -1 --pretty=format:'%ad')"
                    echo "Mensaje:    $(git log -1 --pretty=format:'%s')"
                    echo "====================================="
                '''
            }
        }

        stage('Build') {
            steps {
                sh 'echo "Compilando aplicación..."'
            }
        }

        stage('Test') {
            steps {
                sh 'echo "Ejecutando pruebas..."'
            }
        }

        stage('Package Release') {
            steps {
                sh 'echo "Generando artefacto release..."'
                sh "zip -r release-v${BUILD_NUMBER}.zip ./src"
            }
        }

        stage('Publish Artifact') {
            steps {
                sh 'echo "Publicando artefacto..."'
            }
        }
    }

    post {
        success {
            archiveArtifacts artifacts: 'release-v*.zip', fingerprint: true
            echo "Release v${BUILD_NUMBER} generado exitosamente."
        }
        failure {
            echo "Falló el release."
        }
    }
}