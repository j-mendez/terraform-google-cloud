#!/bin/bash

cd terraform 

ssh -oStrictHostKeyChecking=no terraform@$(terraform output -raw public_ip) -i ./tf-cloud-init "sh /home/terraform/build/add-ssl.sh"

cd ../