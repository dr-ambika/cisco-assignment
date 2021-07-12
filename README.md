# cisco-assignment

## Description

This tool uses terraform to create load_balancer (Application/Network) in front of an any linux server on a new network or a default network with autoscaling(scale-out/scale-in) enabled based on VM Utilization on AWS Cloud. This code sets up an environment and configure nginx webserver with static web page that says **Cisco SPL**

Some of the variables listed below from **vars.tf**. Thesse values can be overrriden in **terraform.tfvars**

Variable          |                      Description                          |   Default Value
------------------|-----------------------------------------------------------|------------------
create_vpc        | Controls if VPC and its resources should be created.      | false
aws_profile       | AWS Terraform User Profile                                | terraform
aws_region        | AWS region                                                | us-east-2
availability_zones| AWS Region availability_zones                             | ["us-east-2a", "us-east-2b", "us-east-2c"]
instance_type     | AWS Instance Type                                         | t2.micro
path_to_public_key| Required to set up ssh login to instance. Can be generated using the command `sshkeygen -f mykey` | ./mykey is the default value.  This can be overridden in **terraform.tfvars file**
type              | load balancer type                                        | application

## Releases

Tag                | Description
-------------------|--------------
v1.0               | Creates Classic load balancer in front of t2.micro nginx ubuntu linux server with static webpage on default vpc
v2.0               | Creates Classic load balancer in front of t2.micro nginx ubuntu linux server with static webpage on default vpc with Autoscaling enabled
v3.0               | Creates load_balancer (Application/Network) in front of an any linux server on a new network or a default network with autoscaling(scale-out/scale-in) enabled  


## Setup instructions

1. Install the latest version of Terraform >=1.0 from the [here](https://www.terraform.io/downloads.html) Mac OS ```brew install terraform```
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
2. All the default variables are set in  **vars.tf**. It can be overridden by creating file terraform.tfvars file with new values.

3. Once done You are all set!

```bash
chmod u+x init.sh;./init.sh
```
4. To delete the resorces created run
```bash
    terraform destroy
```
### Screen Shots
1 .  Git clone and run the init.sh script
<img width="1439" alt="Screen Shot 2021-07-12 at 4 47 44 PM" src="https://user-images.githubusercontent.com/86394121/125365493-99502080-e331-11eb-9409-f881c61cd721.png">
<img width="1440" alt="Screen Shot 2021-07-12 at 4 47 55 PM" src="https://user-images.githubusercontent.com/86394121/125365570-b84eb280-e331-11eb-952d-1f11486049ed.png">

2. Launch the web page
<img width="1434" alt="Screen Shot 2021-07-12 at 4 48 13 PM" src="https://user-images.githubusercontent.com/86394121/125365597-c7cdfb80-e331-11eb-8478-b03cb7f7dcbb.png">

3. Idempotency check
<img width="1439" alt="Screen Shot 2021-07-12 at 4 49 04 PM" src="https://user-images.githubusercontent.com/86394121/125365624-d3b9bd80-e331-11eb-9047-10695f0e4630.png">
<img width="1440" alt="Screen Shot 2021-07-12 at 4 48 38 PM" src="https://user-images.githubusercontent.com/86394121/125365640-dd432580-e331-11eb-8ed1-b5eb1a09517b.png">


