pipeline {
    agent any

    stages {

        stage('Terraform Init') {
            steps {
                sh 'terraform -chdir=Root_Modules init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform -chdir=Root_Modules validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform -chdir=Root_Modules plan'
            }
        }

    }
}