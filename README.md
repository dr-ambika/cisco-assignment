# cisco-assignment

# Terraform

## Setup instructions

1. Install the latest version of Terraform from the [here](https://www.terraform.io/downloads.html) Mac OS ```brew install terraform```
2. Install ##git from the [here](https://git-scm.com/download/linux) Mac OS ```brew install git```
3. Run ```terraform init```
4. Install aws cli from [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)

## Credentials

Ref [here](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html#id_users_create_console)
1. Open AWS Account
2. Create IAM Admin user by name ```terraform```
    * Login to AWS Account
    * Click on Services. Choose IAM
    * In IAM Page on left Panel click users
    * Click Add Users
    * Enter Username as ```terraform```, Select Access type as ```Programatic access``` Click on Next
    * Click on ##Add user to group -> ##Create group -> ##Group name:```terraform-administrators``` -> Select ```AdminstratorAccess``` Policy
    * Click on ```Create group``` -> Next Review -> Create user

3. Copy the Access Key ID and Secret access key or ##Download.csv
4. Set up aws Credentials locally so that Terraform can access the AWS console
```bash
   aws configure --profile terraform

   AWS Access Key ID [None]: *******
   AWS Secret Access Key [None]: *******
   Default region name [None]: us-east-2
   Default output format [None]:       
```   

## Usage:

1. Clone this repository  https://github.com/dr-ambika/sre_assignment.git
```bash
git clone https://github.com/dr-ambika/sre_assignment.git
cd sre_assignment
```
2. All the default variables are set in #variables.tf. It can be overridden by creating file terraform.tfvars file with new values.

3. Once done You are all set!

```bash

  terraform init
  terraform plan -out plan.out
  terraform apply plan.out```
