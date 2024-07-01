terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.55.0"
    }
  }
}



module "ec2_instance" {
  source        = "./../../Modules/ec2s"
  instance_size = var.project_instance_type

}

module "eip_001" {
  source = "../../Modules/eips"
}

output "out_eip_public_ip" {
  value = module.eip_001.eip_public_ip

}

module "aws_ec2_instance"{
  source ="git::https://github.com/terraform-aws-modules/terraform-aws-ec2-instance"

}