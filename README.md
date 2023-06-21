# kotlin-customer-api-aws-terraform
Kotlin project to deploy in AWS using terraform

Docker commands:

    docker build -t edsoncaliman/kotlin-customer-api-aws-terraform .
    
    docker run -d -p 8080:8080 kotlin-customer-api-aws-terraform
    

Swagger: 
    
    http://localhost:8080/swagger-ui/index.html


Conexão via ssh: 
    
    ssh -i /home/edsonjunior/.ssh/kotlin-spring ubuntu@IP