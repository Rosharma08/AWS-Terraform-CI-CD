pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'ap-south-1' // Agar aapka region alag hai to yahan change karein (jaise us-east-1)
    }

    stages {
        stage('Terraform Init') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-terraform',
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                ]]) {
                    sh 'terraform -chdir=Root_Modules init'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform -chdir=Root_Modules validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-terraform',
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                ]]) {
                    sh 'terraform -chdir=Root_Modules plan'
                }
            }
        }
    }
}