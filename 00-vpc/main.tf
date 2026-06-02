module "vpc" {
    # source = "../terraform-aws-vpc"
    source = "git::https://github.com/balumpcs007/terraform-aws-vpc.git?ref=master"
    cidr_block = var.cidr_block
    project_name = var.project_name
    environmet = var.environmet
    vpc_tags = var.vpc_tags

    #Public subnet
    public_cidr_block = var.public_cidr_block

    #Private subnet
    private_cidr_block = var.private_cidr_block

     #Database subnet
    database_cidr_block = var.database_cidr_block

    is_peering_required = false
}

