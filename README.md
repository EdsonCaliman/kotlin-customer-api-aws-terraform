# kotlin-customer-api-aws-terraform
Kotlin project to deploy in AWS using terraform

Docker commands:

    docker build -t edsoncaliman/kotlin-customer-api-aws-terraform .
    
    docker run -d -p 8080:8080 kotlin-customer-api-aws-terraform
    

Swagger: 
    
    http://localhost:8080/swagger-ui/index.html


To deploy on AWS:

    #install and configure profile in awscli

    aws configure --profile kotlin-spring

    #generate de ssh key

    ssh-keygen -t ed25519

    #use the folder /home/edsonjunior/.ssh/kotlin-spring.pub or update the file security.tf resource "aws_key_pair"

    #install and use terraform, used commands

    terraform init
    terraform fmt
    terraform plan
    terraform apply
    terraform destroy
    terraform apply --auto-approve
    terraform destroy --auto-approve

    #ssh connection

    ssh -i /home/edsonjunior/.ssh/kotlin-spring ubuntu@IP