#!/bin/bash

sh ./deploy/copy-files.sh

cd terraform 

ssh -oStrictHostKeyChecking=no terraform@$(terraform output -raw public_ip) -i ./tf-cloud-init "sh /home/terraform/build/restart.sh"

cd ../