provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key

  default_tags {
    tags = {
      Terraform   = "true"
      Environment = var.environment
      Solution    = local.solution_name
      Country     = var.country
    }
  }
}
