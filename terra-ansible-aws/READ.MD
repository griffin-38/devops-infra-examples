# Terraform and Ansible Integration for AWS EKS

This repository provides code examples for seamlessly integrating Terraform and Ansible to create an AWS Elastic Kubernetes Service (EKS) cluster.

****
## Prerequisites

- Terraform
- Ansible

## Getting Started

1. Clone this repository.
2. Customize the Terraform variables in `terraform.tfvars`.
3. Run `terraform init`, followed by `terraform apply`.
4. ...

# Running Ansible from Terraform

## Using local_exec

- Refer to the code examples in the `terraform_gcp` or `terraform_azure` folders to understand the process. Essentially, it involves two steps. 
- First, a remote exec is employed, compelling Terraform to wait until SSH is running before executing Ansible. This could be any command, even a simple `echo "Hello World"`. 
- Subsequently, an `ansible-playbook` command is executed from the same machine where `terraform apply` was run.

## Utilizing remote_exec

- In the `terraform_gcp` directory, find code examples with remote exec commented out. By commenting out the local_exec code and running this, Ansible can be executed on the remote host. 
- This method involves copying the playbook to the remote host first, followed by the installation and local execution of Ansible there.

## Running Terraform with Ansible

Ansible has a Terraform module that can trigger Terraform deployments and plans. 
- You can also pull resource Utilize Ansible's Terraform module to seamlessly trigger Terraform deployments and plans. 
- Additionally, you have the capability to retrieve resource information back into Ansible. 
- For more details, refer to the [Ansible Documentation](https://docs.ansible.com/ansible/latest/scenario_guides/vmware_rest_scenarios/collect_information.html).


## Building System Images with Packer and Ansible

- Harness HashiCorp's Packer tool to effortlessly create machine images on your preferred cloud or virtualization platform using your existing Ansible playbooks. 
- Packer configuration is defined in a JSON file and executed from the command line.

## Integrating HashiCorp Vault with Ansible

- Effortlessly fetch secrets from HashiCorp Vault by leveraging the Hashi Vault Ansible plugin. 
- Find comprehensive information in the [Ansible Documentation](https://docs.ansible.com/ansible/latest/collections/community/hashi_vault/docsite/user_guide.html). 
- The plugin relies on the robust Python HVAC library, available on GitHub: [HVAC](https://github.com/hvac/hvac).

****
## Directory Structure

**ansible**: Ansible playbook for EKS setup. Customize the Ansible playbook (eks-setup.yml) based on your specific setup tasks for EKS.
main.tf: This is the main Terraform file that uses the eks module to create the EKS cluster.

- **ansible/eks-setup.yml**: The Ansible playbook for setting up and configuring components related to the EKS cluster.

**files**: configures an Apache HTTP Server, creating a basic web page. The playbook assumes you have a Jinja2 template file .

**modules/eks**: configurations and AWS credentials in these files. 

- **modules/eks/main.tf**: This folder contains the Terraform module for creating the EKS cluster. It includes variables, providers, and resources needed for EKS.

**packer/packer.json**:  JSON files that configure the various components of Packer in order to create one or more machine images. Feel free to customize the contents based on your project's specific needs and dependencies. Ensure to replace placeholder values in the packer.json.

**terraform_aws/main.tf**: Set desired AWS region, subnet and vpc ids

**terraform_aws/outputs.tf**: This file defines the output values that you want to display after running Terraform. 
- This file will allow you to capture and use various pieces of information about your EKS cluster after it has been provisioned. 
- Adjust the outputs according to your needs and what information you may require for subsequent steps or external applications.

**terraform_aws/variables.tf**: This file defines the input variables used in your Terraform configuration.
- cluster_name: Name for the EKS cluster.
- subnets: List of subnet IDs for the EKS cluster.
- vpc_id: VPC ID where the EKS cluster will be deployed.
- public_key_path: Path to the public key used for worker nodes.
- private_key_path: Path to the private key used for worker nodes.
- ssh_user: SSH user name to connect to your instance, with a default value of "omixalot".

**.gitignore**: It's a good practice to include a .gitignore file to specify files and directories that should be ignored by version control. - For example, you might want to exclude .terraform directories or any sensitive information.

**terraform.tfvars**: This file contains the actual values for your input variables. Make sure to fill this with appropriate values.

****
## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

