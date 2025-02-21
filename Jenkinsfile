pipeline {
    agent any
    environment {
        PATH = "/usr/local/bin:$PATH"
    }
    stages {
        stage('Terraform Init & Apply') {
            steps {
                sh 'cd terraform && /usr/local/bin/terraform init && /usr/local/bin/terraform apply -auto-approve'
            }
        }
        stage('Retrieve Kubeconfig') {
            steps {
                sh '/usr/local/bin/terraform output -raw kubeconfig > terraform/kubeconfig'
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh 'export KUBECONFIG=terraform/kubeconfig && kubectl apply -f k8s/'
            }
        }
    }
}

