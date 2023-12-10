
terraform {
  required_version = ">= 1.0.11"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.68.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.1.0"
    }
  }

  backend "s3" { /* See the backend config in config.s3.tfbackend */ }
}


variable "registry_name" {
  type = string
}

variable "aws_region" {
  type = string
}

provider "aws" {
  region = var.aws_region
}

# Create an ECR repository
resource "aws_ecr_repository" "ecr" {
  name                 = var.registry_name
  image_tag_mutability = "MUTABLE"

  tags = {
    Name = var.registry_name
  }

  image_scanning_configuration {
    scan_on_push = true
  }
}

output "registry_id" {
  description = "The account ID of the registry holding the repository."
  value       = aws_ecr_repository.ecr.registry_id
}

output "repository_url" {
  description = "The URL of the repository."
  value       = aws_ecr_repository.ecr.repository_url
}
