pipeline {
    agent any
    environment {
        PATH = "/usr/local/bin:$PATH"
    }
    stages {
        stage('Terraform Init & Apply') {
            steps {
                sh '''
                cd terraform
                terraform init
                terraform apply -auto-approve
                terraform output -raw kubeconfig > kubeconfig || linode-cli lke kubeconfig-view $(terraform output -raw linode_lke_cluster_id) > kubeconfig
                '''
            }
        }
        stage('Fix Kubeconfig Formatting') {
            steps {
                sh '''
                sed -i 's/\\n/\\n/g' terraform/kubeconfig
                chmod 600 terraform/kubeconfig
                '''
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                export KUBECONFIG=terraform/kubeconfig
                kubectl apply -f k8s/
                '''
            }
        }
    }
}

