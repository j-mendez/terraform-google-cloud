# Deploying GCP

First make sure you followed [setup](./SETUP.md)

## Deploy Infastructure

1. `./deploy/init.sh`

If the machine changes and you ssh'ed your going to need to run `ssh-keygen -R "you server hostname or ip"` to delete your ssh key before running `ssh terraform@$(terraform output -raw public_ip) -i ./tf-cloud-init` with your new finger print.

## Deploy Commands

Once you add your docker hub key and get the valid keys you can simply run the `./deploy/boot.sh` to deploy a new instance and startup the containers.

1. #start `./deploy/init.sh`
1. #restart `./deploy/restart.sh`
1. #destroy `./deploy/destroy.sh`
