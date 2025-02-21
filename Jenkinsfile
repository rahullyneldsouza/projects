pipeline {
    agent any
    environment {
        LINODE_TOKEN = credentials('LINODE_TOKEN')  // Fetch token from Jenkins credentials
    }
    stages {
        stage('Terraform Init & Apply') {
            steps {
                sh '''
                cd terraform
                terraform init
                terraform apply -auto-approve -var="linode_token=${LINODE_TOKEN}"
                '''
            }
        }
        stage('Retrieve Kubeconfig') {
            steps {
                sh 'terraform output -raw kubeconfig > terraform/kubeconfig'
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                export KUBECONFIG=terraform/kubeconfig
                which kubectl  # Debugging step to ensure kubectl is found
                kubectl version --client
                kubectl apply -f k8s/
                '''
            }
        }
    }
}

