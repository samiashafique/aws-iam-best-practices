# AWS IAM Best Practices with Terraform
This repository contains the Terraform code to implement IAM best practices for securing AWS environments, based on a real-world use case.

## Project Overview
A fast-growing tech startup, faced significant cloud security risks, including shared root account credentials, no role-based permissions, and a lack of Multi-factor Authentication(MFA) or password policies. This project demonstrates how to:
1. Secure the AWS root account
2. Create IAM groups and users based on team roles.
3. Assign permissions based on the principle of least privilege.
4.	Enforce security policies such as MFA and strong password requirements.

 For the full backstory and AWS Console instructions, refer to the [Medium article](https://medium.com/@samiashafique/securing-aws-infrastructure-a-cloud-engineers-guide-to-iam-best-practices-25001cb9da98).

## Current Architecture
![Project_1_AWS_IAM](https://github.com/user-attachments/assets/0255ac04-a8b1-4bcc-9d44-542eb561b862)

## Prerequisites
-	Terraform CLI [Installation Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
-	AWS CLI [Setup Guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-quickstart.html)
-	[AWS account](https://aws.amazon.com/account/) with permissions to manage IAM resources.

## First Step: Secure the Root Account
While Terraform can't directly secure the root account (since root configurations aren't API-accessible), here’s what to do:
- Enable MFA for the root account: Manually follow [AWS's documentation](https://docs.aws.amazon.com/IAM/latest/UserGuide/enable-virt-mfa-for-root.html)to set this up.
- Stop using the root account for daily operations
- Store credentials securely: Use a password manager (e.g., LastPass or 1Password) to securely store root credentials.
- 
## Steps to Deploy
1.	Clone this repository:
```bash
git clone https://github.com/samiashafique/aws-iam-best-practices.git
cd aws-iam-best-practices
```
2.	Initialize Terraform:
```bash
terraform init
```
3.	Review and apply the changes:
```bash
terraform plan 
terraform apply
```


