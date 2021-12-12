# Deploying GCP

In order to deploy using GCP get the service json file from [google](https://cloud.google.com/iam/docs/creating-managing-service-account-keys?authuser=4) admin dashboard and save it as `gc-service.json` in the root directory of this project.
If your using private images store your password as `my_password.txt` with the value for docker login. In order to use the DNS you need to enable it in the console and have a valid zone from cloud dns. You need to enable the [Compute Engine API](https://cloud.google.com/compute/docs/reference/rest/v1) to deploy the instance. Make sure to register your domain with Google Domains or transfer over to apply the DNS records. You can point to the IP address. After deploying you need to wait about 10 mins for the ssl certificate to validate. You can check the ip in outputs to see if everything was successful.

Follow [Terraform CLI](https://learn.hashicorp.com/tutorials/terraform/install-cli) or run step 1 if terraform is not setup (skip and just run `terraform init` in the terraform project if its installed).

1. `./build/setup-terraform-unix.sh`
1. `cat my_password.txt | docker login --username botname --password-stdin` or `docker login`
1. `gcloud auth application-default login`
1. `ssh-keygen -t rsa -C "yourdockerhubemail@someemail.com" -f ./terraform/tf-cloud-init`.

## Deploy Infastructure

1. `./deploy/init.sh`

If the machine changes and you ssh'ed your going to need to run `ssh-keygen -R "you server hostname or ip"` to delete your ssh key before running `ssh terraform@$(terraform output -raw public_ip) -i ./tf-cloud-init` with your new finger print.

## Deploy Commands

Once you add your docker hub key and get the valid keys you can simply run the `./deploy/boot.sh` to deploy a new instance and startup the containers.

1. #start `./deploy/init.sh`
1. #restart `./deploy/restart.sh`
1. #destroy `./deploy/destroy.sh`
