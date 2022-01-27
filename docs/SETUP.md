# Setup GCP

In order to deploy using GCP get the service json file from [google](https://cloud.google.com/iam/docs/creating-managing-service-account-keys?authuser=4) admin dashboard and save it as `gc-service.json` in the root directory of this project or use [Google Cloud CLI](https://cloud.google.com/sdk/docs/quickstart?authuser=1) to login.

In order to use the DNS you need to enable it in the console and have a valid zone from cloud dns. You need to enable the [Compute Engine API](https://cloud.google.com/compute/docs/reference/rest/v1) to deploy the instance. Make sure to register your domain with Google Domains or transfer over to apply the DNS records. You can point to the IP address. After deploying you need to wait about 10 mins for the ssl certificate to validate. You can check the ip in outputs to see if everything was successful.

Follow [Terraform CLI](https://learn.hashicorp.com/tutorials/terraform/install-cli) and [Google Cloud CLI](https://cloud.google.com/sdk/docs/quickstart?authuser=1) or run step 1 if terraform is not setup (skip and just run `terraform init` in the terraform project if its installed). For apple m1 please follow this [issue](https://github.com/hashicorp/terraform/issues/27257#issuecomment-825102330)

Locally

1. `./build/setup-terraform-unix.sh`
1. `docker login`
1. `gcloud auth application-default login`
1. `ssh-keygen -t rsa -C "yourdockerhubemail@someemail.com" -f ./terraform/tf-cloud-init`.

If your deploying via ci something like (TODO:)

1. `./build/setup-terraform-unix.sh`
1. `cat my_password.txt | docker login --username botname --password-stdin`
1. `gcloud auth application-default login`
1. `ssh-keygen -t rsa -C "yourdockerhubemail@someemail.com" -f ./terraform/tf-cloud-init`.
