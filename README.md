# Two-Tier Web Application Automation with Terraform, Ansible, and GitHub Actions

This assignment focuses on leveraging modern DevOps practices to design and implement a two-tier static web application hosting solution in AWS. The objective is to demonstrate the application of deployment automation, configuration management, and source control tools in creating a secure and scalable infrastructure.  

Key components include using Terraform to provision the necessary AWS resources and Ansible Playbooks to configure and manage the application environment. The assignment also emphasizes the importance of automating security scans and deployment workflows through GitHub Actions, ensuring a streamlined and efficient delivery process. By integrating these tools and methodologies, the project highlights the best practices in managing infrastructure as code and automating application deployments.

# Project Overview

The infrastructure consists of the following components:

Terraform: Provisions AWS resources including VPCs, subnets, EC2 instances, and a Load Balancer.

Ansible: Configures the web servers and deploys application content.

GitHub Actions: Automates Terraform deployment workflows triggered by commits.

# Prerequisites

Tools

Terraform: Install Terraform CLI.

AWS CLI: Install AWS CLI.

Ansible: Installed in your environment (e.g., AWS Cloud9 or local machine).

AWS Setup

Create an S3 Bucket:

Use the AWS Console or CLI to create an S3 bucket for storing Terraform state files.

CLI command:

aws s3 mb s3://<your-unique-bucket-name>

Update Terraform Configurations:

Update backend.tf files in the Network and Webserver modules with the S3 bucket name and region.

Set Up Cloud9 Environment (Optional):

Use AWS Cloud9 to run Terraform and Ansible commands.

Install necessary packages in Cloud9:

sudo yum update -y

sudo yum install python3-pip -y

pip install ansible boto3 botocore

# Deployment Steps

## Using Terraform

1. Network Module

Navigate to the Network directory:

cd Network

Initialize Terraform:

terraform init

Generate and review the execution plan:

terraform plan

Apply the Terraform configuration:

terraform apply --auto-approve

2. Webserver Module

Navigate to the Webserver directory:

cd ../Webserver

Initialize Terraform:

terraform init -reconfigure

Generate and review the execution plan:

terraform plan

Apply the Terraform configuration:

terraform apply --auto-approve

## Using Ansible

Ensure the private key permissions are correct:

chmod 400 ../Webserver/project_key

Run the Ansible playbook:

ansible-playbook playbook_deploy.yaml -i aws_ec2.yaml --private-key ../Webserver/project_key

## GitHub Actions Workflow

A GitHub Actions workflow is included to automate Terraform deployments on commits to the main branch. The workflow performs the following:

Checks out the repository.

Configures AWS credentials using GitHub Secrets.

Initializes and applies Terraform configurations in both Network and Webserver directories.

Key Workflow File

Ensure your GitHub repository contains a .github/workflows/terraform-deploy.yml file.

Use GitHub Secrets to securely store AWS credentials.

# Verification

Load Balancer

After deployment, retrieve the DNS name of the Application Load Balancer from the AWS Console.

Open the DNS name in your browser to verify toggling images and content served by the Nonprod EC2 instances.

# Cleanup

To clean up all resources:

Navigate to the Webserver directory and destroy resources:

cd Webserver
terraform destroy --auto-approve

Repeat the process in the Network directory:

cd Network
terraform destroy --auto-approve
