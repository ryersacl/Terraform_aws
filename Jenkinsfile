pipeline {
    agent any
    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
    }
    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }
        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init -backend-config="access_key=AKIAZQ3DPPLNEMI2U7P7" -backend-config="secret_key=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"'
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                script {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
        stage('Upload State to S3') {
            steps {
                script {
                    sh 'aws s3 cp terraform.tfstate s3://my-bucket-jenkins-terraform-aws'
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}