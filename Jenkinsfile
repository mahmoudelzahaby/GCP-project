

// In order to run this pipeline you need to configure your GCP personal credentials locally on jenkins master machine 


pipeline {
    agent any
    stages {
        stage('Terraform Init') {
            steps {
                  sh 'terraform init'  
                       
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
    post {
        always {
            sh 'terraform destroy -auto-approve' // The pipeline will remove the infra after applying it only test if the code work
        }
    }
}