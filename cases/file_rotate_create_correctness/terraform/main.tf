provider "aws" {
  version = "~> 2.53"
}

terraform {
  required_version = ">= 0.12"
  backend "s3" {}
}

module "topology" {
  source = "../../../terraform/aws_uni_topology"

  providers = {
    aws = aws
  }

  pub_key                = var.pub_key
  subject_instance_type  = var.subject_instance_type
  test_configuration     = var.test_configuration
  test_name              = var.test_name
  user_id                = var.user_id
  results_s3_bucket_name = var.results_s3_bucket_name
}
