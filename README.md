# Kubernetes on GCP
Kubernetes on GCP using GKE

## Prerequisites
1. [Install Terraform](https://www.terraform.io/intro/getting-started/install.html)
2. [Download key for GCP service account](https://cloud.google.com/iam/docs/creating-managing-service-account-keys)
3. A bucket must exist in the destination project with the name in the backend.conf file for storing terraform's state file.

## Usage

1. Create environment variable for service account key.  
   ```
   $ export GOOGLE_APPLICATION_CREDENTIALS=/path/to/service/account/key/file
   ```
   
1. Initialize the config and variables 
   ```
   $ terraform init --backend-config=/path/to/backend/config/file
   ```
   Backend config files are located the `backend` directory.
   
1. Plan a deployment. This will perform a dry run. 
   ```
   $ terraform plan --var-file=/path/to/tfvars/file
   ```
   
1. Perform a deployment. 
   ```
   $ terraform apply --var-file=/path/to/tfvars/file
   ```
   
1. Destroy all terraform managed resources
   ```
   $ terraform destroy --var-file=/path/to/tfvars/file
   ```
 
