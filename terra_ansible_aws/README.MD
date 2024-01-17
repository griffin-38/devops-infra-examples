# Infrastructure Automation for AWS with Terraform and Ansible

This repository provides code examples demonstrating the integration of Terraform and Ansible for setting up an AWS Elastic Kubernetes Service (EKS) cluster. It orchestrates resource deployment using modules designed for Amazon EKS, EC2, S3, and Lambda.

****
## Prerequisites

**Install [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)**: Terraform is used for defining and provisioning infrastructure as code, `Please make sure to review the documentation`.

[Homebrew](https://formulae.brew.sh/formula/terraform)
````
$ brew install terraform
$ terraform -v

````

**Install [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)**: Ansible is used for configuration management and application deployment, `Please make sure to review the documentation`.

[Ansible with pip](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
````
$ git clone https://github.com/ansible/ansible.git
$ cd ansible
$ pip3 install -r requirements.txt
$ python3 setup.py install

````
### Building System Images with Packer and Ansible
Harness HashiCorp's Packer tool to effortlessly create machine images on your preferred cloud or virtualization platform using your existing Ansible playbooks. 
- Packer configuration is defined in a JSON file and executed from the command line.
  - **Install [HashiCorps Packer Tool](https://developer.hashicorp.com/packer/install)**:
  - Getting Started: [Packer](https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli)

- Packer simplifies image creation for different platforms, like AWS.
- It automates building images with predefined software and settings.
- Consider skipping Packer if you don't need custom images or AWS offers suitable pre-configured ones.

# Getting Started

1. Clone this repository.
 - Ensure you have the following tools installed before using this repository.
2. Customize the Terraform variables in `terraform.tfvars`.
3. Run `terraform init`, `terraform plan`, followed by `terraform apply`.
 - [Terraform Troubleshooting](https://developer.hashicorp.com/terraform/tutorials/configuration-language/troubleshooting-workflow)

## Running Terraform with Ansible

Ansible has a Terraform module that can trigger Terraform deployments and plans.

- You can also pull resource Utilize Ansible's Terraform module to seamlessly trigger Terraform deployments and plans.
- Additionally, you have the capability to retrieve resource information back into Ansible.
- For more details, refer to the [Ansible Documentation](https://docs.ansible.com/ansible/latest/scenario_guides/vmware_rest_scenarios/collect_information.html).
  
### Using local_exec

This section typically involves executing Ansible playbooks on the same machine where terraform apply is run.

`It might include commands like`:

````
provisioner "local-exec" {
  command = "ansible-playbook -i '${some_inventory}' playbook.yml"
}
````

If you have Ansible playbooks that need to be executed on the local machine where Terraform is being applied, you might need this section. However, if your Ansible playbooks are intended to run on a remote host or a different machine, this section may not be necessary.
### Utilizing remote_exec

This section involves running Ansible on a remote host. It typically includes copying Ansible playbooks to the remote host, installing Ansible there, and then executing the playbooks. 

`Example code might look like`:

````
provisioner "remote-exec" {
  inline = [
    "mkdir /home/user/ansible",
    "cp /local/path/to/playbook.yml /home/user/ansible/",
    "ansible-playbook /home/user/ansible/playbook.yml"
  ]
}
````

If your Ansible playbooks need to be executed on a remote host, you might need this configuration.

# Directory Structure

`ansible/files`: Configures an Apache HTTP Server, creating a basic web page. The playbook assumes you have a Jinja2 (.j2) - template file (index.j2).

`ansible/playbooks/configure_web_server.yml`: Ansible playbook for EKS setup. Customize the Ansible playbook (eks-setup.yml) based on your specific setup tasks for EKS.

`ansible/playbooks/configure_ec2.yml`: The Ansible playbook for setting up and configuring can ec2 instance

`ansible/playbooks/configure_eks.yml`: This is the main Terraform file that uses the eks module to create the EKS cluster.

`ansible/playbooks/configure_lambda.yml`: This is the main Terraform file that uses the eks module to create the EKS cluster.

`ansible/playbooks/configure_s3.yml`: This is the main Terraform file that uses the eks module to create the EKS cluster.

`packer/packer.json`: JSON files that configure the various components of [Packer](https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli) in order to create one or more machine images. Feel free to customize the contents based on your project's specific needs and dependencies. Ensure to replace placeholder values in the packer.json.

`terraform/aws/main.tf`: This configuration orchestrates the deployment of resources using various modules for Amazon EKS, EC2, S3, and Lambda. The configuration is organized and modular, making it easy to manage and understand different components of the infrastructure.

`terraform/aws/outputs.tf`: This file defines the output values that you want to display after running Terraform. 
- This file will allow you to capture and use various pieces of information about your EKS cluster after it has been provisioned. 
- Adjust the outputs according to your needs and what information you may require for subsequent steps or external applications.

`terraform/terraform.tfvars`: Configure AWS Region, Subnet, and VPC. This file holds the real values for the variables outlined in variables.tf. Input the specific values you intend to use in your deployment, making sure to replace the provided placeholders with the actual subnet and VPC IDs.

`terraform/aws/variables.tf`: This file defines the input variables used in your Terraform configuration.
- `cluster_name`: Name for the EKS cluster. 
- `subnets`: List of subnet IDs for the EKS cluster.
- `vpc_id`: VPC ID where the EKS cluster will be deployed.
- `public_key_path`: Path to the public key used for worker nodes.
- `private_key_path`: Path to the private key used for worker nodes.
- `ssh_user`: SSH user name to connect to your instance, with a default value of "omixalot".
  
- `terraform/aws/modules/ec2/ec2.tf`: Terraform script defines an AWS security group and launches two EC2 instances.
  
- `terraform/aws/modules/eks/main.tf`: Terraform script defines an AWS EKS (Elastic Kubernetes Service) cluster. It includes variables, providers, and resources needed for EKS, along with necessary IAM roles and policies.
  
- `terraform/aws/modules/lambda/lambda.tf`: Creates an IAM role and an AWS Lambda function. Ensure that the specified Lambda function code and entry point (handler) align with your actual implementation.
  
- `terraform/aws/modules/s3/s3.tf`: Creates an S3 bucket named "example-bucket" with versioning enabled, logging configured, and some tags. Another `aws_s3_bucket` resource creates a separate log bucket.
  
- `.gitignore`: It's a good practice to include a `.gitignore` file to specify files and directories that should be ignored by version control. - For example, you might want to exclude `.terraform` directories or any sensitive information.
  
- Feel free to customize these examples according to your actual configurations and requirements.
- The provided tasks are simplified and may need adjustments based on your specific setup.

# Understanding Configuration File Syntax and Packer Usage
## Configuration File Syntax
Understanding the syntax of the configuration files used in this repository is essential.

- **YAML:** A human-readable data serialization format commonly used for configuration files and data exchange between languages with different data structures.
- **Terraform (.tf) Files:** Terraform uses HashiCorp Configuration Language (HCL) for its configuration files. HCL is designed to be easy to read and write for both humans and machines.
- Both YAML and HCL follow specific syntax rules, indentation, and key-value pairs to define configurations. YAML is often used for Ansible playbooks, while Terraform uses HCL for defining infrastructure resources and their configurations.
## Packer Usage

`Project Needs`: Decide based on your project needs whether Packer is essential for creating custom machine images.
`Automation Benefits`: If your project requires automated building of custom Amazon Machine Images (AMIs) or other formats for different cloud providers, Packer could be valuable.
`Alternative Approaches`: If you have a different method for managing machine images or creating custom images isn't part of your infrastructure setup, Packer may not be necessary for your use case.
`Project Evaluation`: Assess your specific project requirements to determine if Packer aligns with your goals for image creation and automation. If not, it may not be needed in this repository.

****
## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.