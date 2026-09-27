AWS High Availability Infrastructure

This is a personal AWS learning project where I am building and testing cloud infrastructure with Terraform. The main goal is to get hands-on experience with AWS networking, EC2, load balancing and high availability.

What I built:
- AWS VPC (10.0.0.0/16)
- 2 public subnets in different Availability Zones
- 1 private subnet for future use
- Internet Gateway
- Route table
- 2 Ubuntu 24.04 EC2 instances
- Application Load Balancer
- Target Group with health checks
- Security Groups
- SSH access to the EC2 instances

Architecture:

Internet
    |
    v
Application Load Balancer
    |
    +----------------+
    |                |
    v                v
 EC2 #1            EC2 #2
 AZ 1a             AZ 1b

The two EC2 instances are running in different Availability Zones.

The Application Load Balancer distributes HTTP traffic between them and uses health checks to determine whether the instances are available.

Terraform:
-The infrastructure is managed with Terraform.

Current Terraform resources include:
- VPC
- Subnets
- Route Tables
- Internet Gateway
- Security Groups
- EC2 instances
- Application Load Balancer
- Target Group
- Listener
- SSH Key Pair

Project structure:

terraform/
├── alb.tf
├── ec2.tf
├── key_pair.tf
├── provider.tf
├── route.tf
├── security_group.tf
├── subnet.tf
└── vpc.tf

AWS Region:
- eu-north-1 (Stockholm)

What I am working on. This project is still under development.

Next steps:
- Improve Security Group rules
- Move the EC2 instances to private subnets
- Add NAT Gateway
- Add Ansible
- Add monitoring
- Improve the overall security of the infrastructure

Why I built this? I am currently learning cloud infrastructure and wanted to move beyond theory by building something myself.
The project is intentionally built step by step, including troubleshooting the problems I run into along the way.