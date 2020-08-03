# terraform_compute_engine

Deploy Compute Engine VM

This project requires:

    Terraform
    Google Account

The main.tf file contains the resource's configurations on GCP that we want to run.

In the first section

resource "google_compute_instance" "default"

We're describing information about our virtual machine, such as type of image, scripting to execute when bootstrapping, and tags to identity this resource.

In the last section

output "ip"

Our output will be an external ip that will print a message configured on metadata_startup_script

You can access further details here. 
Let's Get Our Application Up and Running!

    terraform init

This command sets up the environment.

    terraform plan

This command reports which configuration will be applied.

    terraform apply -auto-approve

This command approves the changes automatically and applies the configuration defined on Terraform files.

    terraform destroy -auto-approve

Counteracting the command above, this removes everything created.
