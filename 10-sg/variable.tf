variable "project_name" {
    default = "roboshop"
  
}

variable "environment" {
    default = "dev"
  
}

variable "sg_names" {
    default = [
        # database
        "mongodb","redis","mysql","robbitmq",
        #backend
        "catalogue","user","cart","shipping","payment",
        # frontend
        "frontend",
        # bastion
        "bastion",
        # frontend-loadbalancer
        "frontend_lb",
        # backend-ALB
        "backend_alb"
        ]
  
}