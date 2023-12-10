variable "aws_region" {
  type = string
}

variable "image_tag" {
  type        = string
  description = "Given image tag for the current deployment."
}

variable "service_name" {
  type        = string
  description = "the name of the service."
}

variable "ecr_registry_name" {
  type = string
}
