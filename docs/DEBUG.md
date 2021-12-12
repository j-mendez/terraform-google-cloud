# Debugging

Follow to debug the containers between platforms.

## Production Management

If you need to ssh into the instance `ssh terraform@$(terraform output -raw public_ip) -i ./tf-cloud-init`.

## Cloud Init

To debug why cloud-init failed to start first ssh in and run `cat /var/log/cloud-init.log`

## Docker inspect services

inspect container by name, replace api with a service name to tail in.
