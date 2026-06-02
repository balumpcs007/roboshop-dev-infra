module "sg" {
  source = "git::https://github.com/balumpcs007/terraform-aws-sg.git?ref=master"

count = length(var.sg_names)
  project_name = var.project_name
  environment = var.environment
  sg_name = var.sg_names[count.index]
  sg_description = "created for $[count.index]"
  vpc_id = local.vpc_id
  
}

# resource "aws_security_group_rule" "frontend_to_frontend_lb" {
#   type              = "ingress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   security_group_id = module.sg[9].sg_id
#   source_security_group_id = module.sg[11].sg_id
# }




