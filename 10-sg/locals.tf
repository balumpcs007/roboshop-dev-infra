locals {
  comman_tags = {
    Project_name = var.project_name
    Environment = var.environment
    DontDelete = true
  }
  comman_name_suffix = "${var.project_name}-${var.environment}"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
}